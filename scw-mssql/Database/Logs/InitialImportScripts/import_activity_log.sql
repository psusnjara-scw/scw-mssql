--CREATE PROCEDURE ImportActivityLog 
--	@FileLocation	NVARCHAR(200),
--	@Region			CHAR(2)
--AS

DECLARE	@FileLocation	NVARCHAR(200);
DECLARE	@Region			CHAR(2);

SET @FileLocation = 'E:\SCWDemo\2020-01 Mongo Exports\US Export\scw_prod_alpha_activity.log_US.json'
SET @Region = 'US'
--
--  Import the activity_log file generated from Studio3T
-- 
DECLARE @JSON NVARCHAR(MAX) ;
DECLARE @JSONImport NVARCHAR(MAX) ;
DECLARE @SQL NVARCHAR(MAX) ;

--  Check for table existence
DROP TABLE IF EXISTS #import_activity_log;
DROP TABLE IF EXISTS #activity_log;

-- Create temporary table for bulk insert
CREATE TABLE #import_activity_log (
	activity_logDetails NVARCHAR(MAX)
);

SET @SQL = 'BULK INSERT #import_activity_log FROM ''' + @FileLocation + ''' WITH (ROWTERMINATOR = ''0x0a'' ); '
SELECT @SQL
EXEC (@SQL)
SELECT * FROM #import_activity_log

--
--  Reformat the data into the various tables
--

CREATE TABLE #activity_log (
	[ActivityLogObject_id]		NVARCHAR(24)			NOT NULL,
	ActivityLogUserObject_id	NVARCHAR(24)		NOT NULL,
	[ActivityLogTimestamp]		DATETIME2				NOT NULL,
	[CreatedDate]				DATETIME2				NOT NULL
	)
;

--  Cursor through the rows for the initial import
DECLARE @JSONShred  NVARCHAR(MAX) ; 

DECLARE JSONIMPORT CURSOR FOR
 SELECT activity_logDetails
 FROM	#activity_log

OPEN JSONIMPORT 
FETCH NEXT FROM JSONIMPORT INTO @JSONShred

WHILE @@FETCH_STATUS = 0
BEGIN

--SELECT @JSONShred 
--SELECT ISJSON(@JSONShred) AS IsValidJson


INSERT INTO #activity_log (
	   [ActivityLogObject_id]
      ,[ActivityLogUserObject_id]
      ,[ActivityLogTimestamp]
      ,[CreatedDate]
	  )
SELECT * FROM   OPENJSON (@JSONShred) 
            WITH ( 
				[ActivityLogObject_id]		NVARCHAR(40)			'$._id."$oid"' ,
				[ActivityLogUserObject_id]	NVARCHAR(40)			'$._user',
				[ActivityLogTimestamp]		DATETIME2				'$._realm',
				[CreatedDate]					NVARCHAR(40)			'$._level'
)

UPDATE #activity_log
	SET StartedDate_DEC = ROUND(CAST (CAST(StartedDate AS FLOAT) AS DECIMAL(18,1)),0),
		CompletedDate_DEC = ROUND(CAST (CAST(CompletedDate_DEC AS FLOAT) AS DECIMAL(18,1)),0)

--SELECT StartDate_DEC, CompletedDate_DEC FROM #activity_log

UPDATE #activity_log
	SET StartedDate_DEC = StartedDate_DEC / 60000,  -- convert milliseconds to minutes
		CompletedDate_DEC = CompletedDate_DEC / 60000

--SELECT StartDate_DEC, CompletedDate_DEC FROM #activity_log


INSERT INTO [dbo].[Game_013_log]
SELECT [Game_013_logObject_id]
      ,[Game_013_userObject_id]
      ,[Realm_id]
      ,[Level_id]
      ,[Quest_desc]
      ,[QuestAttempt_id]
	  ,[Repository_id]
      ,[ChallengeObject_id]
      ,[cbl]
      ,DATEADD(MINUTE, StartedDate_DEC, '1970-01-01') AS [StartedDate]
      ,DATEADD(MINUTE, CompletedDate_DEC, '1970-01-01') AS [CompletedDate]
      ,[TimeSpent]
	  ,[Points]
      ,[MaxPoints]
      ,[AttemptIndex]
      ,[Status]
      ,[isAssessment]
      ,[TotalHints]
	  ,[LanguageName]
	  ,[LanguageFramework]
	  ,[WasOvercomeBefore]

FROM	#activity_log


	TRUNCATE TABLE #activity_log
	FETCH NEXT FROM JSONIMPORT INTO @JSONShred

END

CLOSE JSONIMPORT
DEALLOCATE JSONIMPORT

/*

Debugging

SELECT len(BulkColumn) , BulkColumn
SELECT *
FROM OPENROWSET (BULK 'E:\SCWDemo\MongoExportUS\scw_prod_alpha_game_013.activity_log_US.json', SINGLE_CLOB) as j
CROSS APPLY OPENJSON(BulkColumn) 
WITH (name NVARCHAR(100) '$.name')

SELECT * FROM activity_log
ORDER BY activity_logObject_id

*/
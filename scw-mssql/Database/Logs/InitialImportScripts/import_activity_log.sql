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
--SELECT * FROM #import_activity_log

--
--  Reformat the data into the various tables
--

CREATE TABLE #activity_log (
	[ActivityLogObject_id]		NVARCHAR(24)			NOT NULL,
	[ActivityLogUserObject_id]	NVARCHAR(24)			NOT NULL,
	[ActivityLogTimestamp]		NVARCHAR(40)			NOT NULL,
	[CreatedDate]				NVARCHAR(40)				NULL
	)
;


--  Cursor through the rows for the initial import
DECLARE @JSONShred  NVARCHAR(MAX) ; 

DECLARE JSONIMPORT CURSOR FOR
 SELECT TOP 10 activity_logDetails
 FROM	#import_activity_log

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
				[ActivityLogTimestamp]		NVARCHAR(40)			'$.timestamp_halfhour."$date"', 
				[CreatedDate]				NVARCHAR(40)			'$._level'
)

-- Need to add in the : as requried whereas the source Mongo data does not have this 
-- For example, 2018-12-11T02:30:00.000 +0000 
SELECT SYSDATETIMEOFFSET ( )  ,
		LEFT(ActivityLogTimestamp,26) + ':00'
		,CONVERT(DATETIMEOFFSET, LEFT(ActivityLogTimestamp,26) + ':00') 
	FROM #activity_log

INSERT INTO [Log].[ActivityLog] (
		[ActivityLogObject_id]
       ,[ActivityLogUserID]
       ,[ActivityLogTimestamp]
	  )
SELECT [ActivityLogObject_id]
      ,[ActivityLogUserID]
      ,[ActivityLogTimestamp]
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
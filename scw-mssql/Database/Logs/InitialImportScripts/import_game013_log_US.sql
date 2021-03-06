
--
--  Import the Game013_log file generated from Studio3T
-- 
DECLARE @JSON NVARCHAR(MAX) ;
DECLARE @JSONImport NVARCHAR(MAX) ;


TRUNCATE TABLE import_Game013_log_US
/*
CREATE TABLE Import_Game013_log_US (
	Game013_logDetails NVARCHAR(MAX)
);
*/

BULK INSERT dbo.import_Game013_log_US
FROM 'E:\SCWDemo\MongoExportUS\scw_prod_alpha_game_013.log_US.json' 
WITH (
    ROWTERMINATOR = '0x0a'
);


--SELECT * FROM dbo.import_Game013_log_EU
--  SELECT * FROM #Game013_log_US
--
--  Reformat the data into the various tables
--

DROP TABLE #Game013_log_US;

CREATE TABLE #Game013_log_US (
	[Game_013_logObject_id]		NVARCHAR(40)			NOT NULL,
	[Game_013_userObject_id]	NVARCHAR(40)			NULL,
	[Realm_id]					NVARCHAR(40)			NULL,
	[Level_id]					NVARCHAR(40)			NULL,
	[Quest_desc]				NVARCHAR(40)			NULL,
	[QuestAttempt_id]			NVARCHAR(40)			NULL,
	[Repository_id]				NVARCHAR(40)			NULL,
	[ChallengeObject_id]		NVARCHAR(40)			NULL,
	[cbl]						NVARCHAR(40)			NULL,
	[StartedDate]				NVARCHAR(40)			NULL,
	[StartedDate_DEC]			DECIMAL(14,1)			NULL,
	[CompletedDate]				NVARCHAR(40)			NULL,
	[CompletedDate_DEC]			DECIMAL(14,1)			NULL,
	[TimeSpent]					DECIMAL(14,1)			NULL,
	[Points]					INTEGER					NULL,
	[MaxPoints]					INTEGER					NULL,
	[AttemptIndex]				NVARCHAR(40)			NULL,
	[Status]					NVARCHAR(40)			NULL,
	[isAssessment]				BIT						NULL,
	[TotalHints]				INTEGER					NULL, 
	[LanguageName]				NVARCHAR(40)			NULL,
	[LanguageFramework]			NVARCHAR(40)			NULL,
	[WasOvercomeBefore]			BIT						NULL
	)
;

DECLARE @JSONShred  NVARCHAR(MAX) ; 

DECLARE JSONIMPORT CURSOR FOR
 SELECT Game013_logDetails
 FROM dbo.import_Game013_log_US

OPEN JSONIMPORT 
FETCH NEXT FROM JSONIMPORT INTO @JSONShred

WHILE @@FETCH_STATUS = 0
BEGIN

--SELECT @JSONShred 
--SELECT ISJSON(@JSONShred) AS IsValidJson


INSERT INTO #Game013_log_US (
	   [Game_013_logObject_id]
      ,[Game_013_userObject_id]
      ,[Realm_id]
      ,[Level_id]
      ,[Quest_desc]
      ,[QuestAttempt_id]
	  ,[Repository_id]
      ,[ChallengeObject_id]
      ,[cbl]
      ,[StartedDate]
      ,[CompletedDate]
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
)
SELECT * FROM   OPENJSON (@JSONShred) 
            WITH(
				[Game_013_logObject_id]		NVARCHAR(40)			'$._id."$oid"' ,
				[Game_013_userObject_id]	NVARCHAR(40)			'$._user',
				[Realm_id]					NVARCHAR(40)			'$._realm',
				[Level_id]					NVARCHAR(40)			'$._level',
				[Quest_desc]				NVARCHAR(40)			'$._quest',
				[QuestAttempt_id]			NVARCHAR(40)			'$._questAttempt',
				[Repository_id]				NVARCHAR(40)			'$._repo',
				[ChallengeObject_id]		NVARCHAR(40)			'$._challenge',
				[cbl]						NVARCHAR(40)			'$.cbl',
				[StartedDate]				NVARCHAR(40)			'$.started',
				[CompletedDate]				NVARCHAR(40)			'$.completed',
				[TimeSpent]					DECIMAL(14,1)			'$.timeSpent',
				[Points]					INTEGER					'$.points',
				[MaxPoints]					INTEGER					'$.max',
				[AttemptIndex]				NVARCHAR(40)			'$.attemptIndex',
				[Status]					NVARCHAR(40)			'$.status',
				[isAssessment]				BIT						'$.isAssessment',
				[TotalHints]				INTEGER					'$.hints.total', 
				[LanguageName]				NVARCHAR(40)			'$.language._id',
				[LanguageFramework]			NVARCHAR(40)			'$.language._framework',
				[WasOvercomeBefore]			BIT						'$.wasOvercomeBefore'
)

UPDATE #Game013_log_US
	SET StartedDate_DEC = ROUND(CAST (CAST(StartedDate AS FLOAT) AS DECIMAL(18,1)),0),
		CompletedDate_DEC = ROUND(CAST (CAST(CompletedDate_DEC AS FLOAT) AS DECIMAL(18,1)),0)

--SELECT StartDate_DEC, CompletedDate_DEC FROM #Game013_log_US

UPDATE #Game013_log_US
	SET StartedDate_DEC = StartedDate_DEC / 60000,  -- convert milliseconds to minutes
		CompletedDate_DEC = CompletedDate_DEC / 60000

--SELECT StartDate_DEC, CompletedDate_DEC FROM #Game013_log_US


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

FROM	#Game013_log_US


	TRUNCATE TABLE #Game013_log_US
	FETCH NEXT FROM JSONIMPORT INTO @JSONShred

END

CLOSE JSONIMPORT
DEALLOCATE JSONIMPORT

/*

Debugging

SELECT len(BulkColumn) , BulkColumn
SELECT *
FROM OPENROWSET (BULK 'E:\SCWDemo\MongoExportEU\scw_prod_alpha_game_013.Game013_log_EU.json', SINGLE_CLOB) as j
CROSS APPLY OPENJSON(BulkColumn) 
WITH (name NVARCHAR(100) '$.name')

SELECT * FROM Game013_log
ORDER BY Game013_logObject_id

*/
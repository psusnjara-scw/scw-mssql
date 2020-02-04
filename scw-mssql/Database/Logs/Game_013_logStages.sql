CREATE TABLE [Log].[Game_013_logStages]
(
    [Game_013_logStagesID]		BIGINT IDENTITY(1,1)	NOT NULL,
	[Game_013_logID]			BIGINT					NOT NULL,
	[StageNumber]				INTEGER					NULL,
	[StartedDate]				DATETIME2				NULL,
	[CompletedDate]				DATETIME2				NULL,
	[Points]					INTEGER					NULL,
	[AttemptIndex]				NVARCHAR(40)			NULL,
	[Status]					NVARCHAR(40)			NULL,
	[Solutions]					NVARCHAR(100)			NULL,
	[Answer]					NVARCHAR(40)			NULL,
	[PointsBreakdownMax]		INTEGER					NULL,
	[PontsBreakdownBase]		INTEGER					NULL,
	[AppScaling]				INTEGER					NULL,
	[DiffScaling]				FLOAT					NULL,
	[FailedAttempts]			INTEGER					NULL,
	[FailedAttemptsScaling]		FLOAT					NULL,
	[HintsGiven]				INTEGER					NULL,
	[HintsGivenScaling]			FLOAT					NULL,
	[Mercy]						INTEGER					NULL,
	[Earned]					INTEGER					NULL,

    CONSTRAINT PK_Game_013_logStages PRIMARY KEY CLUSTERED ([Game_013_logStagesID]),
	CONSTRAINT FK_Game_013_logStages_Game_013_LogID FOREIGN KEY (Game_013_logID) REFERENCES [Log].[Game_013_log] (Game_013_logID)

);


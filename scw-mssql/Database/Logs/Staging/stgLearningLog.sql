
CREATE TABLE [Log].[stgLearningLog]
(
	[stgLearningLogID]		BIGINT IDENTITY(1,1)	NOT NULL,
    [ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgLearningLog_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgLearningLog PRIMARY KEY CLUSTERED ([stgLearningLogID])
)

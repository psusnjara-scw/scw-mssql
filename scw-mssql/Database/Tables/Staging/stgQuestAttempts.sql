
CREATE TABLE [dbo].[stgQuestAttempts]
(
	[stgQuestAttemptsID]		BIGINT IDENTITY(1,1)	NOT NULL,
    [ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgQuestAttempts_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgQuestAttempts PRIMARY KEY CLUSTERED ([stgQuestAttemptsID])
)

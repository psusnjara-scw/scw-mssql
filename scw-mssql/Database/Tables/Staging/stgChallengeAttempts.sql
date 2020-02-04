
CREATE TABLE [dbo].[stgChallengeAttempts]
(
	[stgChallengeAttemptsID]		BIGINT IDENTITY(1,1)	NOT NULL,
    [ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgChallengeAttempts_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgChallengeAttempts PRIMARY KEY CLUSTERED ([stgChallengeAttemptsID])
)

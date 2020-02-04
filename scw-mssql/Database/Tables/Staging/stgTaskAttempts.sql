CREATE TABLE [dbo].[stgTaskAttempts]
(
	[stgTaskAttemptsID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgTaskAttempts_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgTaskAttempts PRIMARY KEY CLUSTERED ([stgTaskAttemptsID])
)

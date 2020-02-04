CREATE TABLE [dbo].[stgInvalidChallenges]
(
	[stgInvalidChallengesID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgInvalidChallenges_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgInvalidChallenges PRIMARY KEY CLUSTERED ([stgInvalidChallengesID])
)

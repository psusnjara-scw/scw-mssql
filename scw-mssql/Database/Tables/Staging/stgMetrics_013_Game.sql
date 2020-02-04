CREATE TABLE [dbo].[stgMetrics_013_Game]
(
	[stgMetrics_013_GameID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgMetrics_013_Game_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgMetrics_013_Game PRIMARY KEY CLUSTERED ([stgMetrics_013_GameID])
)

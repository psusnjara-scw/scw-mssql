CREATE TABLE [dbo].[stgMetricsOutputLeaderboard]
(
	[stgMetricsOutputLeaderboardID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgMetricsOutputLeaderboard_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgMetricsOutputLeaderboard PRIMARY KEY CLUSTERED ([stgMetricsOutputLeaderboardID])
)

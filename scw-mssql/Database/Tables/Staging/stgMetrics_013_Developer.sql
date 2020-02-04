CREATE TABLE [dbo].[stgMetrics_013_Developer]
(
	[stgMetrics_013_DeveloperID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgMetrics_013_Developer_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgMetrics_013_Developer PRIMARY KEY CLUSTERED ([stgMetrics_013_DeveloperID])
)

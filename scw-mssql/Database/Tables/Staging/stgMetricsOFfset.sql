CREATE TABLE [dbo].[stgMetricsOffset]
(
	[stgMetricsOffsetID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgMetricsOffset_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgMetricsOffset PRIMARY KEY CLUSTERED ([stgMetricsOffsetID])
)

CREATE TABLE [dbo].[stgMetricsState]
(
	[stgMetricsStateID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgMetricsState_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgMetricsState PRIMARY KEY CLUSTERED ([stgMetricsStateID])
)

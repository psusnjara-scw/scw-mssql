CREATE TABLE [dbo].[stgMetrics_013_Management]
(
	[stgMetrics_013_ManagementID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgMetrics_013_Management_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgMetrics_013_Management PRIMARY KEY CLUSTERED ([stgMetrics_013_ManagementID])
)

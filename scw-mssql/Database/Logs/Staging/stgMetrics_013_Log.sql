﻿CREATE TABLE [Log].[stgMetrics_013_Log]
(
	[stgMetrics_013_LogID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgMetrics_013_Log_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgMetrics_013_Log PRIMARY KEY CLUSTERED ([stgMetrics_013_LogID])
)

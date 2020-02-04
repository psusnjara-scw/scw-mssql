﻿CREATE TABLE [Log].[stgRatingsLog]
(
	[stgRatingsLogID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgRatingsLog_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgRatingsLog PRIMARY KEY CLUSTERED ([stgRatingsLogID])
)

﻿CREATE TABLE [dbo].[stgUserPreferences]
(
	[stgUserPreferencesID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgUserPreferences_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgUserPreferences PRIMARY KEY CLUSTERED ([stgUserPreferencesID])
)

﻿CREATE TABLE [dbo].[stgTeams]
(
	[stgTeamsID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgTeams_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgTeams PRIMARY KEY CLUSTERED ([stgTeamsID])
)

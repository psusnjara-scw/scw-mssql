﻿CREATE TABLE [dbo].[stgUsers]
(
	[stgUsersID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgUsers_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgUsers PRIMARY KEY CLUSTERED ([stgUsersID])
)

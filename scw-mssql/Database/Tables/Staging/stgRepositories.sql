﻿CREATE TABLE [dbo].[stgRepositories]
(
	[stgRepositoriesID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgRepositories_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgRepositories PRIMARY KEY CLUSTERED ([stgRepositoriesID])
)

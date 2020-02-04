CREATE TABLE [dbo].[stgSenseiCodeBase]
(
	[stgSenseiCodeBaseID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgSenseiCodeBase_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgSenseiCodeBase PRIMARY KEY CLUSTERED ([stgSenseiCodeBaseID])
)

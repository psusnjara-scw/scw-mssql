CREATE TABLE [dbo].[stgSourceCode]
(
	[stgSourceCodeID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgSourceCode_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgSourceCode PRIMARY KEY CLUSTERED ([stgSourceCodeID])
)

CREATE TABLE [dbo].[stgSenseiBuild]
(
	[stgSenseiBuildID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgSenseiBuild_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgSenseiBuild PRIMARY KEY CLUSTERED ([stgSenseiBuildID])
)

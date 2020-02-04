CREATE TABLE [dbo].[stgSolutions]
(
	[stgSolutionsID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgSolutions_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgSolutions PRIMARY KEY CLUSTERED ([stgSolutionsID])
)

CREATE TABLE [dbo].[stgCategories]
(
	[stgCategoriesID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgCategories_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgCategories PRIMARY KEY CLUSTERED ([stgCategoriesID])
)

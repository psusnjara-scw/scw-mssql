CREATE TABLE [dbo].[stgCompanies]
(
	[stgCompaniesID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgCompanies_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgCompanies PRIMARY KEY CLUSTERED ([stgCompaniesID])
)

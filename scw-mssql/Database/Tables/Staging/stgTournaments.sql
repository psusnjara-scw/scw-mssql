
CREATE TABLE [dbo].[stgTournaments]
(
	[stgTournamentsID]		BIGINT IDENTITY(1,1)	NOT NULL,
    [ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgTournaments_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgTournaments PRIMARY KEY CLUSTERED ([stgTournamentsID])
)


CREATE TABLE [dbo].[stgAnonymousUsers]
(
	[stgAnonymousUsersID]		BIGINT IDENTITY(1,1)	NOT NULL,
    [ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgAnonymousUsers_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgAnonymousUsers PRIMARY KEY CLUSTERED ([stgAnonymousUsersID])
)


CREATE TABLE [dbo].[stgIntercomLog]
(
	[stgIntercomLogID]		BIGINT IDENTITY(1,1)	NOT NULL,
    [ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgIntercomLog_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgIntercomLog PRIMARY KEY CLUSTERED ([stgIntercomLogID])
)

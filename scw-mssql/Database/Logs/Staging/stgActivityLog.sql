CREATE TABLE [Log].[stgActivityLog]
(
	[stgActivityLogID]		BIGINT IDENTITY(1,1)	NOT NULL,
    [ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgActivityLog_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgActivityLog PRIMARY KEY CLUSTERED ([stgActivityLogID]) 

)

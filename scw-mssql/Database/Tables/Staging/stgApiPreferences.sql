
CREATE TABLE [dbo].[stgApiPreferences]
(
	[stgApiPreferencesID]		BIGINT IDENTITY(1,1)	NOT NULL,
    [ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgApiPreferences_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgApiPreferences PRIMARY KEY CLUSTERED ([stgApiPreferencesID])
)

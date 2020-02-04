/*
  This is the table for the scw_prod_alpha_api.log collection.  Not to be confused with the api_log collection
*/
CREATE TABLE [Log].[stgApiEventLog]
(
	[stgApiEventLogID]		BIGINT IDENTITY(1,1)	NOT NULL,
    [ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgApiEventLog_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgApiEventLog PRIMARY KEY CLUSTERED ([stgApiEventLogID])
)

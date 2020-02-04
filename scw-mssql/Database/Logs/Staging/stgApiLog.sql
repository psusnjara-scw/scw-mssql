/*
  This is the table for the scw_prod_alpha_api.api_log collection.  Not to be confused with the log collection
*/
CREATE TABLE [Log].[stgApiLog]
(
	[stgApiLogID]		BIGINT IDENTITY(1,1)	NOT NULL,
    [ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgApiLog_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgApiLog PRIMARY KEY CLUSTERED ([stgApiLogID])
)

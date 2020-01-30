/*
  This is the table for the scw_prod_alpha_api.log collection.  Not to be confused with the api_log collection
*/
CREATE TABLE [dbo].[ApiEventLog]
(
	[ApiEventLogID]				BIGINT IDENTITY(1,1)	NOT NULL,
    [ApiLogObject_id]			BINARY(12)			NOT NULL,
	[Event]						NVARCHAR(40)		NOT NULL,
	[ApiEventLogTimestamp]		DATETIME2			NOT NULL,

	[ApiEventLogUserID]			BIGINT				NULL,
	[ApiEventLogCompanyID]		BIGINT				NULL,
	[ApiEventLogTeamID]			BIGINT				NULL,

	CONSTRAINT PK_ApiEventLog PRIMARY KEY CLUSTERED ([ApiEventLogID])
)

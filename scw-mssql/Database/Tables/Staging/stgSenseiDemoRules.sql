CREATE TABLE [dbo].[stgSenseiDemoRules]
(
	[stgSenseiDemoRulesID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgSenseiDemoRules_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgSenseiDemoRules PRIMARY KEY CLUSTERED ([stgSenseiDemoRulesID])
)

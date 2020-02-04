CREATE TABLE [dbo].[stgSenseiGuidelines]
(
	[stgSenseiGuidelinesID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgSenseiGuidelines_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgSenseiGuidelines PRIMARY KEY CLUSTERED ([stgSenseiGuidelinesID])
)

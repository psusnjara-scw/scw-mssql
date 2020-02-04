
CREATE TABLE [dbo].[stgAssessments]
(
	[stgAssessmentsID]		BIGINT IDENTITY(1,1)	NOT NULL,
    [ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgAssessments_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgAssessments PRIMARY KEY CLUSTERED ([stgAssessmentsID])
)

CREATE TABLE [dbo].[stgMetricsStrengthsWeaknesses]
(
	[stgMetricsStrengthsWeaknessesID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgMetricsStrengthsWeaknesses_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgMetricsStrengthsWeaknesses PRIMARY KEY CLUSTERED ([stgMetricsStrengthsWeaknessesID])
)

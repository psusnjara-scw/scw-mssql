CREATE TABLE [dbo].[stgTrainingUsers]
(
	[stgTrainingUsersID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgTrainingUsers_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgTrainingUsers PRIMARY KEY CLUSTERED ([stgTrainingUsersID])
)

﻿CREATE TABLE [Log].[stgUserChallengeLogs]
(
	[stgUserChallengeLogsID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgUserChallengeLogs_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgUserChallengeLogs PRIMARY KEY CLUSTERED ([stgUserChallengeLogsID])
)

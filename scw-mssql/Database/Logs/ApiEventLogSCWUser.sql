CREATE TABLE [Log].[ApiEventLogSCWUser](
	[ApiEventLogUserID]				BIGINT IDENTITY (1,1)	NOT NULL,
	[ApiEventLogID]					BIGINT					NOT NULL,
	[ApiEventLogTeamID]				BIGINT					NOT NULL,
	[ApiEventLogCompanyID]			BIGINT					NOT NULL,

    CONSTRAINT PK_ApiEventLogSCWUser PRIMARY KEY CLUSTERED ([ApiEventLogUserID]),
	CONSTRAINT FK_ApiEventLogSCWUser_ApiEventLog_ApiEventLogID FOREIGN KEY (ApiEventLogID) REFERENCES [Log].[ApiEventLog] (ApiEventLogID),
	CONSTRAINT FK_ApiEventLogSCWUser_Team_TeamID FOREIGN KEY (ApiEventLogTeamID) REFERENCES [Log].[ApiEventLogTeam] (ApiEventLogTeamID)
);

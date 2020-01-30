CREATE TABLE [dbo].[ApiEventLogSCWUser](
	[ApiEventLogUserID]				INTEGER IDENTITY (1,1)	NOT NULL,
	[ApiEventLogID]					BIGINT					NOT NULL,
	[ApiEventLogTeamID]				INTEGER					NOT NULL,
	[ApiEventLogCompanyID]			INTEGER					NOT NULL,

    CONSTRAINT PK_ApiEventLogSCWUser PRIMARY KEY CLUSTERED ([ApiEventLogUserID]),
	CONSTRAINT FK_ApiEventLogSCWUser_ApiEventLog_ApiEventLogID FOREIGN KEY (ApiEventLogID) REFERENCES [dbo].[ApiEventLog] (ApiEventLogID)
	--CONSTRAINT FK_ApiEventLogSCWUser_Team_TeamID FOREIGN KEY (ApiEventLogTeamID) REFERENCES [dbo].[ApiEventLogTeam] (TeamID)
);

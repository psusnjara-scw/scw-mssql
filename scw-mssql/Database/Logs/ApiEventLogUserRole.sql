CREATE TABLE [Log].[ApiEventLogUserRole]
(
	[ApiEventLogUserRoleID]	BIGINT IDENTITY(1,1)	NOT NULL,
	[ApiEventLogUserAuthID]	BIGINT					NOT NULL,
	[ApiEventLogUserID]		BIGINT					NOT NULL,
	[ApiEventLogUserRoleDesc]	NVARCHAR(60)			NOT NULL,

	CONSTRAINT PK_ApiEventLogUserRole PRIMARY KEY CLUSTERED ([ApiEventLogUserRoleID]),
	CONSTRAINT FK_ApiEventLogUserRole_ApiEventLogSCWUser_UserID FOREIGN KEY (ApiEventLogUserID) REFERENCES [Log].[ApiEventLogSCWUser] (ApiEventLogUserID)
)

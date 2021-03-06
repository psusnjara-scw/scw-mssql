﻿CREATE TABLE [Log].[ApiEventLogUserProfile]
(
	[ApiEventLogUserProfileID]	BIGINT IDENTITY(1,1)	NOT NULL,
	[ApiEventLogUserID]			BIGINT					NOT NULL,
	[ProfileComplete]			BIT						NOT NULL,
	[FirstName]					NVARCHAR(50)			NOT NULL,
	[MiddleName]				NVARCHAR(50)			NULL,
	[LastName]					NVARCHAR(50)			NOT NULL,
	[DisplayName]				NVARCHAR(50)			NULL,
	[I18nLanguagePreference]	NVARCHAR(10)			NULL,
	[I18nSet]					BIT						NOT NULL,
	[UserTimeZone]				INTEGER					NULL, --  This is an offset, should it be recorded differently
	[MetricsPublic]				BIT						NOT NULL,
	[UserAvatar]				NVARCHAR(150)			NULL,
	[InviterUserID]				INTEGER					NOT NULL,				
	[InviteSource]				NVARCHAR(80)			NULL,
	[UserStatus]				NVARCHAR(20)			NULL,
	[PlatformManaged]			BIT						NULL,
	[RegisteredDate]			DATETIME2				NULL,
	[InvitedDate]				DATETIME2				NULL,
	[NudgeDate]					DATETIME2				NULL,
	[GameStatus]				NVARCHAR(20)			NULL,
	[State]						NVARCHAR(20)			NULL,
	[Game013HomeCountry]		NVARCHAR(60)			NULL,
	[IntercomSecureModeHash]	NVARCHAR(200)			NULL,
    [SenseiInstalledDate]		DATETIME2				NULL,
    [SenseiToken]				NVARCHAR(200)			NULL,
	[ResourceID]				NVARCHAR(100)			NULL,
	[UserEmail]					NVARCHAR(150)			NULL,

	CONSTRAINT PK_ApiEventLogUserProfile PRIMARY KEY CLUSTERED ([ApiEventLogUserProfileID]),
	CONSTRAINT FK_ApiEventLogUserProfile_ApiEventLogSCWUser_UserID FOREIGN KEY (ApiEventLogUserID) REFERENCES [Log].[ApiEventLogSCWUser] (ApiEventLogUserID)

)

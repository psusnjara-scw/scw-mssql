CREATE TABLE [dbo].[UserPreference]
(
	[UserPreferenceID]			INTEGER IDENTITY(1,1)	NOT NULL,
	[UserID]					INTEGER					NOT NULL,
	[UserPreferenceValuesID]	INTEGER					NOT NULL,
	
	CONSTRAINT PK_UserPreference PRIMARY KEY CLUSTERED ([UserPreferenceID]),
	CONSTRAINT FK_UserPreference_SCWUser_UserID FOREIGN KEY (UserID) REFERENCES [dbo].[SCWUser] (UserID),
	CONSTRAINT FK_UserPreference_UserPreferenceValues_ValuesID FOREIGN KEY (UserPreferenceValuesID) REFERENCES dbo.UserPreferenceValues (UserPreferenceValuesID)
)

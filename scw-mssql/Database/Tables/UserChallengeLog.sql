CREATE TABLE [dbo].[UserChallengLog] (
	[UserChallengLogID]			INTEGER	IDENTITY(1,1)	NOT NULL,
	[UserChallengLogObject_id]	NVARCHAR(40)			NOT NULL,
	[UserID]					INTEGER					NOT NULL,
	[ChallengeID]				INTEGER					NOT NULL,
	[LanguageID]				INTEGER					NOT NULL,
	[CategoryName]				NVARCHAR(40)			NULL,
	[SubCategoryName]			NVARCHAR(40)			NULL,
	[Difficulty]				INTEGER					NULL,
	[QuestionType]				NVARCHAR(40)			NULL,
	[Source]					NVARCHAR(40)			NULL,
	
	CONSTRAINT PK_UserChallengLog PRIMARY KEY CLUSTERED ([UserChallengLogID]),
	CONSTRAINT FK_UserChallengLog_SCWUser_UserID FOREIGN KEY (UserID) REFERENCES [dbo].[SCWUser] (UserID),
	CONSTRAINT FK_UserChallengLog_Challenge_ChallengeID FOREIGN KEY (ChallengeID) REFERENCES [dbo].[Challenge] (ChallengeID),
	CONSTRAINT FK_UserChallengLog_Language_LanguageID FOREIGN KEY (LanguageID) REFERENCES [dbo].[Language] (LanguageID)

);

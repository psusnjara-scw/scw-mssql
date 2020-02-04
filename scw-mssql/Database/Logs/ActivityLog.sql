CREATE TABLE [Log].[ActivityLog]
(
	[ActivityLogID]				BIGINT IDENTITY(1,1)	NOT NULL,
	[ActivityLogObject_id]		VARBINARY(12)			NOT NULL,
	[ActivityLogUserID]			BIGINT					NOT NULL,
	[ActivityLogTimestamp]		DATETIME2				NOT NULL,

	CONSTRAINT PK_ActivityLog PRIMARY KEY CLUSTERED ([ActivityLogID])
--	CONSTRAINT FK_ActivityLog_User_UserID FOREIGN KEY (ActivityLogUserID) REFERENCES [dbo].[SCWUser] (UserID)
)

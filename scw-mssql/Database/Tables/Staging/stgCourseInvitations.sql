CREATE TABLE [dbo].[stgCourseInvitations]
(
	[stgCourseInvitationsID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgCourseInvitations_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgCourseInvitations PRIMARY KEY CLUSTERED ([stgCourseInvitationsID])
)

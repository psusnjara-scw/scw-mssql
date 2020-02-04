CREATE TABLE [dbo].[stgCourseUsers]
(
	[stgCourseUsersID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgCourseUsers_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgCourseUsers PRIMARY KEY CLUSTERED ([stgCourseUsersID])
)

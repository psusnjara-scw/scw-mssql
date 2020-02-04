/*
  This is the user_course collection in the scw_prod_alpha_courses database
*/
CREATE TABLE [dbo].[stgUserCourseMapping]
(
	[stgUserCourseMappingID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgUserCourseMapping_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgUserCourseMapping PRIMARY KEY CLUSTERED ([stgUserCourseMappingID])
)

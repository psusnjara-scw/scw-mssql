﻿CREATE TABLE [dbo].[stgEntityCourseMapping]
(
	[stgEntityCourseMappingID]		BIGINT IDENTITY (1,1)	NOT NULL,
	[ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgEntityCourseMapping_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgEntityCourseMapping PRIMARY KEY CLUSTERED ([stgEntityCourseMappingID])
)

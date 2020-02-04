CREATE TABLE [Log].[ActivityLogValue]
(
	[ActivityLogValueID]		BIGINT IDENTITY(1,1)	NOT NULL,
	[ActivityLogID]				BIGINT 					NOT NULL,
	[Value]						NVARCHAR(200)			NOT NULL,

	CONSTRAINT PK_ActivityLogValue PRIMARY KEY CLUSTERED ([ActivityLogValueID])
)

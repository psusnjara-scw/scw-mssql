CREATE TABLE [dbo].[IntercomLog] (
	[IntercomLogID]				INTEGER IDENTITY (1,1)	NOT NULL,
	[IntercomLogObject_id]		NVARCHAR(40)			NOT NULL,
	[IntercomLogError]			NVARCHAR(60)			NOT NULL,
	[IntercomLogSourceEvent]	NVARCHAR(40)			NOT NULL,
	[IntercomLogType]			NVARCHAR(40)			NOT NULL,
	[IntercomLogResource]		NVARCHAR(MAX)			NOT NULL,
	[IntercomLogRequest]		NVARCHAR(MAX)			NOT NULL,

	CONSTRAINT PK_IntercomLog PRIMARY KEY CLUSTERED ([IntercomLogID])
);
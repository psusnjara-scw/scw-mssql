CREATE TABLE [Log].[ApiLogFwdPath] (
   [ApiLogFwdPathID]				BIGINT IDENTITY(1,1)	NOT NULL,
   [ApiLogID]						BIGINT					NOT NULL,
   [PathValue]						NVARCHAR(100)			NULL,
   [LastUpdatedUTCDate]				DATETIME2				NOT NULL,
   
   	CONSTRAINT PK_ApiLogFwdPath PRIMARY KEY CLUSTERED ([ApiLogFwdPathID]),
	CONSTRAINT FK_ApiLogFwdPath_ApiLog_ApiLogID FOREIGN KEY (ApiLogID) REFERENCES [Log].[ApiLog] (ApiLogID),

);

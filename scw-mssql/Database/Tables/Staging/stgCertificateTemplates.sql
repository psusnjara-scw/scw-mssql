
CREATE TABLE [dbo].[stgCertificateTemplates]
(
	[stgCertificateTemplatesID]		BIGINT IDENTITY(1,1)	NOT NULL,
    [ChangeStreamDetails]	NVARCHAR(MAX)	NOT NULL,
	[InsertedUTCDate]		DATETIMEOFFSET	NOT NULL	CONSTRAINT DF_stgCertificateTemplates_InsertedUTCDate DEFAULT GETUTCDATE() ,

	CONSTRAINT PK_stgCertificateTemplates PRIMARY KEY CLUSTERED ([stgCertificateTemplatesID])
)

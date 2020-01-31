
CREATE TABLE [Log].[ApiEventLogCompany] (
    [ApiEventLogCompanyCompanyID]					INTEGER IDENTITY (1,1)	NOT NULL,
	[ApiEventLogID]				BIGINT					NOT NULL,
    [CompaniesObject_id]		NVARCHAR(40)			NOT NULL,
	[CompanyMongoIDHash]		BINARY(16)				NOT NULL,
    [SsoErrorMessage]			NVARCHAR(20)			NULL,  -- appears to be null always ?
	[AccountOwnerID]			INTEGER					NOT NULL,			-- FK to user
    [ExpirationDate]			DATETIME2				NULL, -- DOUBLE PRECISION,  -- convert to date 
    [CompanyLogo]				NVARCHAR(250)			NULL,  -- path to replace image
    [CompanySizeID]				INTEGER					NOT NULL,
    [CompanyName]				NVARCHAR(150)			NOT NULL,
    [CustomerTypeID]			INTEGER					NOT NULL,
    [CustomerIndustryID]		INTEGER					NOT NULL,
    [I18nLanguagePreference]	CHAR(2)					NULL,
    [OnboardingMessage]			NVARCHAR(150)			NULL,  -- 123 is the maximum
    [LoginImage]				NVARCHAR(250)			NULL,  -- path to replace image
    [CustomerRegionID]			INTEGER					NOT NULL,
    [CustomerSalesforceID]		NVARCHAR(50)			NOT NULL,
    [CustomerStatus]			NVARCHAR(10)			NULL,
	[CreatedDate]				DATETIME2				NOT NULL, -- Extract from _id
	[DataSource]				NCHAR(2)				NOT NULL,

    CONSTRAINT PK_ApiEventLogCompany PRIMARY KEY CLUSTERED ([ApiEventLogCompanyCompanyID]),
	CONSTRAINT FK_ApiEventLogCompany_ApiEventLog_ApiEventLogID FOREIGN KEY (ApiEventLogID) REFERENCES [Log].[ApiEventLog] (ApiEventLogID)
	--CONSTRAINT FK_ApiEventLogCompany_CompanySize_CompanySizeID FOREIGN KEY (CompanySizeID) REFERENCES [dbo].[CompanySize] (CompanySizeID),
	--CONSTRAINT FK_ApiEventLogCompany_CustomerType_CustomerTypeID FOREIGN KEY (CustomerTypeID) REFERENCES [dbo].[CustomerType] (CustomerTypeID)
	
);

--CREATE PROCEDURE ImportUsers 
--	@FileLocation	NVARCHAR(200),
--	@Region			CHAR(2)
--AS

DECLARE	@FileLocation	NVARCHAR(200);
DECLARE	@Region			CHAR(2);

SET @FileLocation = 'E:\SCWDemo\2020-01 Mongo Exports\US Export\scw_prod_alpha_api.users_US.json'
SET @Region = 'US'

--
--  Extract the data from the import json file generated from Studio3T
-- 
DECLARE @JSON NVARCHAR(MAX) ;
DECLARE @JSONImport NVARCHAR(MAX) ;
DECLARE @SQL NVARCHAR(MAX) ;


--  Check for table existence
DROP TABLE IF EXISTS #import_users;
DROP TABLE IF EXISTS #SCWUser;


-- Create temporary table for bulk insert
CREATE TABLE #import_users (
	UserDetails NVARCHAR(MAX)
);

SET @SQL = 'BULK INSERT #import_users FROM ''' + @FileLocation + ''' WITH (ROWTERMINATOR = ''0x0a'' ); '
SELECT @SQL
EXEC (@SQL)

--SELECT * FROM #import_users

--
--  Reformat the data into the user table
--

CREATE TABLE #SCWUser (
		[UsersObject_id]			NVARCHAR(40)			NOT NULL,
		[UserTeamID]				INTEGER					NULL,
		[UserCompanyID]				INTEGER					NULL,
		[UsersCompanyObject_id]		NVARCHAR(40)			NULL,
		[ProfileComplete]			BIT						NULL,
		[FirstName]					NVARCHAR(50)			NULL,
		[MiddleName]				NVARCHAR(50)			NULL,
		[LastName]					NVARCHAR(50)			NULL,
		[I18nLanguagePreference]	NVARCHAR(10)			NULL,
		[I18nSet]					BIT						NULL,
		[UserTimeZone]				NVARCHAR(40)			NULL, --  This is an offset, should it be recorded differently
		[MetricsPublic]				BIT						NULL,
		[UserAvatar]				NVARCHAR(150)			NULL,
		[InviterUserID]				INTEGER					NULL,				
		[InviteSource]				NVARCHAR(80)			NULL,
		[ActivationToken]			NVARCHAR(100)			NULL,
		[UserStatus]				NVARCHAR(20)			NULL,
		[SAMLAttributes]			NVARCHAR(20)			NULL,
		[PlatformManaged]			NVARCHAR(20)			NULL,
		
		[RegisteredDate]			NVARCHAR(40)			NULL,
		[RegisteredDate_DEC]		DECIMAL(14,1)			NULL,
		[InvitedDate]				NVARCHAR(40)			NULL,
		[InvitedDate_DEC]			DECIMAL(14,1)			NULL,
		[NudgeDate]					NVARCHAR(40)			NULL,
		[NudgeDate_DEC]				DECIMAL(14,1)			NULL,
		
		[GameStatus]				NVARCHAR(20)			NULL,
		[State]						NVARCHAR(20)			NULL,
		[UserTutorialID]			INTEGER					NULL,
		[Game013HomeCountry]		NVARCHAR(60)			NULL,
		[IntercomSecureModeHash]	NVARCHAR(200)			NULL,
		[SenseiInstalledDate]		DATETIME2				NULL,
		[SenseiToken]				NVARCHAR(200)			NULL,
		[CommunicationsEmail]		NVARCHAR(120)			NULL,
		[CommunicationsName]		NVARCHAR(60)			NULL,
		[ResourceID]				NVARCHAR(100)			NULL,
		[ResetTokens]				NVARCHAR(100)			NULL,
		[UserEmail]					NVARCHAR(150)			NULL,
		[OriginalEmail]				NVARCHAR(150)			NULL,
		[ExpiryDate]				NVARCHAR(40)			NULL,
		[ExpiryDate_DEC]			DECIMAL(14,1)			NULL,
		[UserHash]					NVARCHAR(100)			NULL
	)
;
DECLARE @JSONShred  NVARCHAR(MAX) ; 

DECLARE JSONIMPORT CURSOR FOR
 SELECT UserDetails
 FROM #import_users
 --WHERE UserDetails NOT LIKE '%NaN,%'
 
OPEN JSONIMPORT 
FETCH NEXT FROM JSONIMPORT INTO @JSONShred

WHILE @@FETCH_STATUS = 0
BEGIN

--SELECT @JSONShred 
--SELECT ISJSON(@JSONShred) AS IsValidJson

INSERT INTO #SCWUser (
      [UsersObject_id]
      ,[UsersCompanyObject_id]
      ,[ProfileComplete]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[I18nLanguagePreference]
      ,[I18nSet]
      ,[UserTimeZone]
      ,[MetricsPublic]
      ,[InviteSource]
      ,[ActivationToken]
      ,[UserStatus]
      ,[SAMLAttributes]
      ,[PlatformManaged]
      ,[RegisteredDate]
      --,[InvitedDate]
      ,[State]
      ,[Game013HomeCountry]
      ,[IntercomSecureModeHash]
      ,[ResourceID]
      ,[UserEmail]
      ,[ExpiryDate]
)
SELECT * FROM   OPENJSON (@JSONShred) 
            WITH(
				[UsersObject_id]			NVARCHAR(40)			'$._id."$oid"',
				[UsersCompanyObject_id]		NVARCHAR(40)			'$.properties._cid',
				[ProfileComplete]			BIT						'$.properties.profile.isComplete',
				[FirstName]					NVARCHAR(50)			'$.properties.profile.name.first',
				[MiddleName]				NVARCHAR(50)			'$.properties.profile.name.middle',
				[LastName]					NVARCHAR(50)			'$.properties.profile.name.last',
				[I18nLanguagePreference]	NVARCHAR(10)			'$.properties.profile.i18nLanguagePreference',
				[I18nSet]					BIT						'$.properties.profile.hasI18nBeenSet',
				[UserTimeZone]				NVARCHAR(40)			'$.properties.profile.timezone',
				[MetricsPublic]				BIT						'$.properties.profile.isMetricsPublic',

				[InviteSource]				NVARCHAR(80)			'$.properties.invitee.properties.profile.name.first',
				[ActivationToken]			NVARCHAR(100)			'$.activationToken',
				[UserStatus]				NVARCHAR(20)			'$.status',
				[SAMLAttributes]			NVARCHAR(20)			'$.properties.SAMLAttributes',
				[PlatformManaged]			NVARCHAR(20)			'$.properties.platformManaged',
		
				[RegisteredDate]			NVARCHAR(40)			'$.properties.registered',
				--[InvitedDate]				NVARCHAR(40)			'$.properties.inviteReminders[0]',
				
				[State]						NVARCHAR(20)			'$.state',

				[Game013HomeCountry]		NVARCHAR(60)			'$.properties.game013.homeCountry',
				[IntercomSecureModeHash]	NVARCHAR(200)			'$.properties.intercomSecuremodeHash',
				[ResourceID]				NVARCHAR(100)			'$.resourceID',
				[UserEmail]					NVARCHAR(150)			'$.email',
				[ExpiryDate]				NVARCHAR(40)			'$.expirationDate'
)

-- '$.securityGroups' AS JSON	    


UPDATE #SCWUser
	SET RegisteredDate_DEC = ROUND(CAST (CAST(RegisteredDate AS FLOAT) AS DECIMAL(18,1)),0),
		InvitedDate_DEC = ROUND(CAST (CAST(InvitedDate AS FLOAT) AS DECIMAL(18,1)),0),
		NudgeDate_DEC = ROUND(CAST (CAST(NudgeDate AS FLOAT) AS DECIMAL(18,1)),0),
		ExpiryDate_DEC = ROUND(CAST (CAST(ExpiryDate AS FLOAT) AS DECIMAL(18,1)),0)
		
--SELECT StartDate_DEC, CompletedDate_DEC FROM #Game013_log

UPDATE #SCWUser
	SET RegisteredDate_DEC = RegisteredDate_DEC / 60000,  -- convert milliseconds to minutes
		InvitedDate_DEC = InvitedDate_DEC / 60000,
		NudgeDate_DEC = NudgeDate_DEC / 60000,
		ExpiryDate_DEC = ExpiryDate_DEC / 60000

--SELECT StartDate_DEC, CompletedDate_DEC FROM #Game013_log

INSERT INTO [dbo].[SCWUser] (
		[UsersObject_id]
		,[UserTeamID]
		,[UserCompanyID]
		)
SELECT [UsersObject_id]
      ,[UserTeamID]
      ,[UserCompanyID]
      ,[UsersCompanyObject_id]
FROM	#SCWUser


INSERT INTO [dbo].[UserProfile] (
      [UserID]
      ,[ProfileComplete]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[DisplayName]
      ,[I18nLanguagePreference]
      ,[I18nSet]
      ,[UserTimeZone]
      ,[MetricsPublic]
      ,[UserAvatar]
      ,[InviterUserID]
      ,[InviteSource]
      ,[UserStatus]
      ,[PlatformManaged]
      ,[RegisteredDate]
      ,[InvitedDate]
      ,[NudgeDate]
      ,[GameStatus]
      ,[State]
      ,[Game013HomeCountry]
      ,[IntercomSecureModeHash]
      ,[SenseiInstalledDate]
      ,[SenseiToken]
      ,[ResourceID]
      ,[UserEmail]
	)
SELECT ,[ProfileComplete]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[I18nLanguagePreference]
      ,[I18nSet]
      ,[UserTimeZone]
      ,[MetricsPublic]
      ,[UserAvatar]
      ,[InviterUserID]
      ,[InviteSource]
      ,[ActivationToken]
      ,[UserStatus]
      ,[SAMLAttributes]
      ,[PlatformManaged]
      ,DATEADD(MINUTE, RegisteredDate_DEC, '1970-01-01') AS [RegisteredDate]
      ,DATEADD(MINUTE, InvitedDate_DEC, '1970-01-01') AS [InvitedDate]
      ,DATEADD(MINUTE, NudgeDate_DEC, '1970-01-01') AS [NudgeDate]
      ,[GameStatus]
      ,[State]
      ,[UserTutorialID]
      ,[Game013HomeCountry]
      ,[IntercomSecureModeHash]
      ,[SenseiInstalledDate]
      ,[SenseiToken]
      ,[CommunicationsEmail]
      ,[CommunicationsName]
      ,[ResourceID]
      ,[ResetTokens]
      ,[UserEmail]
      ,[OriginalEmail]
      ,DATEADD(MINUTE, ExpiryDate_DEC, '1970-01-01') AS [ExpiryDate]
      ,[UserHash]
FROM	#SCWUser tsc
INNER JOIN SCWUser sc
ON tsc.UsersObject_id = sc.UsersObject_id


	TRUNCATE TABLE #SCWUser
	FETCH NEXT FROM JSONIMPORT INTO @JSONShred

END

CLOSE JSONIMPORT
DEALLOCATE JSONIMPORT



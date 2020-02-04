CREATE TABLE [Log].[Game_013_logCategories]
(
    [Game_013_logCategoriesID]	BIGINT IDENTITY(1,1)	NOT NULL,
	[Game_013_logID]			BIGINT					NOT NULL,
	[CategoryNumber]			INTEGER					NULL,
	[CategoryType]				NVARCHAR(40)			NULL,
	[CategoryName]				NVARCHAR(40)			NULL,
	[SubCategory]				NVARCHAR(100)			NULL,


    CONSTRAINT PK_Game_013_logCategories PRIMARY KEY CLUSTERED ([Game_013_logCategoriesID]),
	CONSTRAINT FK_Game_013_logCategories_Game_013_LogID FOREIGN KEY (Game_013_logID) REFERENCES [Log].[Game_013_log] (Game_013_logID)

);


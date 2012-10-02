USE Quran

GO

CREATE TABLE [dbo].[Languages](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Languages]  WITH CHECK ADD  CONSTRAINT [FK_Language_Language] FOREIGN KEY([ID])
REFERENCES [dbo].[Languages] ([ID])
GO

ALTER TABLE [dbo].[Languages] CHECK CONSTRAINT [FK_Language_Language]
GO


ALTER TABLE [dbo].[Translators] ADD [LanguageID] [int]  NULL 
GO
ALTER TABLE [dbo].[Translators] ADD  CONSTRAINT [DF_Translators_LanguageID]  DEFAULT ((0)) FOR [LanguageID]

GO


INSERT INTO [dbo].[Languages] ([ID],[Name])VALUES    (0,'All')
INSERT INTO [dbo].[Languages] ([ID],[Name])VALUES    (1,'English')
INSERT INTO [dbo].[Languages] ([ID],[Name])VALUES    (2,'Bengali')
INSERT INTO [dbo].[Languages] ([ID],[Name])VALUES    (3,'Other')
GO


ALTER TABLE [dbo].[Translators]  WITH CHECK ADD  CONSTRAINT [Translators_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([ID])
GO


UPDATE [Translators]
SET [LanguageID]=1
GO

UPDATE [Translators]
SET [LanguageID]=2
WHERE ID=5
GO

ALTER TABLE [dbo].[Translators] ALTER COLUMN [LanguageID] [int]  NOT NULL 

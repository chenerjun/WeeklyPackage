USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CHK_language_lcid]') AND parent_object_id = OBJECT_ID(N'[dbo].[Stopwords]'))
ALTER TABLE [dbo].[Stopwords] DROP CONSTRAINT [CHK_language_lcid]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stopwords_createDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Stopwords] DROP CONSTRAINT [DF_Stopwords_createDate]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stopwords_lcid]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Stopwords] DROP CONSTRAINT [DF_Stopwords_lcid]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stopwords_language]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Stopwords] DROP CONSTRAINT [DF_Stopwords_language]
END

GO
/****** Object:  Table [dbo].[Stopwords]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Stopwords]') AND type in (N'U'))
DROP TABLE [dbo].[Stopwords]
GO
/****** Object:  Table [dbo].[Stopwords]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Stopwords]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Stopwords](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stopword] [nvarchar](50) NULL,
	[language] [nvarchar](50) NULL,
	[lcid] [int] NULL,
	[changedDate] [datetime] NULL,
	[createDate] [datetime] NULL,
 CONSTRAINT [PK_Stopwords] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Stopwords] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stopwords_language]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Stopwords] ADD  CONSTRAINT [DF_Stopwords_language]  DEFAULT (N'Neutral') FOR [language]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stopwords_lcid]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Stopwords] ADD  CONSTRAINT [DF_Stopwords_lcid]  DEFAULT ((0)) FOR [lcid]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Stopwords_createDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Stopwords] ADD  CONSTRAINT [DF_Stopwords_createDate]  DEFAULT (getdate()) FOR [createDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CHK_language_lcid]') AND parent_object_id = OBJECT_ID(N'[dbo].[Stopwords]'))
ALTER TABLE [dbo].[Stopwords]  WITH CHECK ADD  CONSTRAINT [CHK_language_lcid] CHECK  (([language]='Neutral' AND [lcid]=(0) OR [language]='English' AND [lcid]=(1033) OR [language]='French' AND [lcid]=(1036)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CHK_language_lcid]') AND parent_object_id = OBJECT_ID(N'[dbo].[Stopwords]'))
ALTER TABLE [dbo].[Stopwords] CHECK CONSTRAINT [CHK_language_lcid]
GO

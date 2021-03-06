USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_KHPCategoryID_KHPInterestTaxonomyCode_KHPCategory]') AND parent_object_id = OBJECT_ID(N'[yos].[KHPCategoryID_KHPInterestTaxonomyCode]'))
ALTER TABLE [yos].[KHPCategoryID_KHPInterestTaxonomyCode] DROP CONSTRAINT [FK_KHPCategoryID_KHPInterestTaxonomyCode_KHPCategory]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_KHPCategoryID_TaxonomyCode_createddate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[KHPCategoryID_KHPInterestTaxonomyCode] DROP CONSTRAINT [DF_KHPCategoryID_TaxonomyCode_createddate]
END

GO
/****** Object:  Index [IX_KHPCategoryID_TaxonomyCode]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[yos].[KHPCategoryID_KHPInterestTaxonomyCode]') AND name = N'IX_KHPCategoryID_TaxonomyCode')
DROP INDEX [IX_KHPCategoryID_TaxonomyCode] ON [yos].[KHPCategoryID_KHPInterestTaxonomyCode]
GO
/****** Object:  Table [yos].[KHPCategoryID_KHPInterestTaxonomyCode]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[KHPCategoryID_KHPInterestTaxonomyCode]') AND type in (N'U'))
DROP TABLE [yos].[KHPCategoryID_KHPInterestTaxonomyCode]
GO
/****** Object:  Table [yos].[KHPCategoryID_KHPInterestTaxonomyCode]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[KHPCategoryID_KHPInterestTaxonomyCode]') AND type in (N'U'))
BEGIN
CREATE TABLE [yos].[KHPCategoryID_KHPInterestTaxonomyCode](
	[CategoryIDKHPTaxonomyCodeID] [int] NOT NULL,
	[CategoryID] [int] NULL,
	[KHPInterestTaxonomyCode] [nvarchar](50) NULL,
	[Desc] [nvarchar](255) NULL,
	[Active] [bit] NULL,
	[Phase] [nvarchar](50) NULL,
	[changedDate] [datetime] NULL,
	[createddate] [datetime] NULL,
 CONSTRAINT [PK_KHPCategoryID_TaxonomyCode] PRIMARY KEY CLUSTERED 
(
	[CategoryIDKHPTaxonomyCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_KHPCategoryID_TaxonomyCode]    Script Date: 12/8/2016 9:19:28 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[yos].[KHPCategoryID_KHPInterestTaxonomyCode]') AND name = N'IX_KHPCategoryID_TaxonomyCode')
CREATE UNIQUE NONCLUSTERED INDEX [IX_KHPCategoryID_TaxonomyCode] ON [yos].[KHPCategoryID_KHPInterestTaxonomyCode]
(
	[CategoryID] ASC,
	[KHPInterestTaxonomyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_KHPCategoryID_TaxonomyCode_createddate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[KHPCategoryID_KHPInterestTaxonomyCode] ADD  CONSTRAINT [DF_KHPCategoryID_TaxonomyCode_createddate]  DEFAULT (getdate()) FOR [createddate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_KHPCategoryID_KHPInterestTaxonomyCode_KHPCategory]') AND parent_object_id = OBJECT_ID(N'[yos].[KHPCategoryID_KHPInterestTaxonomyCode]'))
ALTER TABLE [yos].[KHPCategoryID_KHPInterestTaxonomyCode]  WITH CHECK ADD  CONSTRAINT [FK_KHPCategoryID_KHPInterestTaxonomyCode_KHPCategory] FOREIGN KEY([CategoryID])
REFERENCES [yos].[KHPCategory] ([KHPCategoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_KHPCategoryID_KHPInterestTaxonomyCode_KHPCategory]') AND parent_object_id = OBJECT_ID(N'[yos].[KHPCategoryID_KHPInterestTaxonomyCode]'))
ALTER TABLE [yos].[KHPCategoryID_KHPInterestTaxonomyCode] CHECK CONSTRAINT [FK_KHPCategoryID_KHPInterestTaxonomyCode_KHPCategory]
GO

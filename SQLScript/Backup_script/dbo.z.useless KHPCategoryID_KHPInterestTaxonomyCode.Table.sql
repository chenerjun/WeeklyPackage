USE [RAM]
GO
ALTER TABLE [dbo].[z.useless KHPCategoryID_KHPInterestTaxonomyCode] DROP CONSTRAINT [FK_KHPCategoryID_KHPInterestTaxonomyCode_KHPCategory]
GO
/****** Object:  Index [IX_KHPCategoryID_TaxonomyCode]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP INDEX [IX_KHPCategoryID_TaxonomyCode] ON [dbo].[z.useless KHPCategoryID_KHPInterestTaxonomyCode]
GO
/****** Object:  Table [dbo].[z.useless KHPCategoryID_KHPInterestTaxonomyCode]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP TABLE [dbo].[z.useless KHPCategoryID_KHPInterestTaxonomyCode]
GO
/****** Object:  Table [dbo].[z.useless KHPCategoryID_KHPInterestTaxonomyCode]    Script Date: 12/8/2015 12:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[z.useless KHPCategoryID_KHPInterestTaxonomyCode](
	[CategoryIDKHPTaxonomyCodeID] [int] NOT NULL,
	[CategoryID] [int] NULL,
	[KHPInterestTaxonomyCode] [nvarchar](50) NULL,
	[Desc] [nvarchar](255) NULL,
	[Active] [bit] NULL,
	[Phase] [nvarchar](50) NULL,
	[changedDate] [datetime] NULL,
	[createddate] [datetime] NULL CONSTRAINT [DF_KHPCategoryID_TaxonomyCode_createddate]  DEFAULT (getdate()),
 CONSTRAINT [PK_KHPCategoryID_TaxonomyCode] PRIMARY KEY CLUSTERED 
(
	[CategoryIDKHPTaxonomyCodeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_KHPCategoryID_TaxonomyCode]    Script Date: 12/8/2015 12:04:02 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_KHPCategoryID_TaxonomyCode] ON [dbo].[z.useless KHPCategoryID_KHPInterestTaxonomyCode]
(
	[CategoryID] ASC,
	[KHPInterestTaxonomyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[z.useless KHPCategoryID_KHPInterestTaxonomyCode]  WITH CHECK ADD  CONSTRAINT [FK_KHPCategoryID_KHPInterestTaxonomyCode_KHPCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[z.useless KHPCategory] ([KHPCategoryID])
GO
ALTER TABLE [dbo].[z.useless KHPCategoryID_KHPInterestTaxonomyCode] CHECK CONSTRAINT [FK_KHPCategoryID_KHPInterestTaxonomyCode_KHPCategory]
GO

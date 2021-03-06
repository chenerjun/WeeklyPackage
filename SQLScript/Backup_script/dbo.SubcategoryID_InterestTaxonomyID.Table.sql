USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubcategoryID_TaxonomyID_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubcategoryID_InterestTaxonomyID]'))
ALTER TABLE [dbo].[SubcategoryID_InterestTaxonomyID] DROP CONSTRAINT [FK_SubcategoryID_TaxonomyID_SubCategory]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubcategoryID_TaxonomyID_InterestTaxonomy]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubcategoryID_InterestTaxonomyID]'))
ALTER TABLE [dbo].[SubcategoryID_InterestTaxonomyID] DROP CONSTRAINT [FK_SubcategoryID_TaxonomyID_InterestTaxonomy]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SubcategoryID_TaxonomyID_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SubcategoryID_InterestTaxonomyID] DROP CONSTRAINT [DF_SubcategoryID_TaxonomyID_CreatedDate]
END

GO
/****** Object:  Table [dbo].[SubcategoryID_InterestTaxonomyID]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubcategoryID_InterestTaxonomyID]') AND type in (N'U'))
DROP TABLE [dbo].[SubcategoryID_InterestTaxonomyID]
GO
/****** Object:  Table [dbo].[SubcategoryID_InterestTaxonomyID]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubcategoryID_InterestTaxonomyID]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SubcategoryID_InterestTaxonomyID](
	[SubcategoryID_InterestTaxonomyID] [int] IDENTITY(1,1) NOT NULL,
	[SubCategoryID] [int] NOT NULL,
	[InterestTaxonomyID] [int] NOT NULL,
	[Active] [bit] NULL,
	[ChangedDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SubcategoryID_TaxonomyID] PRIMARY KEY CLUSTERED 
(
	[SubcategoryID_InterestTaxonomyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_SubcategoryID_TaxonomyID] UNIQUE NONCLUSTERED 
(
	[SubCategoryID] ASC,
	[InterestTaxonomyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SubcategoryID_TaxonomyID_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SubcategoryID_InterestTaxonomyID] ADD  CONSTRAINT [DF_SubcategoryID_TaxonomyID_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubcategoryID_TaxonomyID_InterestTaxonomy]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubcategoryID_InterestTaxonomyID]'))
ALTER TABLE [dbo].[SubcategoryID_InterestTaxonomyID]  WITH CHECK ADD  CONSTRAINT [FK_SubcategoryID_TaxonomyID_InterestTaxonomy] FOREIGN KEY([InterestTaxonomyID])
REFERENCES [dbo].[InterestTaxonomy] ([InterestTaxonomyID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubcategoryID_TaxonomyID_InterestTaxonomy]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubcategoryID_InterestTaxonomyID]'))
ALTER TABLE [dbo].[SubcategoryID_InterestTaxonomyID] CHECK CONSTRAINT [FK_SubcategoryID_TaxonomyID_InterestTaxonomy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubcategoryID_TaxonomyID_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubcategoryID_InterestTaxonomyID]'))
ALTER TABLE [dbo].[SubcategoryID_InterestTaxonomyID]  WITH CHECK ADD  CONSTRAINT [FK_SubcategoryID_TaxonomyID_SubCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([SubCategoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SubcategoryID_TaxonomyID_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[SubcategoryID_InterestTaxonomyID]'))
ALTER TABLE [dbo].[SubcategoryID_InterestTaxonomyID] CHECK CONSTRAINT [FK_SubcategoryID_TaxonomyID_SubCategory]
GO

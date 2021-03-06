USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_KHPETLLoadID_InterestTaxonomyCode_CategoryID_KHPCategory]') AND parent_object_id = OBJECT_ID(N'[yos].[KHPETLLoadID_InterestTaxonomyCode_CategoryID]'))
ALTER TABLE [yos].[KHPETLLoadID_InterestTaxonomyCode_CategoryID] DROP CONSTRAINT [FK_KHPETLLoadID_InterestTaxonomyCode_CategoryID_KHPCategory]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_KHPETLLoadID_InterestTaxonomyCode_CategoryID_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[KHPETLLoadID_InterestTaxonomyCode_CategoryID] DROP CONSTRAINT [DF_KHPETLLoadID_InterestTaxonomyCode_CategoryID_CreateDate]
END

GO
/****** Object:  Table [yos].[KHPETLLoadID_InterestTaxonomyCode_CategoryID]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[KHPETLLoadID_InterestTaxonomyCode_CategoryID]') AND type in (N'U'))
DROP TABLE [yos].[KHPETLLoadID_InterestTaxonomyCode_CategoryID]
GO
/****** Object:  Table [yos].[KHPETLLoadID_InterestTaxonomyCode_CategoryID]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[KHPETLLoadID_InterestTaxonomyCode_CategoryID]') AND type in (N'U'))
BEGIN
CREATE TABLE [yos].[KHPETLLoadID_InterestTaxonomyCode_CategoryID](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ETLLoadID] [int] NULL,
	[KHPInterestTaxonomyCode] [nvarchar](50) NULL,
	[KHPCategoryID] [int] NULL,
	[changedDate] [datetime] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_KHPETLLoadID_InterestTaxonomyCode_CategoryID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_KHPETLLoadID_InterestTaxonomyCode_CategoryID_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[KHPETLLoadID_InterestTaxonomyCode_CategoryID] ADD  CONSTRAINT [DF_KHPETLLoadID_InterestTaxonomyCode_CategoryID_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_KHPETLLoadID_InterestTaxonomyCode_CategoryID_KHPCategory]') AND parent_object_id = OBJECT_ID(N'[yos].[KHPETLLoadID_InterestTaxonomyCode_CategoryID]'))
ALTER TABLE [yos].[KHPETLLoadID_InterestTaxonomyCode_CategoryID]  WITH CHECK ADD  CONSTRAINT [FK_KHPETLLoadID_InterestTaxonomyCode_CategoryID_KHPCategory] FOREIGN KEY([KHPCategoryID])
REFERENCES [yos].[KHPCategory] ([KHPCategoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_KHPETLLoadID_InterestTaxonomyCode_CategoryID_KHPCategory]') AND parent_object_id = OBJECT_ID(N'[yos].[KHPETLLoadID_InterestTaxonomyCode_CategoryID]'))
ALTER TABLE [yos].[KHPETLLoadID_InterestTaxonomyCode_CategoryID] CHECK CONSTRAINT [FK_KHPETLLoadID_InterestTaxonomyCode_CategoryID_KHPCategory]
GO

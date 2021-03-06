USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_Category_createdDate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[KHPCategory] DROP CONSTRAINT [DF_Category_createdDate]
END

GO
/****** Object:  Table [yos].[KHPCategory]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[KHPCategory]') AND type in (N'U'))
DROP TABLE [yos].[KHPCategory]
GO
/****** Object:  Table [yos].[KHPCategory]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[KHPCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [yos].[KHPCategory](
	[KHPCategoryID] [int] NOT NULL,
	[KHPCategory] [nvarchar](2000) NULL,
	[KHPCategoryDesc] [nvarchar](2000) NULL,
	[HumanServiceTaxonomyID] [int] NULL,
	[KHPCategoryFr] [nvarchar](2000) NULL,
	[ImageSrc] [nvarchar](255) NULL,
	[Active] [bit] NULL,
	[changedDate] [datetime] NULL,
	[createdDate] [datetime] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[KHPCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_Category_createdDate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[KHPCategory] ADD  CONSTRAINT [DF_Category_createdDate]  DEFAULT (getdate()) FOR [createdDate]
END

GO

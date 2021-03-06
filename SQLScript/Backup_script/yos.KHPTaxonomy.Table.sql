USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_KHPTaxonomy_KHPTaxonomyCreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[KHPTaxonomy] DROP CONSTRAINT [DF_KHPTaxonomy_KHPTaxonomyCreatedDate]
END

GO
/****** Object:  Table [yos].[KHPTaxonomy]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[KHPTaxonomy]') AND type in (N'U'))
DROP TABLE [yos].[KHPTaxonomy]
GO
/****** Object:  Table [yos].[KHPTaxonomy]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[KHPTaxonomy]') AND type in (N'U'))
BEGIN
CREATE TABLE [yos].[KHPTaxonomy](
	[KHPTaxonomyID] [int] IDENTITY(1,1) NOT NULL,
	[KHPCategoryID] [int] NULL,
	[KHPTaxonomyCode] [nvarchar](50) NULL,
	[KHPTaxonomyDesc] [nvarchar](2000) NULL,
	[KHPTaxonomyChangedDate] [datetime] NULL,
	[KHPTaxonomyCreatedDate] [datetime] NULL,
 CONSTRAINT [PK_KHPTaxonomy] PRIMARY KEY CLUSTERED 
(
	[KHPTaxonomyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_KHPTaxonomy_KHPTaxonomyCreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[KHPTaxonomy] ADD  CONSTRAINT [DF_KHPTaxonomy_KHPTaxonomyCreatedDate]  DEFAULT (getdate()) FOR [KHPTaxonomyCreatedDate]
END

GO

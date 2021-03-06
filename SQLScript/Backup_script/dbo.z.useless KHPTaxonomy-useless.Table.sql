USE [RAM]
GO
/****** Object:  Table [dbo].[z.useless KHPTaxonomy-useless]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP TABLE [dbo].[z.useless KHPTaxonomy-useless]
GO
/****** Object:  Table [dbo].[z.useless KHPTaxonomy-useless]    Script Date: 12/8/2015 12:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[z.useless KHPTaxonomy-useless](
	[KHPTaxonomyID] [int] IDENTITY(1,1) NOT NULL,
	[KHPCategoryID] [int] NULL,
	[KHPTaxonomyCode] [nvarchar](50) NULL,
	[KHPTaxonomyDesc] [nvarchar](2000) NULL,
	[KHPTaxonomyChangedDate] [datetime] NULL,
	[KHPTaxonomyCreatedDate] [datetime] NULL CONSTRAINT [DF_KHPTaxonomy_KHPTaxonomyCreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_KHPTaxonomy] PRIMARY KEY CLUSTERED 
(
	[KHPTaxonomyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

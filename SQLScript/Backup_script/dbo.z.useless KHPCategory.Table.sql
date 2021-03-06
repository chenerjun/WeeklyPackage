USE [RAM]
GO
/****** Object:  Table [dbo].[z.useless KHPCategory]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP TABLE [dbo].[z.useless KHPCategory]
GO
/****** Object:  Table [dbo].[z.useless KHPCategory]    Script Date: 12/8/2015 12:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[z.useless KHPCategory](
	[KHPCategoryID] [int] NOT NULL,
	[KHPCategory] [nvarchar](2000) NULL,
	[KHPCategoryDesc] [nvarchar](2000) NULL,
	[HumanServiceTaxonomyID] [int] NULL,
	[KHPCategoryFr] [nvarchar](2000) NULL,
	[ImageSrc] [nvarchar](255) NULL,
	[Active] [bit] NULL,
	[changedDate] [datetime] NULL,
	[createdDate] [datetime] NULL CONSTRAINT [DF_Category_createdDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[KHPCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

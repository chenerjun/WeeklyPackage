USE [RAM]
GO
/****** Object:  Table [dbo].[z.useless KHPMap-useless]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP TABLE [dbo].[z.useless KHPMap-useless]
GO
/****** Object:  Table [dbo].[z.useless KHPMap-useless]    Script Date: 12/8/2015 12:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[z.useless KHPMap-useless](
	[Mapid] [int] NOT NULL,
	[classificationID] [int] NULL,
	[TaxonomyCode] [nvarchar](50) NULL,
	[TaxonomyDesc] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL CONSTRAINT [DF_KHPMap_DateCreated]  DEFAULT (getdate()),
 CONSTRAINT [PK_KHPMap] PRIMARY KEY CLUSTERED 
(
	[Mapid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_KHPMap_DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[KHPMap] DROP CONSTRAINT [DF_KHPMap_DateCreated]
END

GO
/****** Object:  Table [yos].[KHPMap]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[KHPMap]') AND type in (N'U'))
DROP TABLE [yos].[KHPMap]
GO
/****** Object:  Table [yos].[KHPMap]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[KHPMap]') AND type in (N'U'))
BEGIN
CREATE TABLE [yos].[KHPMap](
	[Mapid] [int] NOT NULL,
	[classificationID] [int] NULL,
	[TaxonomyCode] [nvarchar](50) NULL,
	[TaxonomyDesc] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_KHPMap] PRIMARY KEY CLUSTERED 
(
	[Mapid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_KHPMap_DateCreated]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[KHPMap] ADD  CONSTRAINT [DF_KHPMap_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
END

GO

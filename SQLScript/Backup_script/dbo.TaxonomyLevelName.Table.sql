USE [RAM]
GO
/****** Object:  Table [dbo].[TaxonomyLevelName]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaxonomyLevelName]') AND type in (N'U'))
DROP TABLE [dbo].[TaxonomyLevelName]
GO
/****** Object:  Table [dbo].[TaxonomyLevelName]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaxonomyLevelName]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TaxonomyLevelName](
	[TaxonomyLevelNameID] [int] NOT NULL,
	[TaxonomyLevelName] [nvarchar](50) NULL,
	[TaxonomyLevelNameDesc] [nvarchar](2000) NULL,
	[TaxonomyLevelNameChangedDate] [datetime] NULL,
	[TaxonomyLevelNameCreateDate] [datetime] NULL,
 CONSTRAINT [PK_TaxonomyLevelName] PRIMARY KEY CLUSTERED 
(
	[TaxonomyLevelNameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

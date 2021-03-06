USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_KeyWords_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KeyWords] DROP CONSTRAINT [DF_KeyWords_CreatedDate]
END

GO
/****** Object:  FullTextIndex     Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.fulltext_indexes fti WHERE fti.object_id = OBJECT_ID(N'[dbo].[KeyWords]'))
DROP FULLTEXT INDEX ON [dbo].[KeyWords]

GO
/****** Object:  Table [dbo].[KeyWords]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KeyWords]') AND type in (N'U'))
DROP TABLE [dbo].[KeyWords]
GO
/****** Object:  Table [dbo].[KeyWords]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KeyWords]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KeyWords](
	[KeywordID] [int] IDENTITY(1,1) NOT NULL,
	[ETLLoadiD] [int] NULL,
	[PublicName] [nvarchar](2000) NULL,
	[AgencyDescription] [nvarchar](max) NULL,
	[PhysicalAddress] [nvarchar](2000) NULL,
	[PhysicalCity] [nvarchar](500) NULL,
	[PhysicalProvince] [nvarchar](50) NULL,
	[TaxonomyTerm] [nvarchar](2000) NULL,
	[TaxonomyTerms] [nvarchar](2000) NULL,
	[TopCategory] [nvarchar](500) NULL,
	[TopCategory_fr] [nvarchar](500) NULL,
	[SubCategory] [nvarchar](500) NULL,
	[SubCategory_fr] [nvarchar](500) NULL,
	[Coverage] [nvarchar](max) NULL,
	[Eligibility] [nvarchar](2000) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_KeyWords_1] PRIMARY KEY CLUSTERED 
(
	[KeywordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  FullTextIndex     Script Date: 12/8/2016 9:19:28 PM ******/
IF not EXISTS (SELECT * FROM sys.fulltext_indexes fti WHERE fti.object_id = OBJECT_ID(N'[dbo].[KeyWords]'))
CREATE FULLTEXT INDEX ON [dbo].[KeyWords](
[AgencyDescription] LANGUAGE 'Neutral', 
[Coverage] LANGUAGE 'Neutral', 
[Eligibility] LANGUAGE 'Neutral', 
[PhysicalAddress] LANGUAGE 'Neutral', 
[PhysicalCity] LANGUAGE 'Neutral', 
[PhysicalProvince] LANGUAGE 'Neutral', 
[PublicName] LANGUAGE 'Neutral', 
[SubCategory] LANGUAGE 'Neutral', 
[SubCategory_fr] LANGUAGE 'Neutral', 
[TaxonomyTerm] LANGUAGE 'Neutral', 
[TaxonomyTerms] LANGUAGE 'Neutral', 
[TopCategory] LANGUAGE 'Neutral', 
[TopCategory_fr] LANGUAGE 'Neutral')
KEY INDEX [PK_KeyWords_1]ON ([Keyword], FILEGROUP [PRIMARY])
WITH (CHANGE_TRACKING = AUTO, STOPLIST = [freetext])


GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_KeyWords_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KeyWords] ADD  CONSTRAINT [DF_KeyWords_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

GO

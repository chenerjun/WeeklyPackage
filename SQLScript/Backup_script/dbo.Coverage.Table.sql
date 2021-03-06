USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Coverage_TaxonomyRAW]') AND parent_object_id = OBJECT_ID(N'[dbo].[Coverage]'))
ALTER TABLE [dbo].[Coverage] DROP CONSTRAINT [FK_Coverage_TaxonomyRAW]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Coverage_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Coverage] DROP CONSTRAINT [DF_Coverage_CreateDate]
END

GO
/****** Object:  FullTextIndex     Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.fulltext_indexes fti WHERE fti.object_id = OBJECT_ID(N'[dbo].[Coverage]'))
DROP FULLTEXT INDEX ON [dbo].[Coverage]

GO
/****** Object:  Table [dbo].[Coverage]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Coverage]') AND type in (N'U'))
DROP TABLE [dbo].[Coverage]
GO
/****** Object:  Table [dbo].[Coverage]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Coverage]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Coverage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ETLLoadID] [int] NULL,
	[Coverage] [nvarchar](500) NULL,
	[CoverageDesc] [nvarchar](1000) NULL,
	[ChangedDate] [datetime] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Coverage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  FullTextIndex     Script Date: 12/8/2016 9:19:28 PM ******/
IF not EXISTS (SELECT * FROM sys.fulltext_indexes fti WHERE fti.object_id = OBJECT_ID(N'[dbo].[Coverage]'))
CREATE FULLTEXT INDEX ON [dbo].[Coverage](
[Coverage] LANGUAGE 'Neutral')
KEY INDEX [PK_Coverage]ON ([Keyword], FILEGROUP [PRIMARY])
WITH (CHANGE_TRACKING = AUTO, STOPLIST = SYSTEM)


GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Coverage_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Coverage] ADD  CONSTRAINT [DF_Coverage_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Coverage_TaxonomyRAW]') AND parent_object_id = OBJECT_ID(N'[dbo].[Coverage]'))
ALTER TABLE [dbo].[Coverage]  WITH CHECK ADD  CONSTRAINT [FK_Coverage_TaxonomyRAW] FOREIGN KEY([ETLLoadID])
REFERENCES [dbo].[TaxonomyRAW] ([ETLLoadID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Coverage_TaxonomyRAW]') AND parent_object_id = OBJECT_ID(N'[dbo].[Coverage]'))
ALTER TABLE [dbo].[Coverage] CHECK CONSTRAINT [FK_Coverage_TaxonomyRAW]
GO

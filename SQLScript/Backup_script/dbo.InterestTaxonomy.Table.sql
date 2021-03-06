USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InterestTaxonomy_createdDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InterestTaxonomy] DROP CONSTRAINT [DF_InterestTaxonomy_createdDate]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InterestTaxonomy_Phase]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InterestTaxonomy] DROP CONSTRAINT [DF_InterestTaxonomy_Phase]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InterestTaxonomy_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InterestTaxonomy] DROP CONSTRAINT [DF_InterestTaxonomy_Active]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InterestTaxonomy_InterestTaxonomyDelivery]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InterestTaxonomy] DROP CONSTRAINT [DF_InterestTaxonomy_InterestTaxonomyDelivery]
END

GO
/****** Object:  Table [dbo].[InterestTaxonomy]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InterestTaxonomy]') AND type in (N'U'))
DROP TABLE [dbo].[InterestTaxonomy]
GO
/****** Object:  Table [dbo].[InterestTaxonomy]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InterestTaxonomy]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InterestTaxonomy](
	[InterestTaxonomyID] [int] NOT NULL,
	[InterestTaxonomyDelivery] [nvarchar](50) NULL,
	[InterestTaxonomyCode] [nvarchar](50) NOT NULL,
	[InterestTaxonomyTerms] [nvarchar](500) NULL,
	[InterestTaxonomyDesc] [nvarchar](1000) NULL,
	[Active] [bit] NOT NULL,
	[Phase] [int] NOT NULL,
	[changedDate] [datetime] NULL,
	[createdDate] [datetime] NOT NULL,
 CONSTRAINT [PK_InterestTaxonomy] PRIMARY KEY CLUSTERED 
(
	[InterestTaxonomyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_InterestTaxonomy] UNIQUE NONCLUSTERED 
(
	[InterestTaxonomyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InterestTaxonomy_InterestTaxonomyDelivery]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InterestTaxonomy] ADD  CONSTRAINT [DF_InterestTaxonomy_InterestTaxonomyDelivery]  DEFAULT (N'List') FOR [InterestTaxonomyDelivery]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InterestTaxonomy_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InterestTaxonomy] ADD  CONSTRAINT [DF_InterestTaxonomy_Active]  DEFAULT ((1)) FOR [Active]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InterestTaxonomy_Phase]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InterestTaxonomy] ADD  CONSTRAINT [DF_InterestTaxonomy_Phase]  DEFAULT ((1)) FOR [Phase]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InterestTaxonomy_createdDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InterestTaxonomy] ADD  CONSTRAINT [DF_InterestTaxonomy_createdDate]  DEFAULT (getdate()) FOR [createdDate]
END

GO

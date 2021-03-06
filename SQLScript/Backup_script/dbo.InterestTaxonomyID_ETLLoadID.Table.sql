USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InterestTaxonomyID_ETLLoadID_TaxonomyRAW]') AND parent_object_id = OBJECT_ID(N'[dbo].[InterestTaxonomyID_ETLLoadID]'))
ALTER TABLE [dbo].[InterestTaxonomyID_ETLLoadID] DROP CONSTRAINT [FK_InterestTaxonomyID_ETLLoadID_TaxonomyRAW]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InterestTaxonomyID_ETLLoadID_InterestTaxonomy]') AND parent_object_id = OBJECT_ID(N'[dbo].[InterestTaxonomyID_ETLLoadID]'))
ALTER TABLE [dbo].[InterestTaxonomyID_ETLLoadID] DROP CONSTRAINT [FK_InterestTaxonomyID_ETLLoadID_InterestTaxonomy]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InterestTaxonomyID_ETLLoadID_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InterestTaxonomyID_ETLLoadID] DROP CONSTRAINT [DF_InterestTaxonomyID_ETLLoadID_CreatedDate]
END

GO
/****** Object:  Table [dbo].[InterestTaxonomyID_ETLLoadID]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InterestTaxonomyID_ETLLoadID]') AND type in (N'U'))
DROP TABLE [dbo].[InterestTaxonomyID_ETLLoadID]
GO
/****** Object:  Table [dbo].[InterestTaxonomyID_ETLLoadID]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InterestTaxonomyID_ETLLoadID]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InterestTaxonomyID_ETLLoadID](
	[ETLLoadID_InterestTaxonomyID] [int] IDENTITY(1,1) NOT NULL,
	[ETLLoadID] [int] NOT NULL,
	[InterestTaxonomyID] [int] NOT NULL,
	[ChangedDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_InterestTaxonomyID_ETLLoadID] PRIMARY KEY CLUSTERED 
(
	[ETLLoadID_InterestTaxonomyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_InterestTaxonomyID_ETLLoadID] UNIQUE NONCLUSTERED 
(
	[ETLLoadID] ASC,
	[InterestTaxonomyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InterestTaxonomyID_ETLLoadID_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InterestTaxonomyID_ETLLoadID] ADD  CONSTRAINT [DF_InterestTaxonomyID_ETLLoadID_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InterestTaxonomyID_ETLLoadID_InterestTaxonomy]') AND parent_object_id = OBJECT_ID(N'[dbo].[InterestTaxonomyID_ETLLoadID]'))
ALTER TABLE [dbo].[InterestTaxonomyID_ETLLoadID]  WITH CHECK ADD  CONSTRAINT [FK_InterestTaxonomyID_ETLLoadID_InterestTaxonomy] FOREIGN KEY([InterestTaxonomyID])
REFERENCES [dbo].[InterestTaxonomy] ([InterestTaxonomyID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InterestTaxonomyID_ETLLoadID_InterestTaxonomy]') AND parent_object_id = OBJECT_ID(N'[dbo].[InterestTaxonomyID_ETLLoadID]'))
ALTER TABLE [dbo].[InterestTaxonomyID_ETLLoadID] CHECK CONSTRAINT [FK_InterestTaxonomyID_ETLLoadID_InterestTaxonomy]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InterestTaxonomyID_ETLLoadID_TaxonomyRAW]') AND parent_object_id = OBJECT_ID(N'[dbo].[InterestTaxonomyID_ETLLoadID]'))
ALTER TABLE [dbo].[InterestTaxonomyID_ETLLoadID]  WITH CHECK ADD  CONSTRAINT [FK_InterestTaxonomyID_ETLLoadID_TaxonomyRAW] FOREIGN KEY([ETLLoadID])
REFERENCES [dbo].[TaxonomyRAW] ([ETLLoadID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_InterestTaxonomyID_ETLLoadID_TaxonomyRAW]') AND parent_object_id = OBJECT_ID(N'[dbo].[InterestTaxonomyID_ETLLoadID]'))
ALTER TABLE [dbo].[InterestTaxonomyID_ETLLoadID] CHECK CONSTRAINT [FK_InterestTaxonomyID_ETLLoadID_TaxonomyRAW]
GO

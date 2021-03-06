USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_ETLLoadidAndTaxonomyID_createdDate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[ETLLoadidAndTaxonomyID] DROP CONSTRAINT [DF_ETLLoadidAndTaxonomyID_createdDate]
END

GO
/****** Object:  Index [IX_ETLLoadidAndTaxonomyID_KHPTaxonomyID]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[yos].[ETLLoadidAndTaxonomyID]') AND name = N'IX_ETLLoadidAndTaxonomyID_KHPTaxonomyID')
DROP INDEX [IX_ETLLoadidAndTaxonomyID_KHPTaxonomyID] ON [yos].[ETLLoadidAndTaxonomyID]
GO
/****** Object:  Index [IX_ETLLoadidAndTaxonomyID_ETLLOADID]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[yos].[ETLLoadidAndTaxonomyID]') AND name = N'IX_ETLLoadidAndTaxonomyID_ETLLOADID')
DROP INDEX [IX_ETLLoadidAndTaxonomyID_ETLLOADID] ON [yos].[ETLLoadidAndTaxonomyID]
GO
/****** Object:  Table [yos].[ETLLoadidAndTaxonomyID]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[ETLLoadidAndTaxonomyID]') AND type in (N'U'))
DROP TABLE [yos].[ETLLoadidAndTaxonomyID]
GO
/****** Object:  Table [yos].[ETLLoadidAndTaxonomyID]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[ETLLoadidAndTaxonomyID]') AND type in (N'U'))
BEGIN
CREATE TABLE [yos].[ETLLoadidAndTaxonomyID](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[etlloadid] [bigint] NULL,
	[KHPTaxonomyID] [int] NULL,
	[createdDate] [datetime] NULL,
 CONSTRAINT [PK_ETLLoadidAndTaxonomyID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ETLLoadidAndTaxonomyID] UNIQUE NONCLUSTERED 
(
	[etlloadid] ASC,
	[KHPTaxonomyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Index [IX_ETLLoadidAndTaxonomyID_ETLLOADID]    Script Date: 12/8/2016 9:19:28 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[yos].[ETLLoadidAndTaxonomyID]') AND name = N'IX_ETLLoadidAndTaxonomyID_ETLLOADID')
CREATE NONCLUSTERED INDEX [IX_ETLLoadidAndTaxonomyID_ETLLOADID] ON [yos].[ETLLoadidAndTaxonomyID]
(
	[etlloadid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ETLLoadidAndTaxonomyID_KHPTaxonomyID]    Script Date: 12/8/2016 9:19:28 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[yos].[ETLLoadidAndTaxonomyID]') AND name = N'IX_ETLLoadidAndTaxonomyID_KHPTaxonomyID')
CREATE NONCLUSTERED INDEX [IX_ETLLoadidAndTaxonomyID_KHPTaxonomyID] ON [yos].[ETLLoadidAndTaxonomyID]
(
	[KHPTaxonomyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_ETLLoadidAndTaxonomyID_createdDate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[ETLLoadidAndTaxonomyID] ADD  CONSTRAINT [DF_ETLLoadidAndTaxonomyID_createdDate]  DEFAULT (getdate()) FOR [createdDate]
END

GO

USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_ETLloadID_CategoryID_ClassificationID_createddate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[ETLloadID_CategoryID_ClassificationID] DROP CONSTRAINT [DF_ETLloadID_CategoryID_ClassificationID_createddate]
END

GO
/****** Object:  Index [IX_ETLloadID_CategoryID_ClassificationID_KHPcategoryID (ASC)]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[yos].[ETLloadID_CategoryID_ClassificationID]') AND name = N'IX_ETLloadID_CategoryID_ClassificationID_KHPcategoryID (ASC)')
DROP INDEX [IX_ETLloadID_CategoryID_ClassificationID_KHPcategoryID (ASC)] ON [yos].[ETLloadID_CategoryID_ClassificationID]
GO
/****** Object:  Index [IX_ETLloadID_CategoryID_ClassificationID_ETLloadID (ASC)]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[yos].[ETLloadID_CategoryID_ClassificationID]') AND name = N'IX_ETLloadID_CategoryID_ClassificationID_ETLloadID (ASC)')
DROP INDEX [IX_ETLloadID_CategoryID_ClassificationID_ETLloadID (ASC)] ON [yos].[ETLloadID_CategoryID_ClassificationID]
GO
/****** Object:  Index [IX_ETLloadID_CategoryID_ClassificationID_ClassificationID (ASC)]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[yos].[ETLloadID_CategoryID_ClassificationID]') AND name = N'IX_ETLloadID_CategoryID_ClassificationID_ClassificationID (ASC)')
DROP INDEX [IX_ETLloadID_CategoryID_ClassificationID_ClassificationID (ASC)] ON [yos].[ETLloadID_CategoryID_ClassificationID]
GO
/****** Object:  Table [yos].[ETLloadID_CategoryID_ClassificationID]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[ETLloadID_CategoryID_ClassificationID]') AND type in (N'U'))
DROP TABLE [yos].[ETLloadID_CategoryID_ClassificationID]
GO
/****** Object:  Table [yos].[ETLloadID_CategoryID_ClassificationID]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[ETLloadID_CategoryID_ClassificationID]') AND type in (N'U'))
BEGIN
CREATE TABLE [yos].[ETLloadID_CategoryID_ClassificationID](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ETLloadID] [int] NULL,
	[KHPcategoryID] [int] NULL,
	[ClassificationID] [int] NULL,
	[KHPTaxonomyID] [int] NULL,
	[changeddate] [datetime] NULL,
	[createddate] [datetime] NULL,
 CONSTRAINT [PK_ETLloadID_CategoryID_ClassificationID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Index [IX_ETLloadID_CategoryID_ClassificationID_ClassificationID (ASC)]    Script Date: 12/8/2016 9:19:28 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[yos].[ETLloadID_CategoryID_ClassificationID]') AND name = N'IX_ETLloadID_CategoryID_ClassificationID_ClassificationID (ASC)')
CREATE NONCLUSTERED INDEX [IX_ETLloadID_CategoryID_ClassificationID_ClassificationID (ASC)] ON [yos].[ETLloadID_CategoryID_ClassificationID]
(
	[ClassificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ETLloadID_CategoryID_ClassificationID_ETLloadID (ASC)]    Script Date: 12/8/2016 9:19:28 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[yos].[ETLloadID_CategoryID_ClassificationID]') AND name = N'IX_ETLloadID_CategoryID_ClassificationID_ETLloadID (ASC)')
CREATE NONCLUSTERED INDEX [IX_ETLloadID_CategoryID_ClassificationID_ETLloadID (ASC)] ON [yos].[ETLloadID_CategoryID_ClassificationID]
(
	[ETLloadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ETLloadID_CategoryID_ClassificationID_KHPcategoryID (ASC)]    Script Date: 12/8/2016 9:19:28 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[yos].[ETLloadID_CategoryID_ClassificationID]') AND name = N'IX_ETLloadID_CategoryID_ClassificationID_KHPcategoryID (ASC)')
CREATE NONCLUSTERED INDEX [IX_ETLloadID_CategoryID_ClassificationID_KHPcategoryID (ASC)] ON [yos].[ETLloadID_CategoryID_ClassificationID]
(
	[KHPcategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_ETLloadID_CategoryID_ClassificationID_createddate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[ETLloadID_CategoryID_ClassificationID] ADD  CONSTRAINT [DF_ETLloadID_CategoryID_ClassificationID_createddate]  DEFAULT (getdate()) FOR [createddate]
END

GO

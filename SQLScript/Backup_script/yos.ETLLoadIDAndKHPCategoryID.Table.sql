USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_ETLLoadIDAndKHPCategoryID_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[ETLLoadIDAndKHPCategoryID] DROP CONSTRAINT [DF_ETLLoadIDAndKHPCategoryID_CreatedDate]
END

GO
/****** Object:  Index [IX_ETLLoadIDAndKHPCategoryID_KHPCategoryID (ASC)]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[yos].[ETLLoadIDAndKHPCategoryID]') AND name = N'IX_ETLLoadIDAndKHPCategoryID_KHPCategoryID (ASC)')
DROP INDEX [IX_ETLLoadIDAndKHPCategoryID_KHPCategoryID (ASC)] ON [yos].[ETLLoadIDAndKHPCategoryID]
GO
/****** Object:  Index [IX_ETLLoadIDAndKHPCategoryID_etlloadid]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[yos].[ETLLoadIDAndKHPCategoryID]') AND name = N'IX_ETLLoadIDAndKHPCategoryID_etlloadid')
DROP INDEX [IX_ETLLoadIDAndKHPCategoryID_etlloadid] ON [yos].[ETLLoadIDAndKHPCategoryID]
GO
/****** Object:  Table [yos].[ETLLoadIDAndKHPCategoryID]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[ETLLoadIDAndKHPCategoryID]') AND type in (N'U'))
DROP TABLE [yos].[ETLLoadIDAndKHPCategoryID]
GO
/****** Object:  Table [yos].[ETLLoadIDAndKHPCategoryID]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[ETLLoadIDAndKHPCategoryID]') AND type in (N'U'))
BEGIN
CREATE TABLE [yos].[ETLLoadIDAndKHPCategoryID](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[etlloadid] [bigint] NULL,
	[KHPCategoryID] [int] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_ETLLoadIDAndKHPCategoryID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ETLLoadIDAndKHPCategoryID] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Index [IX_ETLLoadIDAndKHPCategoryID_etlloadid]    Script Date: 12/8/2016 9:19:28 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[yos].[ETLLoadIDAndKHPCategoryID]') AND name = N'IX_ETLLoadIDAndKHPCategoryID_etlloadid')
CREATE NONCLUSTERED INDEX [IX_ETLLoadIDAndKHPCategoryID_etlloadid] ON [yos].[ETLLoadIDAndKHPCategoryID]
(
	[etlloadid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ETLLoadIDAndKHPCategoryID_KHPCategoryID (ASC)]    Script Date: 12/8/2016 9:19:28 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[yos].[ETLLoadIDAndKHPCategoryID]') AND name = N'IX_ETLLoadIDAndKHPCategoryID_KHPCategoryID (ASC)')
CREATE NONCLUSTERED INDEX [IX_ETLLoadIDAndKHPCategoryID_KHPCategoryID (ASC)] ON [yos].[ETLLoadIDAndKHPCategoryID]
(
	[KHPCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_ETLLoadIDAndKHPCategoryID_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[ETLLoadIDAndKHPCategoryID] ADD  CONSTRAINT [DF_ETLLoadIDAndKHPCategoryID_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

GO

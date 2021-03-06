USE [RAM]
GO
/****** Object:  Index [IX_ETLLoadIDAndKHPCategoryID_KHPCategoryID (ASC)]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP INDEX [IX_ETLLoadIDAndKHPCategoryID_KHPCategoryID (ASC)] ON [dbo].[z.useless ETLLoadIDAndKHPCategoryID]
GO
/****** Object:  Index [IX_ETLLoadIDAndKHPCategoryID_etlloadid]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP INDEX [IX_ETLLoadIDAndKHPCategoryID_etlloadid] ON [dbo].[z.useless ETLLoadIDAndKHPCategoryID]
GO
/****** Object:  Table [dbo].[z.useless ETLLoadIDAndKHPCategoryID]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP TABLE [dbo].[z.useless ETLLoadIDAndKHPCategoryID]
GO
/****** Object:  Table [dbo].[z.useless ETLLoadIDAndKHPCategoryID]    Script Date: 12/8/2015 12:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[z.useless ETLLoadIDAndKHPCategoryID](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[etlloadid] [bigint] NULL,
	[KHPCategoryID] [int] NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_ETLLoadIDAndKHPCategoryID_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_ETLLoadIDAndKHPCategoryID] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ETLLoadIDAndKHPCategoryID] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [IX_ETLLoadIDAndKHPCategoryID_etlloadid]    Script Date: 12/8/2015 12:04:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_ETLLoadIDAndKHPCategoryID_etlloadid] ON [dbo].[z.useless ETLLoadIDAndKHPCategoryID]
(
	[etlloadid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ETLLoadIDAndKHPCategoryID_KHPCategoryID (ASC)]    Script Date: 12/8/2015 12:04:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_ETLLoadIDAndKHPCategoryID_KHPCategoryID (ASC)] ON [dbo].[z.useless ETLLoadIDAndKHPCategoryID]
(
	[KHPCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

USE [RAM]
GO
ALTER TABLE [dbo].[z.useless ETLloadID_CategoryID_ClassificationID] DROP CONSTRAINT [DF_ETLloadID_CategoryID_ClassificationID_createddate]
GO
/****** Object:  Index [IX_ETLloadID_CategoryID_ClassificationID_KHPcategoryID (ASC)]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP INDEX [IX_ETLloadID_CategoryID_ClassificationID_KHPcategoryID (ASC)] ON [dbo].[z.useless ETLloadID_CategoryID_ClassificationID]
GO
/****** Object:  Index [IX_ETLloadID_CategoryID_ClassificationID_ETLloadID (ASC)]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP INDEX [IX_ETLloadID_CategoryID_ClassificationID_ETLloadID (ASC)] ON [dbo].[z.useless ETLloadID_CategoryID_ClassificationID]
GO
/****** Object:  Index [IX_ETLloadID_CategoryID_ClassificationID_ClassificationID (ASC)]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP INDEX [IX_ETLloadID_CategoryID_ClassificationID_ClassificationID (ASC)] ON [dbo].[z.useless ETLloadID_CategoryID_ClassificationID]
GO
/****** Object:  Table [dbo].[z.useless ETLloadID_CategoryID_ClassificationID]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP TABLE [dbo].[z.useless ETLloadID_CategoryID_ClassificationID]
GO
/****** Object:  Table [dbo].[z.useless ETLloadID_CategoryID_ClassificationID]    Script Date: 12/8/2015 12:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[z.useless ETLloadID_CategoryID_ClassificationID](
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

GO
/****** Object:  Index [IX_ETLloadID_CategoryID_ClassificationID_ClassificationID (ASC)]    Script Date: 12/8/2015 12:04:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_ETLloadID_CategoryID_ClassificationID_ClassificationID (ASC)] ON [dbo].[z.useless ETLloadID_CategoryID_ClassificationID]
(
	[ClassificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ETLloadID_CategoryID_ClassificationID_ETLloadID (ASC)]    Script Date: 12/8/2015 12:04:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_ETLloadID_CategoryID_ClassificationID_ETLloadID (ASC)] ON [dbo].[z.useless ETLloadID_CategoryID_ClassificationID]
(
	[ETLloadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ETLloadID_CategoryID_ClassificationID_KHPcategoryID (ASC)]    Script Date: 12/8/2015 12:04:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_ETLloadID_CategoryID_ClassificationID_KHPcategoryID (ASC)] ON [dbo].[z.useless ETLloadID_CategoryID_ClassificationID]
(
	[KHPcategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[z.useless ETLloadID_CategoryID_ClassificationID] ADD  CONSTRAINT [DF_ETLloadID_CategoryID_ClassificationID_createddate]  DEFAULT (getdate()) FOR [createddate]
GO

USE [RAM]
GO
/****** Object:  Index [IX_ETLLoadidAndTaxonomyID_KHPTaxonomyID]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP INDEX [IX_ETLLoadidAndTaxonomyID_KHPTaxonomyID] ON [dbo].[z.useless ETLLoadidAndTaxonomyID]
GO
/****** Object:  Index [IX_ETLLoadidAndTaxonomyID_ETLLOADID]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP INDEX [IX_ETLLoadidAndTaxonomyID_ETLLOADID] ON [dbo].[z.useless ETLLoadidAndTaxonomyID]
GO
/****** Object:  Table [dbo].[z.useless ETLLoadidAndTaxonomyID]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP TABLE [dbo].[z.useless ETLLoadidAndTaxonomyID]
GO
/****** Object:  Table [dbo].[z.useless ETLLoadidAndTaxonomyID]    Script Date: 12/8/2015 12:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[z.useless ETLLoadidAndTaxonomyID](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[etlloadid] [bigint] NULL,
	[KHPTaxonomyID] [int] NULL,
	[createdDate] [datetime] NULL CONSTRAINT [DF_ETLLoadidAndTaxonomyID_createdDate]  DEFAULT (getdate()),
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

GO
/****** Object:  Index [IX_ETLLoadidAndTaxonomyID_ETLLOADID]    Script Date: 12/8/2015 12:04:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_ETLLoadidAndTaxonomyID_ETLLOADID] ON [dbo].[z.useless ETLLoadidAndTaxonomyID]
(
	[etlloadid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ETLLoadidAndTaxonomyID_KHPTaxonomyID]    Script Date: 12/8/2015 12:04:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_ETLLoadidAndTaxonomyID_KHPTaxonomyID] ON [dbo].[z.useless ETLLoadidAndTaxonomyID]
(
	[KHPTaxonomyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

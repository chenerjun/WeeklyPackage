USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TopCategoryID_SubCategoryID_TopCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[TopCategoryID_SubCategoryID]'))
ALTER TABLE [dbo].[TopCategoryID_SubCategoryID] DROP CONSTRAINT [FK_TopCategoryID_SubCategoryID_TopCategory]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TopCategoryID_SubCategoryID_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[TopCategoryID_SubCategoryID]'))
ALTER TABLE [dbo].[TopCategoryID_SubCategoryID] DROP CONSTRAINT [FK_TopCategoryID_SubCategoryID_SubCategory]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TopCategoryID_SubCategoryID_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TopCategoryID_SubCategoryID] DROP CONSTRAINT [DF_TopCategoryID_SubCategoryID_CreatedDate]
END

GO
/****** Object:  Table [dbo].[TopCategoryID_SubCategoryID]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TopCategoryID_SubCategoryID]') AND type in (N'U'))
DROP TABLE [dbo].[TopCategoryID_SubCategoryID]
GO
/****** Object:  Table [dbo].[TopCategoryID_SubCategoryID]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TopCategoryID_SubCategoryID]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TopCategoryID_SubCategoryID](
	[TopCategoryID_SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[TopCategoryID] [int] NOT NULL,
	[SubCategoryID] [int] NOT NULL,
	[Active] [bit] NULL,
	[ChangedDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TopCategoryID_SubCategoryID] PRIMARY KEY CLUSTERED 
(
	[TopCategoryID_SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_TopCategoryID_SubCategoryID] UNIQUE NONCLUSTERED 
(
	[SubCategoryID] ASC,
	[TopCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TopCategoryID_SubCategoryID_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TopCategoryID_SubCategoryID] ADD  CONSTRAINT [DF_TopCategoryID_SubCategoryID_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TopCategoryID_SubCategoryID_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[TopCategoryID_SubCategoryID]'))
ALTER TABLE [dbo].[TopCategoryID_SubCategoryID]  WITH CHECK ADD  CONSTRAINT [FK_TopCategoryID_SubCategoryID_SubCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([SubCategoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TopCategoryID_SubCategoryID_SubCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[TopCategoryID_SubCategoryID]'))
ALTER TABLE [dbo].[TopCategoryID_SubCategoryID] CHECK CONSTRAINT [FK_TopCategoryID_SubCategoryID_SubCategory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TopCategoryID_SubCategoryID_TopCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[TopCategoryID_SubCategoryID]'))
ALTER TABLE [dbo].[TopCategoryID_SubCategoryID]  WITH CHECK ADD  CONSTRAINT [FK_TopCategoryID_SubCategoryID_TopCategory] FOREIGN KEY([TopCategoryID])
REFERENCES [dbo].[TopCategory] ([TopCategoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TopCategoryID_SubCategoryID_TopCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[TopCategoryID_SubCategoryID]'))
ALTER TABLE [dbo].[TopCategoryID_SubCategoryID] CHECK CONSTRAINT [FK_TopCategoryID_SubCategoryID_TopCategory]
GO

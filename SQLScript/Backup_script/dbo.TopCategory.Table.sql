USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TopCategory_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TopCategory] DROP CONSTRAINT [DF_TopCategory_CreatedDate]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TopCategory_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TopCategory] DROP CONSTRAINT [DF_TopCategory_Active]
END

GO
/****** Object:  Table [dbo].[TopCategory]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TopCategory]') AND type in (N'U'))
DROP TABLE [dbo].[TopCategory]
GO
/****** Object:  Table [dbo].[TopCategory]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TopCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TopCategory](
	[TopCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[TopCategory] [nvarchar](255) NOT NULL,
	[TopCategoryDesc] [nvarchar](2000) NULL,
	[TopCategory_fr] [nvarchar](255) NULL,
	[TopCategoryDesc_fr] [nvarchar](2000) NULL,
	[Active] [bit] NOT NULL,
	[ChangedDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_TopCategory] PRIMARY KEY CLUSTERED 
(
	[TopCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_TopCategory] UNIQUE NONCLUSTERED 
(
	[TopCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TopCategory_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TopCategory] ADD  CONSTRAINT [DF_TopCategory_Active]  DEFAULT ((1)) FOR [Active]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TopCategory_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TopCategory] ADD  CONSTRAINT [DF_TopCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

GO

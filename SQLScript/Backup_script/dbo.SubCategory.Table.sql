USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SubCategory_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SubCategory] DROP CONSTRAINT [DF_SubCategory_CreatedDate]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SubCategory_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SubCategory] DROP CONSTRAINT [DF_SubCategory_Active]
END

GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubCategory]') AND type in (N'U'))
DROP TABLE [dbo].[SubCategory]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[SubCategory] [nvarchar](255) NOT NULL,
	[SubCategoryDesc] [nvarchar](2000) NULL,
	[SubCategory_fr] [nvarchar](255) NULL,
	[SubCategoryDesc_fr] [nvarchar](2000) NULL,
	[Active] [bit] NOT NULL,
	[changedDate] [datetime] NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[SubCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SubCategory_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SubCategory] ADD  CONSTRAINT [DF_SubCategory_Active]  DEFAULT ((1)) FOR [Active]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SubCategory_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SubCategory] ADD  CONSTRAINT [DF_SubCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

GO

USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Permission_CreatedDated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Permission] DROP CONSTRAINT [DF_Permission_CreatedDated]
END

GO
/****** Object:  Table [dbo].[Permission]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permission]') AND type in (N'U'))
DROP TABLE [dbo].[Permission]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Permission]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Permission](
	[PermissionID] [int] IDENTITY(1,1) NOT NULL,
	[ACLID] [int] NULL,
	[TopCategoryID] [int] NULL,
	[TopCategoryDesc] [nvarchar](255) NULL,
	[SubCategoryID] [int] NULL,
	[SubCategoryDesc] [nvarchar](255) NULL,
	[ProvinceID] [int] NULL,
	[ProvinceDesc] [nvarchar](255) NULL,
	[CityID] [int] NULL,
	[CityDesc] [nvarchar](255) NULL,
	[ModifiedDate] [datetime] NULL,
	[CreatedDated] [datetime] NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Permission_CreatedDated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Permission] ADD  CONSTRAINT [DF_Permission_CreatedDated]  DEFAULT (getdate()) FOR [CreatedDated]
END

GO

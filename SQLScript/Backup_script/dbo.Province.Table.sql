USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Province_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Province] DROP CONSTRAINT [DF_Province_CreatedDate]
END

GO
/****** Object:  Table [dbo].[Province]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Province]') AND type in (N'U'))
DROP TABLE [dbo].[Province]
GO
/****** Object:  Table [dbo].[Province]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Province]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Province](
	[ProvinceID] [int] NOT NULL,
	[Province] [nvarchar](255) NULL,
	[ProvinceAlias] [nvarchar](50) NULL,
	[ProvinceFrench] [nvarchar](255) NULL,
	[changedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED 
(
	[ProvinceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Province_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Province] ADD  CONSTRAINT [DF_Province_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

GO

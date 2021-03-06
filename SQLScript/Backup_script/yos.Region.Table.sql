USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_Region_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[Region] DROP CONSTRAINT [DF_Region_CreatedDate]
END

GO
/****** Object:  Table [yos].[Region]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[Region]') AND type in (N'U'))
DROP TABLE [yos].[Region]
GO
/****** Object:  Table [yos].[Region]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[Region]') AND type in (N'U'))
BEGIN
CREATE TABLE [yos].[Region](
	[RegionID] [int] IDENTITY(1,1) NOT NULL,
	[Region] [nvarchar](255) NULL,
	[RegionAlias] [nvarchar](50) NULL,
	[RegionFrench] [nvarchar](50) NULL,
	[changedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_Region_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[Region] ADD  CONSTRAINT [DF_Region_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

GO

USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_iCarolCity_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[iCarolCityMasterList] DROP CONSTRAINT [DF_iCarolCity_CreatedDate]
END

GO
/****** Object:  Table [yos].[iCarolCityMasterList]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[iCarolCityMasterList]') AND type in (N'U'))
DROP TABLE [yos].[iCarolCityMasterList]
GO
/****** Object:  Table [yos].[iCarolCityMasterList]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[iCarolCityMasterList]') AND type in (N'U'))
BEGIN
CREATE TABLE [yos].[iCarolCityMasterList](
	[iCarolCityID] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceID] [int] NULL,
	[RegionID] [int] NULL,
	[iCarolCity] [nvarchar](255) NULL,
	[iCarolCityAlias] [nvarchar](50) NULL,
	[iCarolCityFrench] [nvarchar](50) NULL,
	[changedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_iCarolCity] PRIMARY KEY CLUSTERED 
(
	[iCarolCityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_iCarolCity_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[iCarolCityMasterList] ADD  CONSTRAINT [DF_iCarolCity_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

GO

USE [RAM]
GO
/****** Object:  Table [dbo].[z.useless iCarolCityMasterList]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP TABLE [dbo].[z.useless iCarolCityMasterList]
GO
/****** Object:  Table [dbo].[z.useless iCarolCityMasterList]    Script Date: 12/8/2015 12:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[z.useless iCarolCityMasterList](
	[iCarolCityID] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceID] [int] NULL,
	[RegionID] [int] NULL,
	[iCarolCity] [nvarchar](255) NULL,
	[iCarolCityAlias] [nvarchar](50) NULL,
	[iCarolCityFrench] [nvarchar](50) NULL,
	[changedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_iCarolCity_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_iCarolCity] PRIMARY KEY CLUSTERED 
(
	[iCarolCityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

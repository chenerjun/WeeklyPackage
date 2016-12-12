USE [RAM]
GO
/****** Object:  Table [dbo].[z.useless crp]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP TABLE [dbo].[z.useless crp]
GO
/****** Object:  Table [dbo].[z.useless crp]    Script Date: 12/8/2015 12:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[z.useless crp](
	[id] [int] NULL,
	[cityid] [int] NULL,
	[CityName] [nvarchar](255) NULL,
	[ProvinceID] [int] NULL,
	[latitude] [numeric](18, 10) NULL,
	[longitude] [numeric](18, 10) NULL,
	[ProvinceAlias] [nvarchar](50) NULL,
	[County] [nvarchar](255) NULL,
	[ChangedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]

GO

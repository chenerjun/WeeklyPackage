USE [RAM]
GO
/****** Object:  Table [dbo].[z.useless City_Version2]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP TABLE [dbo].[z.useless City_Version2]
GO
/****** Object:  Table [dbo].[z.useless City_Version2]    Script Date: 12/8/2015 12:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[z.useless City_Version2](
	[Id] [int] NOT NULL,
	[CityName] [varchar](500) NULL,
	[ProvinceID] [int] NULL,
	[latitude] [numeric](18, 10) NULL,
	[longitude] [numeric](18, 10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

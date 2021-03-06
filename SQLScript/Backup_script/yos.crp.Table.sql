USE [RAM]
GO
/****** Object:  Table [yos].[crp]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[crp]') AND type in (N'U'))
DROP TABLE [yos].[crp]
GO
/****** Object:  Table [yos].[crp]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[crp]') AND type in (N'U'))
BEGIN
CREATE TABLE [yos].[crp](
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
END
GO

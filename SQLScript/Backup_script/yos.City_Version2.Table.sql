USE [RAM]
GO
/****** Object:  Table [yos].[City_Version2]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[City_Version2]') AND type in (N'U'))
DROP TABLE [yos].[City_Version2]
GO
/****** Object:  Table [yos].[City_Version2]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[City_Version2]') AND type in (N'U'))
BEGIN
CREATE TABLE [yos].[City_Version2](
	[Id] [int] NOT NULL,
	[CityName] [varchar](500) NULL,
	[ProvinceID] [int] NULL,
	[latitude] [numeric](18, 10) NULL,
	[longitude] [numeric](18, 10) NULL
) ON [PRIMARY]
END
GO

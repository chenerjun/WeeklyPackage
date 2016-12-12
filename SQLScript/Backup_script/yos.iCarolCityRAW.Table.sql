USE [RAM]
GO
/****** Object:  Table [yos].[iCarolCityRAW]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[iCarolCityRAW]') AND type in (N'U'))
DROP TABLE [yos].[iCarolCityRAW]
GO
/****** Object:  Table [yos].[iCarolCityRAW]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[iCarolCityRAW]') AND type in (N'U'))
BEGIN
CREATE TABLE [yos].[iCarolCityRAW](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Province] [nvarchar](50) NULL,
	[Region] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[ChangedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]
END
GO

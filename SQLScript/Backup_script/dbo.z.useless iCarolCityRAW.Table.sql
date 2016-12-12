USE [RAM]
GO
/****** Object:  Table [dbo].[z.useless iCarolCityRAW]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP TABLE [dbo].[z.useless iCarolCityRAW]
GO
/****** Object:  Table [dbo].[z.useless iCarolCityRAW]    Script Date: 12/8/2015 12:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[z.useless iCarolCityRAW](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Province] [nvarchar](50) NULL,
	[Region] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[ChangedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]

GO

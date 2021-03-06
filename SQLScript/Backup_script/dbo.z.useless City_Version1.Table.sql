USE [RAM]
GO
ALTER TABLE [dbo].[z.useless City_Version1] DROP CONSTRAINT [FK_City_Province]
GO
/****** Object:  Table [dbo].[z.useless City_Version1]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP TABLE [dbo].[z.useless City_Version1]
GO
/****** Object:  Table [dbo].[z.useless City_Version1]    Script Date: 12/8/2015 12:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[z.useless City_Version1](
	[CityID] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](500) NULL,
	[ProvinceID] [int] NULL,
	[latitude] [numeric](18, 10) NULL,
	[longitude] [numeric](18, 10) NULL,
	[ChangedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[z.useless City_Version1]  WITH NOCHECK ADD  CONSTRAINT [FK_City_Province] FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[z.useless City_Version1] CHECK CONSTRAINT [FK_City_Province]
GO

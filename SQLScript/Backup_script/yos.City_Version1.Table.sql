USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_City_Province]') AND parent_object_id = OBJECT_ID(N'[yos].[City_Version1]'))
ALTER TABLE [yos].[City_Version1] DROP CONSTRAINT [FK_City_Province]
GO
/****** Object:  Table [yos].[City_Version1]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[City_Version1]') AND type in (N'U'))
DROP TABLE [yos].[City_Version1]
GO
/****** Object:  Table [yos].[City_Version1]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[City_Version1]') AND type in (N'U'))
BEGIN
CREATE TABLE [yos].[City_Version1](
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_City_Province]') AND parent_object_id = OBJECT_ID(N'[yos].[City_Version1]'))
ALTER TABLE [yos].[City_Version1]  WITH NOCHECK ADD  CONSTRAINT [FK_City_Province] FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_City_Province]') AND parent_object_id = OBJECT_ID(N'[yos].[City_Version1]'))
ALTER TABLE [yos].[City_Version1] CHECK CONSTRAINT [FK_City_Province]
GO

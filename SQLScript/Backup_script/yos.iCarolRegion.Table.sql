USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_iCarolRegion_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[iCarolRegion] DROP CONSTRAINT [DF_iCarolRegion_CreatedDate]
END

GO
/****** Object:  Table [yos].[iCarolRegion]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[iCarolRegion]') AND type in (N'U'))
DROP TABLE [yos].[iCarolRegion]
GO
/****** Object:  Table [yos].[iCarolRegion]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[iCarolRegion]') AND type in (N'U'))
BEGIN
CREATE TABLE [yos].[iCarolRegion](
	[RegionID] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceID] [int] NULL,
	[Region] [nvarchar](50) NULL,
	[Alias] [nvarchar](50) NULL,
	[Fr_Region] [nvarchar](50) NULL,
	[Fr_Alias] [nvarchar](50) NULL,
	[ChangedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_iCarolRegion] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_iCarolRegion_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[iCarolRegion] ADD  CONSTRAINT [DF_iCarolRegion_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

GO

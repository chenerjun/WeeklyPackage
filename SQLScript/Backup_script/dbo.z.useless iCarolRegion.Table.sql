USE [RAM]
GO
/****** Object:  Table [dbo].[z.useless iCarolRegion]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP TABLE [dbo].[z.useless iCarolRegion]
GO
/****** Object:  Table [dbo].[z.useless iCarolRegion]    Script Date: 12/8/2015 12:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[z.useless iCarolRegion](
	[RegionID] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceID] [int] NULL,
	[Region] [nvarchar](50) NULL,
	[Alias] [nvarchar](50) NULL,
	[Fr_Region] [nvarchar](50) NULL,
	[Fr_Alias] [nvarchar](50) NULL,
	[ChangedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_iCarolRegion_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_iCarolRegion] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

USE [RAM]
GO
/****** Object:  Table [dbo].[z.useless Region]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP TABLE [dbo].[z.useless Region]
GO
/****** Object:  Table [dbo].[z.useless Region]    Script Date: 12/8/2015 12:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[z.useless Region](
	[RegionID] [int] IDENTITY(1,1) NOT NULL,
	[Region] [nvarchar](255) NULL,
	[RegionAlias] [nvarchar](50) NULL,
	[RegionFrench] [nvarchar](50) NULL,
	[changedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Region_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[RegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

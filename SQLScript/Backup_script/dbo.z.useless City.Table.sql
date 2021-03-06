USE [RAM]
GO
/****** Object:  Index [IX_CityName]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP INDEX [IX_CityName] ON [dbo].[z.useless City]
GO
/****** Object:  Table [dbo].[z.useless City]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP TABLE [dbo].[z.useless City]
GO
/****** Object:  Table [dbo].[z.useless City]    Script Date: 12/8/2015 12:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[z.useless City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](255) NULL,
	[ChangedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_City_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_City_2] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CityName]    Script Date: 12/8/2015 12:04:02 PM ******/
CREATE NONCLUSTERED INDEX [IX_CityName] ON [dbo].[z.useless City]
(
	[CityName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

USE [RAM]
GO
/****** Object:  Table [dbo].[NoMatched]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NoMatched]') AND type in (N'U'))
DROP TABLE [dbo].[NoMatched]
GO
/****** Object:  Table [dbo].[NoMatched]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NoMatched]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NoMatched](
	[PhysicalCity] [nvarchar](2000) NULL,
	[ProvinceID] [int] NULL
) ON [PRIMARY]
END
GO

USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ErrorCity_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ErrorCity] DROP CONSTRAINT [DF_ErrorCity_CreatedDate]
END

GO
/****** Object:  Table [dbo].[ErrorCity]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ErrorCity]') AND type in (N'U'))
DROP TABLE [dbo].[ErrorCity]
GO
/****** Object:  Table [dbo].[ErrorCity]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ErrorCity]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ErrorCity](
	[ErrorCityETLLOADID] [int] NULL,
	[ErrorCity_ResourceAgencyNum] [nvarchar](500) NULL,
	[ErrorCity_PublicName] [nvarchar](500) NULL,
	[ErrorCity_PhysicalCity] [nvarchar](500) NULL,
	[ErrorCity_physicalProvinceID] [int] NULL,
	[ErrorCity_PhysicalStateProvince] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ErrorCity_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ErrorCity] ADD  CONSTRAINT [DF_ErrorCity_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

GO

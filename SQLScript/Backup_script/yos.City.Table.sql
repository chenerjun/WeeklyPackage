USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_City_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[City] DROP CONSTRAINT [DF_City_CreatedDate]
END

GO
/****** Object:  Index [IX_CityName]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[yos].[City]') AND name = N'IX_CityName')
DROP INDEX [IX_CityName] ON [yos].[City]
GO
/****** Object:  Table [yos].[City]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[City]') AND type in (N'U'))
DROP TABLE [yos].[City]
GO
/****** Object:  Table [yos].[City]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[City]') AND type in (N'U'))
BEGIN
CREATE TABLE [yos].[City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](255) NULL,
	[ChangedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_City_2] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_CityName]    Script Date: 12/8/2016 9:19:28 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[yos].[City]') AND name = N'IX_CityName')
CREATE NONCLUSTERED INDEX [IX_CityName] ON [yos].[City]
(
	[CityName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_City_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[City] ADD  CONSTRAINT [DF_City_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

GO

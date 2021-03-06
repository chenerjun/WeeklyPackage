USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_City_Province1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CityLocation]'))
ALTER TABLE [dbo].[CityLocation] DROP CONSTRAINT [FK_City_Province1]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_c1_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CityLocation] DROP CONSTRAINT [DF_c1_CreatedDate]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CityLocation_longitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CityLocation] DROP CONSTRAINT [DF_CityLocation_longitude]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CityLocation_latitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CityLocation] DROP CONSTRAINT [DF_CityLocation_latitude]
END

GO
/****** Object:  Index [IX_CityLocation_provinceID]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CityLocation]') AND name = N'IX_CityLocation_provinceID')
DROP INDEX [IX_CityLocation_provinceID] ON [dbo].[CityLocation]
GO
/****** Object:  Table [dbo].[CityLocation]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CityLocation]') AND type in (N'U'))
DROP TABLE [dbo].[CityLocation]
GO
/****** Object:  Table [dbo].[CityLocation]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CityLocation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CityLocation](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](500) NULL,
	[ProvinceID] [int] NULL,
	[latitude] [numeric](18, 10) NULL,
	[longitude] [numeric](18, 10) NULL,
	[ChangedDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_City_1] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Index [IX_CityLocation_provinceID]    Script Date: 12/8/2016 9:19:28 PM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CityLocation]') AND name = N'IX_CityLocation_provinceID')
CREATE NONCLUSTERED INDEX [IX_CityLocation_provinceID] ON [dbo].[CityLocation]
(
	[ProvinceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CityLocation_latitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CityLocation] ADD  CONSTRAINT [DF_CityLocation_latitude]  DEFAULT ((0.0)) FOR [latitude]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CityLocation_longitude]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CityLocation] ADD  CONSTRAINT [DF_CityLocation_longitude]  DEFAULT ((0.0)) FOR [longitude]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_c1_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CityLocation] ADD  CONSTRAINT [DF_c1_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_City_Province1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CityLocation]'))
ALTER TABLE [dbo].[CityLocation]  WITH CHECK ADD  CONSTRAINT [FK_City_Province1] FOREIGN KEY([ProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_City_Province1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CityLocation]'))
ALTER TABLE [dbo].[CityLocation] CHECK CONSTRAINT [FK_City_Province1]
GO

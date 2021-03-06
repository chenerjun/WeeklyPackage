USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PhoneWeb_KHPCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[PhoneWeb]'))
ALTER TABLE [dbo].[PhoneWeb] DROP CONSTRAINT [FK_PhoneWeb_KHPCategory]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PhoneWeb_createdDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PhoneWeb] DROP CONSTRAINT [DF_PhoneWeb_createdDate]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PhoneWeb_Map]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PhoneWeb] DROP CONSTRAINT [DF_PhoneWeb_Map]
END

GO
/****** Object:  Table [dbo].[PhoneWeb]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PhoneWeb]') AND type in (N'U'))
DROP TABLE [dbo].[PhoneWeb]
GO
/****** Object:  Table [dbo].[PhoneWeb]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PhoneWeb]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PhoneWeb](
	[ETLLoadID] [int] NOT NULL,
	[ResourceAgencyNum] [nvarchar](50) NULL,
	[Map] [nvarchar](50) NULL,
	[SubCategoryID] [int] NOT NULL,
	[TopCategoryID] [int] NOT NULL,
	[PublicName] [nvarchar](2000) NULL,
	[AgencyDescription] [nvarchar](max) NULL,
	[PhysicalAddress] [nvarchar](2000) NULL,
	[PhysicalCityID] [int] NULL,
	[PhysicalCity] [nvarchar](500) NULL,
	[PhysicalProvinceID] [int] NULL,
	[PhysicalProvince] [nvarchar](50) NULL,
	[PhysicalCountry] [nvarchar](50) NULL,
	[PhysicalPostalCode] [nvarchar](50) NULL,
	[Latitude] [numeric](18, 10) NULL,
	[Longitude] [numeric](18, 10) NULL,
	[HoursOfOperation] [nvarchar](2000) NULL,
	[Phone] [nvarchar](2000) NULL,
	[WebsiteAddress] [nvarchar](2000) NULL,
	[Eligibility] [nvarchar](2000) NULL,
	[DisabilitiesAccess] [nvarchar](2000) NULL,
	[FeeStructureSource] [nvarchar](2000) NULL,
	[ApplicationProcess] [nvarchar](2000) NULL,
	[DocumentsRequired] [nvarchar](2000) NULL,
	[LanguagesOfferedList] [nvarchar](2000) NULL,
	[LanguageOfRecord] [nvarchar](50) NULL,
	[WorkHours] [nvarchar](2000) NULL,
	[CustomEligibilitybyAge] [nvarchar](2000) NULL,
	[CoverageArea] [nvarchar](2000) NULL,
	[Coverage] [nvarchar](max) NULL,
	[NormalWaitTime] [nvarchar](2000) NULL,
	[createdDate] [datetime] NULL,
 CONSTRAINT [PK_PhoneWeb_1] PRIMARY KEY CLUSTERED 
(
	[ETLLoadID] ASC,
	[SubCategoryID] ASC,
	[TopCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PhoneWeb_Map]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PhoneWeb] ADD  CONSTRAINT [DF_PhoneWeb_Map]  DEFAULT (N'List') FOR [Map]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PhoneWeb_createdDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PhoneWeb] ADD  CONSTRAINT [DF_PhoneWeb_createdDate]  DEFAULT (getdate()) FOR [createdDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PhoneWeb_KHPCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[PhoneWeb]'))
ALTER TABLE [dbo].[PhoneWeb]  WITH CHECK ADD  CONSTRAINT [FK_PhoneWeb_KHPCategory] FOREIGN KEY([TopCategoryID])
REFERENCES [yos].[KHPCategory] ([KHPCategoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PhoneWeb_KHPCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[PhoneWeb]'))
ALTER TABLE [dbo].[PhoneWeb] CHECK CONSTRAINT [FK_PhoneWeb_KHPCategory]
GO

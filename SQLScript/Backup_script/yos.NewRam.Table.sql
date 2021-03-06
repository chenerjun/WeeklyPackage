USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_NewRam_TaxonomyLevelName]') AND parent_object_id = OBJECT_ID(N'[yos].[NewRam]'))
ALTER TABLE [yos].[NewRam] DROP CONSTRAINT [FK_NewRam_TaxonomyLevelName]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_NewRam_Province]') AND parent_object_id = OBJECT_ID(N'[yos].[NewRam]'))
ALTER TABLE [yos].[NewRam] DROP CONSTRAINT [FK_NewRam_Province]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_NewRam_CityLocation]') AND parent_object_id = OBJECT_ID(N'[yos].[NewRam]'))
ALTER TABLE [yos].[NewRam] DROP CONSTRAINT [FK_NewRam_CityLocation]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_NewRam_PhysicalCountry]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[NewRam] DROP CONSTRAINT [DF_NewRam_PhysicalCountry]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_NewRam_Map]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[NewRam] DROP CONSTRAINT [DF_NewRam_Map]
END

GO
/****** Object:  Table [yos].[NewRam]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[NewRam]') AND type in (N'U'))
DROP TABLE [yos].[NewRam]
GO
/****** Object:  Table [yos].[NewRam]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[NewRam]') AND type in (N'U'))
BEGIN
CREATE TABLE [yos].[NewRam](
	[ETLLoadID] [int] NOT NULL,
	[ResourceAgencyNum] [nvarchar](50) NULL,
	[Map] [bit] NULL,
	[PublicName] [nvarchar](2000) NULL,
	[AgencyDescription] [nvarchar](max) NULL,
	[TaxonomyLevelNameID] [int] NULL,
	[ParentAgencyNum] [nvarchar](50) NULL,
	[PhysicalAddress] [nvarchar](2000) NULL,
	[PhysicalCityID] [int] NULL,
	[PhysicalProvinceID] [int] NULL,
	[PhysicalCountry] [nvarchar](50) NULL,
	[PhysicalPostalCode] [nvarchar](50) NULL,
	[PhysicalAddressIsPrivate] [nvarchar](50) NULL,
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
	[changedDate] [datetime] NULL,
	[createdDate] [datetime] NULL,
 CONSTRAINT [PK_NewRam] PRIMARY KEY CLUSTERED 
(
	[ETLLoadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_NewRam_Map]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[NewRam] ADD  CONSTRAINT [DF_NewRam_Map]  DEFAULT ((1)) FOR [Map]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_NewRam_PhysicalCountry]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[NewRam] ADD  CONSTRAINT [DF_NewRam_PhysicalCountry]  DEFAULT ('Canada') FOR [PhysicalCountry]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_NewRam_CityLocation]') AND parent_object_id = OBJECT_ID(N'[yos].[NewRam]'))
ALTER TABLE [yos].[NewRam]  WITH CHECK ADD  CONSTRAINT [FK_NewRam_CityLocation] FOREIGN KEY([PhysicalCityID])
REFERENCES [dbo].[CityLocation] ([CityId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_NewRam_CityLocation]') AND parent_object_id = OBJECT_ID(N'[yos].[NewRam]'))
ALTER TABLE [yos].[NewRam] CHECK CONSTRAINT [FK_NewRam_CityLocation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_NewRam_Province]') AND parent_object_id = OBJECT_ID(N'[yos].[NewRam]'))
ALTER TABLE [yos].[NewRam]  WITH CHECK ADD  CONSTRAINT [FK_NewRam_Province] FOREIGN KEY([PhysicalProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_NewRam_Province]') AND parent_object_id = OBJECT_ID(N'[yos].[NewRam]'))
ALTER TABLE [yos].[NewRam] CHECK CONSTRAINT [FK_NewRam_Province]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_NewRam_TaxonomyLevelName]') AND parent_object_id = OBJECT_ID(N'[yos].[NewRam]'))
ALTER TABLE [yos].[NewRam]  WITH CHECK ADD  CONSTRAINT [FK_NewRam_TaxonomyLevelName] FOREIGN KEY([TaxonomyLevelNameID])
REFERENCES [dbo].[TaxonomyLevelName] ([TaxonomyLevelNameID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[yos].[FK_NewRam_TaxonomyLevelName]') AND parent_object_id = OBJECT_ID(N'[yos].[NewRam]'))
ALTER TABLE [yos].[NewRam] CHECK CONSTRAINT [FK_NewRam_TaxonomyLevelName]
GO

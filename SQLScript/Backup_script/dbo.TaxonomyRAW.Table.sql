USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaxonomyRAW_TaxonomyLevelName]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaxonomyRAW]'))
ALTER TABLE [dbo].[TaxonomyRAW] DROP CONSTRAINT [FK_TaxonomyRAW_TaxonomyLevelName]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaxonomyRAW_Province]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaxonomyRAW]'))
ALTER TABLE [dbo].[TaxonomyRAW] DROP CONSTRAINT [FK_TaxonomyRAW_Province]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaxonomyRAW_CityLocation]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaxonomyRAW]'))
ALTER TABLE [dbo].[TaxonomyRAW] DROP CONSTRAINT [FK_TaxonomyRAW_CityLocation]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TaxonomyRAW_createdDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TaxonomyRAW] DROP CONSTRAINT [DF_TaxonomyRAW_createdDate]
END

GO
/****** Object:  FullTextIndex     Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.fulltext_indexes fti WHERE fti.object_id = OBJECT_ID(N'[dbo].[TaxonomyRAW]'))
DROP FULLTEXT INDEX ON [dbo].[TaxonomyRAW]

GO
/****** Object:  Table [dbo].[TaxonomyRAW]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaxonomyRAW]') AND type in (N'U'))
DROP TABLE [dbo].[TaxonomyRAW]
GO
/****** Object:  Table [dbo].[TaxonomyRAW]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TaxonomyRAW]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TaxonomyRAW](
	[ETLLoadID] [int] IDENTITY(1,1) NOT NULL,
	[ResourceAgencyNum] [nvarchar](2000) NULL,
	[Map] [nvarchar](50) NULL,
	[PublicName] [nvarchar](2000) NULL,
	[TaxonomyLevelNameID] [int] NULL,
	[ParentAgency] [nvarchar](2000) NULL,
	[ParentAgencyNum] [nvarchar](2000) NULL,
	[PhysicalAddress1] [nvarchar](2000) NULL,
	[PhysicalAddress2] [nvarchar](2000) NULL,
	[PhysicalCityID] [int] NULL,
	[PhysicalCity] [nvarchar](2000) NULL,
	[PhysicalCounty] [nvarchar](2000) NULL,
	[PhysicalProvinceID] [int] NULL,
	[PhysicalStateProvince] [nvarchar](2000) NULL,
	[PhysicalPostalCode] [nvarchar](2000) NULL,
	[PhysicalCountry] [nvarchar](2000) NULL,
	[PhysicalAddressIsPrivate] [nvarchar](2000) NULL,
	[Latitude] [numeric](18, 10) NULL,
	[Longitude] [numeric](18, 10) NULL,
	[HoursOfOperation] [nvarchar](2000) NULL,
	[Phone1Number] [nvarchar](2000) NULL,
	[Phone1IsPrivate] [bit] NULL,
	[Phone2Number] [nvarchar](2000) NULL,
	[Phone2IsPrivate] [bit] NULL,
	[Phone3Number] [nvarchar](2000) NULL,
	[Phone3IsPrivate] [bit] NULL,
	[Phone4Number] [nvarchar](2000) NULL,
	[Phone4IsPrivate] [bit] NULL,
	[Phone5Number] [nvarchar](2000) NULL,
	[Phone5IsPrivate] [bit] NULL,
	[PhoneFax] [nvarchar](2000) NULL,
	[PhoneFaxIsPrivate] [bit] NULL,
	[PhoneTTY] [nvarchar](2000) NULL,
	[PhoneTTYIsPrivate] [bit] NULL,
	[PhoneTollFree] [nvarchar](2000) NULL,
	[PhoneTollFreeIsPrivate] [bit] NULL,
	[PhoneNumberHotline] [nvarchar](2000) NULL,
	[PhoneNumberHotlineIsPrivate] [bit] NULL,
	[PhoneNumberBusinessLine] [nvarchar](2000) NULL,
	[PhoneNumberBusinessLineIsPrivate] [bit] NULL,
	[PhoneNumberOutOfArea] [nvarchar](2000) NULL,
	[PhoneNumberOutOfAreaIsPrivate] [bit] NULL,
	[PhoneNumberAfterHours] [nvarchar](2000) NULL,
	[PhoneNumberAfterHoursIsPrivate] [bit] NULL,
	[WebsiteAddress] [nvarchar](2000) NULL,
	[AgencyDescription] [nvarchar](max) NULL,
	[CoverageArea] [nvarchar](2000) NULL,
	[CoverageAreaText] [nvarchar](2000) NULL,
	[Eligibility] [nvarchar](2000) NULL,
	[DisabilitiesAccess] [nvarchar](2000) NULL,
	[FeeStructureSource] [nvarchar](2000) NULL,
	[ApplicationProcess] [nvarchar](2000) NULL,
	[DocumentsRequired] [nvarchar](2000) NULL,
	[LanguagesOffered] [nvarchar](2000) NULL,
	[LanguagesOfferedList] [nvarchar](2000) NULL,
	[NormalWaitTime] [nvarchar](2000) NULL,
	[EnteredOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[MadeInactiveOn] [datetime] NULL,
	[ConnectsToSiteNum] [nvarchar](2000) NULL,
	[ConnectsToProgramNum] [nvarchar](2000) NULL,
	[LanguageOfRecord] [nvarchar](2000) NULL,
	[Categories] [nvarchar](2000) NULL,
	[TaxonomyCodes] [nvarchar](2000) NULL,
	[Coverage] [nvarchar](max) NULL,
	[WorkHours] [nvarchar](2000) NULL,
	[CustomEligibilitybyAge] [nvarchar](2000) NULL,
	[CustomAnonymityPolicy] [nvarchar](max) NULL,
	[CustomRecordType] [nvarchar](2000) NULL,
	[changedDate] [datetime] NULL,
	[createdDate] [datetime] NULL,
 CONSTRAINT [PK_TaxonomyRAW] PRIMARY KEY CLUSTERED 
(
	[ETLLoadID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  FullTextIndex     Script Date: 12/8/2016 9:19:28 PM ******/
IF not EXISTS (SELECT * FROM sys.fulltext_indexes fti WHERE fti.object_id = OBJECT_ID(N'[dbo].[TaxonomyRAW]'))
CREATE FULLTEXT INDEX ON [dbo].[TaxonomyRAW](
[AgencyDescription] LANGUAGE 'Neutral', 
[Coverage] LANGUAGE 'Neutral', 
[CoverageArea] LANGUAGE 'Neutral', 
[Eligibility] LANGUAGE 'Neutral', 
[PhysicalAddress1] LANGUAGE 'Neutral', 
[PhysicalAddress2] LANGUAGE 'Neutral', 
[PhysicalCity] LANGUAGE 'Neutral', 
[PhysicalCounty] LANGUAGE 'Neutral', 
[PhysicalPostalCode] LANGUAGE 'Neutral', 
[PhysicalStateProvince] LANGUAGE 'Neutral', 
[PublicName] LANGUAGE 'Neutral', 
[WebsiteAddress] LANGUAGE 'Neutral')
KEY INDEX [PK_TaxonomyRAW]ON ([Keyword], FILEGROUP [PRIMARY])
WITH (CHANGE_TRACKING = AUTO, STOPLIST = SYSTEM)


GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TaxonomyRAW_createdDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TaxonomyRAW] ADD  CONSTRAINT [DF_TaxonomyRAW_createdDate]  DEFAULT (getdate()) FOR [createdDate]
END

GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaxonomyRAW_CityLocation]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaxonomyRAW]'))
ALTER TABLE [dbo].[TaxonomyRAW]  WITH CHECK ADD  CONSTRAINT [FK_TaxonomyRAW_CityLocation] FOREIGN KEY([PhysicalCityID])
REFERENCES [dbo].[CityLocation] ([CityId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaxonomyRAW_CityLocation]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaxonomyRAW]'))
ALTER TABLE [dbo].[TaxonomyRAW] CHECK CONSTRAINT [FK_TaxonomyRAW_CityLocation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaxonomyRAW_Province]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaxonomyRAW]'))
ALTER TABLE [dbo].[TaxonomyRAW]  WITH CHECK ADD  CONSTRAINT [FK_TaxonomyRAW_Province] FOREIGN KEY([PhysicalProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaxonomyRAW_Province]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaxonomyRAW]'))
ALTER TABLE [dbo].[TaxonomyRAW] CHECK CONSTRAINT [FK_TaxonomyRAW_Province]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaxonomyRAW_TaxonomyLevelName]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaxonomyRAW]'))
ALTER TABLE [dbo].[TaxonomyRAW]  WITH CHECK ADD  CONSTRAINT [FK_TaxonomyRAW_TaxonomyLevelName] FOREIGN KEY([TaxonomyLevelNameID])
REFERENCES [dbo].[TaxonomyLevelName] ([TaxonomyLevelNameID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TaxonomyRAW_TaxonomyLevelName]') AND parent_object_id = OBJECT_ID(N'[dbo].[TaxonomyRAW]'))
ALTER TABLE [dbo].[TaxonomyRAW] CHECK CONSTRAINT [FK_TaxonomyRAW_TaxonomyLevelName]
GO

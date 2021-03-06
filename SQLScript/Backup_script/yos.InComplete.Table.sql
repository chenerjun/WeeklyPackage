USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_Incomplete_createdDate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[InComplete] DROP CONSTRAINT [DF_Incomplete_createdDate]
END

GO
/****** Object:  Table [yos].[InComplete]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[InComplete]') AND type in (N'U'))
DROP TABLE [yos].[InComplete]
GO
/****** Object:  Table [yos].[InComplete]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[InComplete]') AND type in (N'U'))
BEGIN
CREATE TABLE [yos].[InComplete](
	[ETLLoadID] [bigint] NULL,
	[Incomplete] [nvarchar](2000) NULL,
	[ResourceAgencyNum] [nvarchar](2000) NULL,
	[ClassicationID] [int] NULL,
	[PublicName] [nvarchar](2000) NULL,
	[AgencyDescription] [nvarchar](max) NULL,
	[TaxonomyLevelNameID] [int] NULL,
	[ParentAgencyNum] [nvarchar](2000) NULL,
	[PhysicalAddress] [nvarchar](2000) NULL,
	[PhysicalCityID] [int] NULL,
	[PhysicalProvinceID] [int] NULL,
	[PhysicalCountry] [nvarchar](2000) NULL,
	[PhysicalPostalCode] [nvarchar](2000) NULL,
	[PhysicalAddressIsPrivate] [nvarchar](2000) NULL,
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
	[LanguageOfRecord] [nvarchar](2000) NULL,
	[WorkHours] [nvarchar](2000) NULL,
	[CustomEligibilitybyAge] [nvarchar](2000) NULL,
	[createdDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[yos].[DF_Incomplete_createdDate]') AND type = 'D')
BEGIN
ALTER TABLE [yos].[InComplete] ADD  CONSTRAINT [DF_Incomplete_createdDate]  DEFAULT (getdate()) FOR [createdDate]
END

GO

USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InCompleteRamResource_createdDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InComplete_RamResource] DROP CONSTRAINT [DF_InCompleteRamResource_createdDate]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InCompleteRamResource_PhysicalCountry]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InComplete_RamResource] DROP CONSTRAINT [DF_InCompleteRamResource_PhysicalCountry]
END

GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InCompleteRamResource_Map]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InComplete_RamResource] DROP CONSTRAINT [DF_InCompleteRamResource_Map]
END

GO
/****** Object:  Table [dbo].[InComplete_RamResource]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InComplete_RamResource]') AND type in (N'U'))
DROP TABLE [dbo].[InComplete_RamResource]
GO
/****** Object:  Table [dbo].[InComplete_RamResource]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[InComplete_RamResource]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[InComplete_RamResource](
	[Incomplete] [nvarchar](20) NULL,
	[ETLLoadID] [int] NOT NULL,
	[ResourceAgencyNum] [nvarchar](50) NULL,
	[Map] [nvarchar](50) NOT NULL,
	[SubCategoryID] [int] NOT NULL,
	[TOPCategoryID] [int] NOT NULL,
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
	[CoverageArea] [nvarchar](2000) NULL,
	[Coverage] [nvarchar](max) NULL,
	[NormalWaitTime] [nvarchar](2000) NULL,
	[changedDate] [datetime] NULL,
	[createdDate] [datetime] NOT NULL,
 CONSTRAINT [PK_InComplete_RamResource] PRIMARY KEY CLUSTERED 
(
	[ETLLoadID] ASC,
	[Map] ASC,
	[SubCategoryID] ASC,
	[TOPCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InCompleteRamResource_Map]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InComplete_RamResource] ADD  CONSTRAINT [DF_InCompleteRamResource_Map]  DEFAULT ((1)) FOR [Map]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InCompleteRamResource_PhysicalCountry]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InComplete_RamResource] ADD  CONSTRAINT [DF_InCompleteRamResource_PhysicalCountry]  DEFAULT ('Canada') FOR [PhysicalCountry]
END

GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_InCompleteRamResource_createdDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[InComplete_RamResource] ADD  CONSTRAINT [DF_InCompleteRamResource_createdDate]  DEFAULT (getdate()) FOR [createdDate]
END

GO

USE [RAM]
GO
/****** Object:  Table [dbo].[z.useless InComplete]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP TABLE [dbo].[z.useless InComplete]
GO
/****** Object:  Table [dbo].[z.useless InComplete]    Script Date: 12/8/2015 12:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[z.useless InComplete](
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
	[createdDate] [datetime] NULL CONSTRAINT [DF_Incomplete_createdDate]  DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

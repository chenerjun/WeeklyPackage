USE [RAM]
GO
ALTER TABLE [dbo].[z.useless NewRam] DROP CONSTRAINT [FK_NewRam_TaxonomyLevelName]
GO
ALTER TABLE [dbo].[z.useless NewRam] DROP CONSTRAINT [FK_NewRam_Province]
GO
ALTER TABLE [dbo].[z.useless NewRam] DROP CONSTRAINT [FK_NewRam_CityLocation]
GO
/****** Object:  Table [dbo].[z.useless NewRam]    Script Date: 12/8/2015 12:04:02 PM ******/
DROP TABLE [dbo].[z.useless NewRam]
GO
/****** Object:  Table [dbo].[z.useless NewRam]    Script Date: 12/8/2015 12:04:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[z.useless NewRam](
	[ETLLoadID] [int] NOT NULL,
	[ResourceAgencyNum] [nvarchar](50) NULL,
	[Map] [bit] NULL CONSTRAINT [DF_NewRam_Map]  DEFAULT ((1)),
	[PublicName] [nvarchar](2000) NULL,
	[AgencyDescription] [nvarchar](max) NULL,
	[TaxonomyLevelNameID] [int] NULL,
	[ParentAgencyNum] [nvarchar](50) NULL,
	[PhysicalAddress] [nvarchar](2000) NULL,
	[PhysicalCityID] [int] NULL,
	[PhysicalProvinceID] [int] NULL,
	[PhysicalCountry] [nvarchar](50) NULL CONSTRAINT [DF_NewRam_PhysicalCountry]  DEFAULT ('Canada'),
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

GO
ALTER TABLE [dbo].[z.useless NewRam]  WITH CHECK ADD  CONSTRAINT [FK_NewRam_CityLocation] FOREIGN KEY([PhysicalCityID])
REFERENCES [dbo].[CityLocation] ([CityId])
GO
ALTER TABLE [dbo].[z.useless NewRam] CHECK CONSTRAINT [FK_NewRam_CityLocation]
GO
ALTER TABLE [dbo].[z.useless NewRam]  WITH CHECK ADD  CONSTRAINT [FK_NewRam_Province] FOREIGN KEY([PhysicalProvinceID])
REFERENCES [dbo].[Province] ([ProvinceID])
GO
ALTER TABLE [dbo].[z.useless NewRam] CHECK CONSTRAINT [FK_NewRam_Province]
GO
ALTER TABLE [dbo].[z.useless NewRam]  WITH CHECK ADD  CONSTRAINT [FK_NewRam_TaxonomyLevelName] FOREIGN KEY([TaxonomyLevelNameID])
REFERENCES [dbo].[TaxonomyLevelName] ([TaxonomyLevelNameID])
GO
ALTER TABLE [dbo].[z.useless NewRam] CHECK CONSTRAINT [FK_NewRam_TaxonomyLevelName]
GO

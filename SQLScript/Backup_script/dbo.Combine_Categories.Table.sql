USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Combine_Categories_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Combine_Categories] DROP CONSTRAINT [DF_Combine_Categories_CreatedDate]
END

GO
/****** Object:  Table [dbo].[Combine_Categories]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Combine_Categories]') AND type in (N'U'))
DROP TABLE [dbo].[Combine_Categories]
GO
/****** Object:  Table [dbo].[Combine_Categories]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Combine_Categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Combine_Categories](
	[CombinID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [nvarchar](50) NULL,
	[Category] [nvarchar](255) NULL,
	[Category_fr] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Combin_Categories] PRIMARY KEY CLUSTERED 
(
	[CombinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Combine_Categories_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Combine_Categories] ADD  CONSTRAINT [DF_Combine_Categories_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END

GO

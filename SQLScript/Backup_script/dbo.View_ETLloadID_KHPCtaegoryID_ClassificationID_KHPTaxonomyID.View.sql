USE [RAM]
GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'View_ETLloadID_KHPCtaegoryID_ClassificationID_KHPTaxonomyID', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ETLloadID_KHPCtaegoryID_ClassificationID_KHPTaxonomyID'

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'dbo', N'VIEW',N'View_ETLloadID_KHPCtaegoryID_ClassificationID_KHPTaxonomyID', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ETLloadID_KHPCtaegoryID_ClassificationID_KHPTaxonomyID'

GO
IF  EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'View_ETLloadID_KHPCtaegoryID_ClassificationID_KHPTaxonomyID', NULL,NULL))
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ETLloadID_KHPCtaegoryID_ClassificationID_KHPTaxonomyID'

GO
/****** Object:  View [dbo].[View_ETLloadID_KHPCtaegoryID_ClassificationID_KHPTaxonomyID]    Script Date: 12/8/2016 9:19:28 PM ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[View_ETLloadID_KHPCtaegoryID_ClassificationID_KHPTaxonomyID]'))
DROP VIEW [dbo].[View_ETLloadID_KHPCtaegoryID_ClassificationID_KHPTaxonomyID]
GO
/****** Object:  View [dbo].[View_ETLloadID_KHPCtaegoryID_ClassificationID_KHPTaxonomyID]    Script Date: 12/8/2016 9:19:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[View_ETLloadID_KHPCtaegoryID_ClassificationID_KHPTaxonomyID]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[View_ETLloadID_KHPCtaegoryID_ClassificationID_KHPTaxonomyID]
AS
SELECT        tr.ETLLoadID, t.KHPCategoryID, m.classificationID, t.KHPTaxonomyID
FROM            dbo.NewRam AS tr INNER JOIN
                         dbo.ETLLoadidAndTaxonomyID AS ET ON tr.ETLLoadID = ET.etlloadid INNER JOIN
                         dbo.KHPTaxonomy AS t ON ET.KHPTaxonomyID = t.KHPTaxonomyID INNER JOIN
                         dbo.KHPMap AS m ON t.KHPTaxonomyCode = m.TaxonomyCode INNER JOIN
                         dbo.Classification AS c ON c.classificationID = m.classificationID
' 
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane1' , N'SCHEMA',N'dbo', N'VIEW',N'View_ETLloadID_KHPCtaegoryID_ClassificationID_KHPTaxonomyID', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tr"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 244
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 19
         End
         Begin Table = "ET"
            Begin Extent = 
               Top = 6
               Left = 354
               Bottom = 136
               Right = 533
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 571
               Bottom = 136
               Right = 811
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "m"
            Begin Extent = 
               Top = 6
               Left = 849
               Bottom = 136
               Right = 1022
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 46
               Left = 1164
               Bottom = 159
               Right = 1334
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3015
         Alias = 900
         Table = 1170
         Outp' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ETLloadID_KHPCtaegoryID_ClassificationID_KHPTaxonomyID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPane2' , N'SCHEMA',N'dbo', N'VIEW',N'View_ETLloadID_KHPCtaegoryID_ClassificationID_KHPTaxonomyID', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'ut = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ETLloadID_KHPCtaegoryID_ClassificationID_KHPTaxonomyID'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_DiagramPaneCount' , N'SCHEMA',N'dbo', N'VIEW',N'View_ETLloadID_KHPCtaegoryID_ClassificationID_KHPTaxonomyID', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_ETLloadID_KHPCtaegoryID_ClassificationID_KHPTaxonomyID'
GO

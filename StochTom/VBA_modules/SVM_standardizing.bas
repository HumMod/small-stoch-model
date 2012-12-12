Attribute VB_Name = "Module1"
Sub RunTests()

Tests
End Sub
Sub RunTrains()

Trains
End Sub



Sub Tests()
Attribute Tests.VB_ProcData.VB_Invoke_Func = " \n14"
'
' Macro1 Macro
'

'
    Sheets.Add After:=Sheets(Sheets.Count)
    Sheets("Sheet1").Select
    Sheets("Sheet1").Name = "28800n"
    Sheets.Add After:=Sheets(Sheets.Count)
    Sheets("Sheet2").Select
    Sheets("Sheet2").Name = "28820n"
    Sheets("28800").Select
    ActiveWindow.SmallScroll Down:=288

 
    Range("A1").Select
    ActiveCell.FormulaR1C1 = "=('28800'!RC-'28800'!R302C)/'28800'!R303C"
    Range("A1").Select
    Selection.Copy
    Range("A1:AP300").Select
    ActiveSheet.Paste
    Range("A1").Select
    Sheets("28820n").Select
    Application.CutCopyMode = False
    ActiveCell.FormulaR1C1 = "=('28820'!RC-'28820'!R302C)/'28820'!R303C"
    Range("A1").Select
    Selection.Copy
    Range("A1:AP300").Select
    ActiveSheet.Paste
    Range("T1").Select
    Selection.End(xlToRight).Select
    Range("AQ1").Select
    Application.CutCopyMode = False
    ActiveCell.FormulaR1C1 = "=IF('28820'!RC<15,1,0)"
    Range("AQ1").Select
    Selection.Copy
    Range("AQ2:AQ300").Select
    ActiveSheet.Paste
    Columns("A:A").Select
    Application.CutCopyMode = False
    Selection.Delete Shift:=xlToLeft
    Columns("Q:Q").Select
    Selection.Delete Shift:=xlToLeft
    Columns("Q:Q").Select
    Selection.Delete Shift:=xlToLeft
    Columns("S:S").Select
    Selection.Delete Shift:=xlToLeft

    Sheets("28800n").Select
    Columns("A:A").Select
    Selection.Delete Shift:=xlToLeft
    Columns("Q:Q").Select
    Selection.Delete Shift:=xlToLeft
    Columns("Q:Q").Select
    Selection.Delete Shift:=xlToLeft
    Columns("S:S").Select
    Selection.Delete Shift:=xlToLeft
    Cells.Select
    Selection.Copy
    Sheets("28800").Select
    ActiveWindow.SmallScroll Down:=-321
    Cells.Select
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
    Sheets("28820n").Select
    Cells.Select
    Application.CutCopyMode = False
    Selection.Copy
    Sheets("28820").Select
    Cells.Select
    Range("T1").Activate
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
    Sheets("Sheet3").Select
    Application.CutCopyMode = False
    ActiveWindow.SelectedSheets.Delete
    Sheets("28800n").Select
    ActiveWindow.SelectedSheets.Delete
    Sheets("28820n").Select
    ActiveWindow.SelectedSheets.Delete

    Range("A1").Select
    Sheets("28800").Select
    Range("A1").Select
End Sub

Sub Trains()
'
' Macro1 Macro
'

'
    Sheets.Add After:=Sheets(Sheets.Count)
    Sheets("Sheet1").Select
    Sheets("Sheet1").Name = "28800n"
    Sheets.Add After:=Sheets(Sheets.Count)
    Sheets("Sheet2").Select
    Sheets("Sheet2").Name = "28820n"
    Sheets("28800").Select
    ActiveWindow.SmallScroll Down:=288

 
    Range("A1").Select
    ActiveCell.FormulaR1C1 = "=('28800'!RC-'28800'!R1002C)/'28800'!R1003C"
    Range("A1").Select
    Selection.Copy
    Range("A1:AP1000").Select
    ActiveSheet.Paste
    Range("A1").Select
    Sheets("28820n").Select
    Application.CutCopyMode = False
    ActiveCell.FormulaR1C1 = "=('28820'!RC-'28820'!R1002C)/'28820'!R1003C"
    Range("A1").Select
    Selection.Copy
    Range("A1:AP1000").Select
    ActiveSheet.Paste
    Range("T1").Select
    Selection.End(xlToRight).Select
    Range("AQ1").Select
    Application.CutCopyMode = False
    ActiveCell.FormulaR1C1 = "=IF('28820'!RC<15,1,0)"
    Range("AQ1").Select
    Selection.Copy
    Range("AQ2:AQ1000").Select
    ActiveSheet.Paste
    Columns("A:A").Select
    Application.CutCopyMode = False
    Selection.Delete Shift:=xlToLeft
    Columns("Q:Q").Select
    Selection.Delete Shift:=xlToLeft
    Columns("Q:Q").Select
    Selection.Delete Shift:=xlToLeft
    Columns("S:S").Select
    Selection.Delete Shift:=xlToLeft

    Sheets("28800n").Select
    Columns("A:A").Select
    Selection.Delete Shift:=xlToLeft
    Columns("Q:Q").Select
    Selection.Delete Shift:=xlToLeft
    Columns("Q:Q").Select
    Selection.Delete Shift:=xlToLeft
    Columns("S:S").Select
    Selection.Delete Shift:=xlToLeft
    Cells.Select
    Selection.Copy
    Sheets("28800").Select
    Cells.Select
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
    Sheets("28820n").Select
    Cells.Select
    Application.CutCopyMode = False
    Selection.Copy
    Sheets("28820").Select
    Cells.Select
    Range("T1").Activate
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
    Sheets("Sheet3").Select
    Application.CutCopyMode = False
    ActiveWindow.SelectedSheets.Delete
    Sheets("28800n").Select
    ActiveWindow.SelectedSheets.Delete
    Sheets("28820n").Select
    ActiveWindow.SelectedSheets.Delete

    Range("A1").Select
    Sheets("28800").Select
    Range("A1").Select
End Sub


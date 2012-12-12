Attribute VB_Name = "Module2"
Sub Train()

Create_Sheets
Means_And_Devs
Normalize
Classify
Delete_Static
Copy_Values

Sheets("28800").Select
Application.CutCopyMode = False

End Sub



Sub Create_Sheets()
'
'
    Sheets.Add After:=Sheets(Sheets.Count)
    Sheets("Sheet1").Select
    Sheets("Sheet1").Name = "28800n"
    Sheets.Add After:=Sheets(Sheets.Count)
    Sheets("Sheet2").Select
    Sheets("Sheet2").Name = "28820n"
    Sheets("28800").Select
End Sub


Sub Means_And_Devs()
'
'
    Range("A1002 ").Select ""
    ActiveCell.FormulaR1C1 = "=AVERAGE(R[-1001]C:R[-2]C)"
    Range("A1003").Select
    ActiveCell.FormulaR1C1 = "=STDEV(R[-1002]C:R[-3]C)"
    Range("A1002:A1003").Select
    Selection.Copy
    Range("B1002:AP1003").Select
    ActiveSheet.Paste
    Sheets("28820").Select
    Application.CutCopyMode = False
    ActiveCell.FormulaR1C1 = ""
    Range("A1002").Select
    ActiveCell.FormulaR1C1 = "=AVERAGE(R[-1001]C:R[-2]C)"
    Range("A1003").Select
    ActiveCell.FormulaR1C1 = "=STDEV(R[-1002]C:R[-3]C)"
    Range("A1002:A1003").Select
    Selection.Copy
    Range("B1002:AP1003").Select
    ActiveSheet.Paste
    
    Sheets("28820").Select
    Range("AQ1").Select
    ActiveCell.FormulaR1C1 = "='28800'!RC[-37]-'28820'!RC[-37]"
    Range("AQ1").Select
    Selection.Copy
    Range("AQ2:AQ1000").Select
    ActiveSheet.Paste

End Sub

Sub Normalize()
'
'
    Sheets("28800n").Select
    ActiveCell.FormulaR1C1 = "=5+('28800'!RC-'28800'!R1002C)/'28800'!R1003C"
    Range("A1").Select
    Selection.Copy
    Range("A1:AP1000").Select
    ActiveSheet.Paste
    Range("A1").Select
    Sheets("28820n").Select
    Application.CutCopyMode = False
    ActiveCell.FormulaR1C1 = "=5+('28820'!RC-'28820'!R1002C)/'28820'!R1003C"
    Range("A1").Select
    Selection.Copy
    Range("A1:AP1000").Select
    ActiveSheet.Paste
    Range("A1").Select
End Sub


Sub Classify()
'
'
    Sheets("28820n").Select
    Range("AQ1").Select
    ActiveCell.FormulaR1C1 = "=IF('28820'!RC<15,1,-1)"
    Range("AQ1").Select
    Selection.Copy
    Range("AQ2:AQ1000").Select
    ActiveSheet.Paste
    Range("AQ1:AQ1000").Select
    Selection.Copy
    Sheets("28800n").Select
    Range("AQ1:AQ1000").Select
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
End Sub
Sub Delete_Static()
'
'
    Sheets("28820n").Select
    Columns("A:A").Select
    Application.CutCopyMode = False
    Selection.Delete Shift:=xlToLeft
    Columns("Q:R").Select
    Selection.Delete Shift:=xlToLeft
    Columns("S:S").Select
    Selection.Delete Shift:=xlToLeft
    Sheets("28800n").Select
    Columns("A:A").Select
    Selection.Delete Shift:=xlToLeft
    Columns("Q:R").Select
    Selection.Delete Shift:=xlToLeft
    Columns("S:S").Select
    Selection.Delete Shift:=xlToLeft
End Sub
Sub Copy_Values()
'
'
    Sheets("28800n").Select
    Cells.Select
    Selection.Copy
    Sheets("28800").Select
    Cells.Select
    Cells.Select
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
    Range("A1").Select
    Sheets("28820n").Select
    Cells.Select
    Selection.Copy
    Sheets("28820").Select
    Cells.Select
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
    Range("A1").Select
End Sub
Sub Delete_Extras()
'
' Macro9 Macro
'

'
    Sheets("Sheet3").Select
    Application.CutCopyMode = False
    ActiveWindow.SelectedSheets.Delete
    Sheets("28800n").Select
    ActiveWindow.SelectedSheets.Delete
    Sheets("28820n").Select
    ActiveWindow.SelectedSheets.Delete
End Sub



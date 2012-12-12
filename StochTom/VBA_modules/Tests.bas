Attribute VB_Name = "Module1"
Sub Tests()

Create_Sheets
Means_And_Devs
Normalize
Classify
Delete_Static
Copy_Values

Sheets("28800").Select

End Sub



Sub Create_Sheets()
Attribute Create_Sheets.VB_ProcData.VB_Invoke_Func = " \n14"
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
Attribute Means_And_Devs.VB_ProcData.VB_Invoke_Func = " \n14"
'
'
    Range("A302").Select
    ActiveCell.FormulaR1C1 = "=AVERAGE(R[-301]C:R[-2]C)"
    Range("A303").Select
    ActiveCell.FormulaR1C1 = "=STDEV(R[-302]C:R[-3]C)"
    Range("A302:A303").Select
    Selection.Copy
    Range("B302:AP303").Select
    ActiveSheet.Paste
    Sheets("28820").Select
    Application.CutCopyMode = False
    ActiveCell.FormulaR1C1 = ""
    Range("A302").Select
    ActiveCell.FormulaR1C1 = "=AVERAGE(R[-301]C:R[-2]C)"
    Range("A303").Select
    ActiveCell.FormulaR1C1 = "=STDEV(R[-302]C:R[-3]C)"
    Range("A302:A303").Select
    Selection.Copy
    Range("B302:AP303").Select
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
Attribute Normalize.VB_ProcData.VB_Invoke_Func = " \n14"
'
'
    Sheets("28800n").Select
    ActiveCell.FormulaR1C1 = "=5+('28800'!RC-'28800'!R302C)/'28800'!R303C"
    Range("A1").Select
    Selection.Copy
    Range("A1:AP300").Select
    ActiveSheet.Paste
    Range("A1").Select
    Sheets("28820n").Select
    Application.CutCopyMode = False
    ActiveCell.FormulaR1C1 = "=5+('28820'!RC-'28820'!R302C)/'28820'!R303C"
    Range("A1").Select
    Selection.Copy
    Range("A1:AP300").Select
    ActiveSheet.Paste
    Range("A1").Select
End Sub


Sub Classify()
Attribute Classify.VB_ProcData.VB_Invoke_Func = " \n14"
'
'
    Sheets("28800n").Select
    Range("AQ1").Select
    ActiveCell.FormulaR1C1 = "=IF('28820'!RC<15,1,-1)"
    Range("AQ1").Select
    Selection.Copy
    Range("AQ2:AQ300").Select
    ActiveSheet.Paste
End Sub
Sub Delete_Static()
Attribute Delete_Static.VB_ProcData.VB_Invoke_Func = " \n14"
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
Attribute Copy_Values.VB_ProcData.VB_Invoke_Func = " \n14"
'
'
    Sheets("28800n").Select
    Cells.Select
    Selection.Copy
    Sheets("28800").Select
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
Attribute Delete_Extras.VB_ProcData.VB_Invoke_Func = " \n14"
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

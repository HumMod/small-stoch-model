Attribute VB_Name = "Module1"
Sub Separate_Fast()
Attribute Separate_Fast.VB_ProcData.VB_Invoke_Func = " \n14"
'
' Separate_Fast Macro
'

'
    Rows("2:7").Select
    Selection.Copy
    Sheets.Add
    Range("A2").Select
    ActiveSheet.Paste
    Range("A1").Select
    Application.CutCopyMode = False
    ActiveCell.FormulaR1C1 = ""
    Sheets("TestFH").Select
    Rows("3:7").Select
    Selection.Delete Shift:=xlUp
    Range("A2").Select
End Sub

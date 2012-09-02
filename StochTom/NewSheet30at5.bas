Attribute VB_Name = "Module1"
Sub NewSheet()
Attribute NewSheet.VB_ProcData.VB_Invoke_Func = " \n14"
'
' NewSheet Macro
'

'
    Sheets.Add
    Sheets("TestH").Select
    Rows("2:2").Select
    Selection.Copy
    Sheets("Sheet1").Select
    Rows("1:1").Select
    ActiveSheet.Paste
    Sheets("TestH").Select
    Application.CutCopyMode = False
    Rows("3:9").Select
    Selection.Cut
    Sheets("Sheet1").Select
    Range("A2").Select
    ActiveSheet.Paste
    Sheets("TestH").Select
    Selection.Delete Shift:=xlUp
    Range("A2").Select
    ActiveCell.FormulaR1C1 = ""
    Sheets("Sheet1").Select
    Range("A1").Select
    Sheets("TestH").Select
    Range("A2").Select
End Sub

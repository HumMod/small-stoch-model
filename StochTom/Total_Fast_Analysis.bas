Attribute VB_Name = "Module1"
Sub AnalysisPackage()

Dim Bins(1 To 100) As Integer
Dim MAP As Integer
Dim TheRange As Range



For i = 1 To 100
    Bins(i) = 0
Next i

Open_fast
MAP_Sheet
Sheets("TestFH").Select
Do While Range("B3") <> ""
    If Range("B3").Value <> 28800 Then
        Rows("3:3").Select
        Selection.Delete Shift:=xlUp
    Else
        MAP = Round(Range("F3").Value - Range("F7").Value)
        Bins(MAP) = Bins(MAP) + 1
        Separate_Fast
    End If
Loop

Sheets("MAPEnd").Select
Range("A1").Select

Set TheRange = ActiveCell.Range(Cells(1, 1), Cells(1, 100))
TheRange.Value = Bins

    Rows("1:1").Select
    ActiveSheet.Shapes.AddChart.Select
    ActiveChart.SetSourceData Source:=Range("'MAPEnd'!$1:$1")
    ActiveChart.ChartType = xlLine


End Sub

Sub Open_fast()
Attribute Open_fast.VB_ProcData.VB_Invoke_Func = " \n14"
'
' Open_fast Macro
'

'
    ChDir "C:\Documents and Settings\Hester_lab\Desktop\small-stoch-model\StochTom"
    Workbooks.OpenText Filename:= _
        "C:\Documents and Settings\Hester_lab\Desktop\small-stoch-model\StochTom\TestFH.txt" _
        , Origin:=437, StartRow:=1, DataType:=xlDelimited, TextQualifier:= _
        xlDoubleQuote, ConsecutiveDelimiter:=True, Tab:=True, Semicolon:=False, _
        Comma:=False, Space:=True, Other:=False, FieldInfo:=Array(Array(1, 1), _
        Array(2, 1)), TrailingMinusNumbers:=True
    Range("B3:B72").Select
    Selection.Copy
    Range("B2:BS2").Select
    Selection.PasteSpecial Paste:=xlPasteAll, Operation:=xlNone, SkipBlanks:= _
        False, Transpose:=True
    Application.CutCopyMode = False
    Rows("3:72").Select
    Selection.Delete Shift:=xlUp
    Range("A2").Select
End Sub

Sub MAP_Sheet()
    Sheets.Add
    Sheets("Sheet1").Select
    Sheets("Sheet1").Name = "MAPEnd"
End Sub

Sub Separate_Fast()
'
' Separate_Fast Macro
'

'
Dim MAP As Integer

    
    
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

Sub CheckEntry()


End Sub

Attribute VB_Name = "Module14"
Sub Macro1()
Attribute Macro1.VB_ProcData.VB_Invoke_Func = " \n14"
'
' Macro1 Macro
'

'
    ChDir "C:\Documents and Settings\Hester_lab\Desktop\small-stoch-model\StochTom"
    Workbooks.OpenText Filename:= _
        "C:\Documents and Settings\Hester_lab\Desktop\small-stoch-model\StochTom\Test.txt" _
        , Origin:=437, StartRow:=1, DataType:=xlDelimited, TextQualifier:= _
        xlDoubleQuote, ConsecutiveDelimiter:=False, Tab:=True, Semicolon:=False, _
        Comma:=True, Space:=False, Other:=False, FieldInfo:=Array(1, 1), _
        TrailingMinusNumbers:=True
    Range("A3:A75").Select
    Selection.Copy
    ActiveWindow.SmallScroll Down:=-24
    Range("A2:BU2").Select
    Selection.PasteSpecial Paste:=xlPasteAll, Operation:=xlNone, SkipBlanks:= _
        False, Transpose:=True
    Rows("3:75").Select
    Application.CutCopyMode = False
    Selection.Delete Shift:=xlUp
'    ActiveWorkbook.Worksheets("Test").Sort.SortFields.Clear
'    ActiveWorkbook.Worksheets("Test").Sort.SortFields.Add Key:=Range("A3"), _
        SortOn:=xlSortOnValues, Order:=xlAscending, DataOption:=xlSortNormal
 '   With ActiveWorkbook.Worksheets("Test").Sort
 '       .SetRange Range("A3:BU75")
 '       .Header = xlNo
 '       .MatchCase = False
 '       .Orientation = xlTopToBottom
 '       .SortMethod = xlPinYin
 '       .Apply
'    End With
End Sub

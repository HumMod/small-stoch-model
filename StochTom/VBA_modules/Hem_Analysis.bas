Attribute VB_Name = "Module1"
Sub Analysis()
Attribute Analysis.VB_ProcData.VB_Invoke_Func = " \n14"
'
' Analysis Macro
'

'
    ChDir "C:\Documents and Settings\Hester_lab\Desktop\small-stoch-model\StochTom"
    Workbooks.OpenText Filename:= _
        "C:\Documents and Settings\Hester_lab\Desktop\small-stoch-model\StochTom\TestH.txt" _
        , Origin:=437, StartRow:=1, DataType:=xlDelimited, TextQualifier:= _
        xlDoubleQuote, ConsecutiveDelimiter:=True, Tab:=True, Semicolon:=False, _
        Comma:=False, Space:=True, Other:=False, FieldInfo:=Array(Array(1, 1), _
        Array(2, 1)), TrailingMinusNumbers:=True
    ActiveWindow.SmallScroll Down:=-6
    Range("B3:B73").Select
    Selection.Cut
    ActiveWindow.SmallScroll Down:=-21
    Range("A2").Select
    Application.CutCopyMode = False
    Range("B3:B17").Select
    ActiveWindow.SmallScroll Down:=78
    Range("B105").Select
    ActiveCell.FormulaR1C1 = "=AVERAGE(R[-31]C:R[-2]C)"
    Range("B106").Select
    ActiveCell.FormulaR1C1 = "=STDEV(R[-32]C:R[-3]C)"
    Range("B105:B106").Select
    Selection.Copy
    Range("C105:BT106").Select
    ActiveSheet.Paste
    ActiveWindow.SmallScroll Down:=-30
    ActiveWindow.ScrollColumn = 2
    ActiveWindow.ScrollColumn = 3
    ActiveWindow.ScrollColumn = 4
    ActiveWindow.ScrollColumn = 5
    ActiveWindow.ScrollColumn = 6
    ActiveWindow.ScrollColumn = 7
    ActiveWindow.ScrollColumn = 8
    ActiveWindow.ScrollColumn = 9
    ActiveWindow.ScrollColumn = 10
    ActiveWindow.ScrollColumn = 11
    ActiveWindow.ScrollColumn = 12
    ActiveWindow.ScrollColumn = 13
    ActiveWindow.ScrollColumn = 14
    ActiveWindow.ScrollColumn = 15
    ActiveWindow.ScrollColumn = 16
    ActiveWindow.ScrollColumn = 17
    ActiveWindow.ScrollColumn = 18
    ActiveWindow.ScrollColumn = 19
    ActiveWindow.ScrollColumn = 20
    ActiveWindow.ScrollColumn = 21
    ActiveWindow.ScrollColumn = 22
    ActiveWindow.ScrollColumn = 23
    ActiveWindow.ScrollColumn = 24
    ActiveWindow.ScrollColumn = 25
    ActiveWindow.ScrollColumn = 26
    ActiveWindow.ScrollColumn = 27
    ActiveWindow.ScrollColumn = 28
    ActiveWindow.ScrollColumn = 29
    ActiveWindow.ScrollColumn = 30
    ActiveWindow.ScrollColumn = 31
    ActiveWindow.ScrollColumn = 32
    ActiveWindow.ScrollColumn = 33
    ActiveWindow.ScrollColumn = 34
    ActiveWindow.ScrollColumn = 35
    ActiveWindow.ScrollColumn = 36
    ActiveWindow.ScrollColumn = 37
    ActiveWindow.ScrollColumn = 38
    ActiveWindow.ScrollColumn = 39
    ActiveWindow.ScrollColumn = 40
    ActiveWindow.ScrollColumn = 41
    ActiveWindow.ScrollColumn = 42
    ActiveWindow.ScrollColumn = 43
    ActiveWindow.ScrollColumn = 44
    ActiveWindow.ScrollColumn = 45
    ActiveWindow.ScrollColumn = 46
    ActiveWindow.ScrollColumn = 47
    ActiveWindow.ScrollColumn = 48
    ActiveWindow.ScrollColumn = 49
    ActiveWindow.ScrollColumn = 47
    ActiveWindow.ScrollColumn = 45
    ActiveWindow.ScrollColumn = 44
    ActiveWindow.ScrollColumn = 42
    ActiveWindow.ScrollColumn = 39
    ActiveWindow.ScrollColumn = 38
    ActiveWindow.ScrollColumn = 36
    ActiveWindow.ScrollColumn = 34
    ActiveWindow.ScrollColumn = 31
    ActiveWindow.ScrollColumn = 29
    ActiveWindow.ScrollColumn = 26
    ActiveWindow.ScrollColumn = 22
    ActiveWindow.ScrollColumn = 20
    ActiveWindow.ScrollColumn = 18
    ActiveWindow.ScrollColumn = 16
    ActiveWindow.ScrollColumn = 14
    ActiveWindow.ScrollColumn = 13
    ActiveWindow.ScrollColumn = 12
    ActiveWindow.ScrollColumn = 11
    ActiveWindow.ScrollColumn = 10
    ActiveWindow.ScrollColumn = 9
    ActiveWindow.ScrollColumn = 8
    ActiveWindow.ScrollColumn = 7
    ActiveWindow.ScrollColumn = 6
    ActiveWindow.ScrollColumn = 5
    ActiveWindow.ScrollColumn = 4
    ActiveWindow.ScrollColumn = 3
    ActiveWindow.ScrollColumn = 2
    ActiveWindow.ScrollColumn = 1
    ActiveWindow.SmallScroll Down:=-57
    Range("B3:B73").Select
    Application.CutCopyMode = False
    Selection.Copy
    ActiveWindow.SmallScroll Down:=-24
    Range("B2:BT2").Select
    Selection.PasteSpecial Paste:=xlPasteAll, Operation:=xlNone, SkipBlanks:= _
        False, Transpose:=True
    Application.CutCopyMode = False
    Range("B3:BT73").Select
    Selection.Delete Shift:=xlUp
    Sheets.Add After:=Sheets(Sheets.Count)
    Workbooks.OpenText Filename:= _
        "C:\Documents and Settings\Hester_lab\Desktop\small-stoch-model\StochTom\TestS.txt" _
        , Origin:=437, StartRow:=1, DataType:=xlDelimited, TextQualifier:= _
        xlDoubleQuote, ConsecutiveDelimiter:=True, Tab:=True, Semicolon:=False, _
        Comma:=False, Space:=True, Other:=False, FieldInfo:=Array(Array(1, 1), _
        Array(2, 1)), TrailingMinusNumbers:=True
    ActiveWindow.SmallScroll Down:=63
    Range("B74:BT103").Select
    Selection.Cut
    Windows("TestH.txt").Activate
    Range("B3").Select
    ActiveSheet.Paste
    Sheets("TestH").Select
    Rows("1:2").Select
    Selection.Copy
    Sheets("Sheet1").Select
    Rows("1:2").Select
    ActiveSheet.Paste
    Sheets("TestH").Select
    Rows("34:35").Select
    Application.CutCopyMode = False
    Selection.Copy
    Sheets("Sheet1").Select
    Rows("34:35").Select
    ActiveSheet.Paste
End Sub

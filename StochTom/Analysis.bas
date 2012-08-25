Attribute VB_Name = "Module1"
Sub analysis()
Attribute analysis.VB_ProcData.VB_Invoke_Func = " \n14"
'
' analysis Macro
'

'
    ActiveWorkbook.RunAutoMacros Which:=xlAutoClose
    ChDir "C:\Documents and Settings\Hester_lab\Desktop\small-stoch-model\StochTom"
    Workbooks.OpenText Filename:= _
        "C:\Documents and Settings\Hester_lab\Desktop\small-stoch-model\StochTom\Test.txt" _
        , Origin:=437, StartRow:=1, DataType:=xlDelimited, TextQualifier:= _
        xlDoubleQuote, ConsecutiveDelimiter:=True, Tab:=True, Semicolon:=False, _
        Comma:=False, Space:=True, Other:=False, FieldInfo:=Array(Array(1, 1), _
        Array(2, 1)), TrailingMinusNumbers:=True
    ActiveWindow.SmallScroll Down:=60
    Range("B74").Select
    ActiveCell.FormulaR1C1 = "=AVERAGE(R[-31]C:R[-2]C)"
    Range("B75").Select
    ActiveCell.FormulaR1C1 = "=STDEV(R[-32]C:R[-3]C)"
    Range("B77").Select
    ActiveCell.FormulaR1C1 = "=R[-3]C-2*R[-2]C"
    Range("B78").Select
    ActiveCell.FormulaR1C1 = "=R[-4]C+2*R[-3]C"
    Range("B74:B78").Select
    Selection.Copy
    Range("C74:AO78").Select
    ActiveSheet.Paste
    ActiveWindow.SmallScroll Down:=-48
    Range("B3:B28").Select
    Application.CutCopyMode = False
    Selection.Copy
    ActiveWindow.SmallScroll Down:=15
    Range("B42:Z42").Select
    Selection.PasteSpecial Paste:=xlPasteAll, Operation:=xlNone, SkipBlanks:= _
        False, Transpose:=True
    Range("B29:B41").Select
    Application.CutCopyMode = False
    Selection.Copy
    Range("AB42:AL42").Select
    Selection.PasteSpecial Paste:=xlPasteAll, Operation:=xlNone, SkipBlanks:= _
        False, Transpose:=True
    Range("AN42").Select
    Application.CutCopyMode = False
    Selection.Copy
    Range("AO42").Select
    ActiveSheet.Paste
    Application.CutCopyMode = False
    ActiveCell.FormulaR1C1 = "CardiacOutput.RVRb"
    Range("AO43").Select
    ActiveWindow.SmallScroll Down:=-45
    Range("B3:AS41").Select
    Range("B41").Activate
    Selection.Delete Shift:=xlUp
End Sub

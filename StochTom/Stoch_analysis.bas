Attribute VB_Name = "Module1"
Sub Stoch_Analysis()
Attribute Stoch_Analysis.VB_ProcData.VB_Invoke_Func = " \n14"
'
' Stoch_Analysis Macro
'

'
    Workbooks.OpenText Filename:= _
        "C:\Documents and Settings\Hester_lab\Desktop\Test_Scripts\StochTom\Test.txt", _
        Origin:=437, StartRow:=1, DataType:=xlDelimited, TextQualifier:= _
        xlDoubleQuote, ConsecutiveDelimiter:=True, Tab:=True, Semicolon:=False, _
        Comma:=False, Space:=True, Other:=False, FieldInfo:=Array(Array(1, 1), _
        Array(2, 1)), TrailingMinusNumbers:=True
    ActiveWindow.SmallScroll Down:=57
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
    ActiveWindow.SmallScroll Down:=0
    Range("AE74").Select
    ActiveWindow.SmallScroll Down:=-45
    Range("B3:B42").Select
    Application.CutCopyMode = False
    Selection.Cut
    ActiveWindow.SmallScroll Down:=18
    Range("B42").Select
    ActiveWindow.SmallScroll Down:=18
    Range("B42:AM42").Select
    ActiveWindow.SmallScroll Down:=-39
    Range("B3:B42").Select
    Application.CutCopyMode = False
    Selection.Copy
    ActiveWindow.SmallScroll Down:=15
    Range("B42:AM42").Select
    ActiveWindow.SmallScroll Down:=-33
    Range("H23").Select
    ActiveWindow.SmallScroll Down:=-12
    Range("B3:B28").Select
    Application.CutCopyMode = False
    Selection.Copy
    ActiveWindow.SmallScroll Down:=18
    Range("B42:Z42").Select
    Selection.PasteSpecial Paste:=xlPasteAll, Operation:=xlNone, SkipBlanks:= _
        False, Transpose:=True
    ActiveWindow.SmallScroll Down:=-9
    Range("B29:B41").Select
    Application.CutCopyMode = False
    Selection.Copy
    Range("AA42:AJ42").Select
    Selection.PasteSpecial Paste:=xlPasteAll, Operation:=xlNone, SkipBlanks:= _
        False, Transpose:=True
    Range("AM42").Select
    Application.CutCopyMode = False
    Selection.Copy
    Range("AN42").Select
    ActiveSheet.Paste
    Application.CutCopyMode = False
    ActiveCell.FormulaR1C1 = "CardiacOutput.RVRb"
    Range("AN43").Select
    ActiveWindow.ScrollColumn = 7
    ActiveWindow.ScrollColumn = 6
    ActiveWindow.ScrollColumn = 5
    ActiveWindow.ScrollColumn = 4
    ActiveWindow.ScrollColumn = 3
    ActiveWindow.ScrollColumn = 2
    ActiveWindow.ScrollColumn = 1
    Range("B3:B41").Select
    Range("B41").Activate
    ActiveWindow.SmallScroll Down:=-24
    Range("B3:AO41").Select
    Selection.Delete Shift:=xlUp
End Sub

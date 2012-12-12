Attribute VB_Name = "Module11"
Sub AnalysisPackage()




Open_fast
MakeSheets
SetHisto
'ComputeDeltaMAP

End Sub

Sub Open_fast()
'
' Open_fast Macro
'

'
    ChDir "C:\Documents and Settings\Hester_lab\Desktop\Test_Scripts\NASA\"
    Workbooks.OpenText Filename:= _
        "C:\Documents and Settings\Hester_lab\Desktop\Test_Scripts\NASA\dummy.txt" _
        , Origin:=437, StartRow:=1, DataType:=xlDelimited, TextQualifier:= _
        xlDoubleQuote, ConsecutiveDelimiter:=True, Tab:=True, Semicolon:=False, _
        Comma:=True, Space:=True, Other:=False, FieldInfo:=Array(Array(1, 1), _
        Array(2, 1)), TrailingMinusNumbers:=True
    Range("B3:B14").Select
    Selection.Copy
    Range("A2:L2").Select
    Selection.PasteSpecial Paste:=xlPasteAll, Operation:=xlNone, SkipBlanks:= _
        False, Transpose:=True
    Application.CutCopyMode = False
    Rows("3:13").Select
    Selection.Delete Shift:=xlUp
    Range("A2").Select
End Sub

Sub MakeSheets()
    Sheets.Add
    Sheets("Sheet1").Select
    Sheets("Sheet1").Name = "sheet0"
    
    Sheets("dummy").Select
    Rows("2:2").Select
    Selection.Copy
    Sheets.Add
    Sheets("Sheet2").Select
    Sheets("Sheet2").Name = "10080"
    Range("A1").Select
    ActiveSheet.Paste
    

    Sheets("dummy").Select
    Rows("2:2").Select
    Selection.Copy
    Sheets.Add
    Sheets("Sheet3").Select
    Sheets("Sheet3").Name = "20160"
    Range("A1").Select
    ActiveSheet.Paste

    Sheets("dummy").Select
    Rows("2:2").Select
    Selection.Copy
    Sheets.Add
    Sheets("Sheet4").Select
    Sheets("Sheet4").Name = "20280"
    Range("A1").Select
    ActiveSheet.Paste
    
    Sheets("dummy").Select
    Rows("2:2").Select
    Selection.Copy
    Sheets.Add
    Sheets("Sheet5").Select
    Sheets("Sheet5").Name = "20310"
    Range("A1").Select
    ActiveSheet.Paste
    
    Sheets("dummy").Select
    Rows("2:2").Select
    Selection.Copy
    Sheets.Add
    Sheets("Sheet6").Select
    Sheets("Sheet6").Name = "20440"
    Range("A1").Select
    ActiveSheet.Paste
    
    Sheets("dummy").Select
    
End Sub



Sub SetHisto()

Dim Bins(1 To 100) As Integer
Dim TheRange As Range
Dim MAP As Integer
Dim Counter As Integer

'Initialize'
For i = 1 To 100
    Bins(i) = 0
Next i
Counter = 0

'Loop
Do While Range("A3") <> ""
    If Range("A3").Value <> 10080 Then
        'Delete t=0 and nonconverging solutions
        Rows("3:3").Select
        Selection.Delete Shift:=xlUp
    Else
        'get pressures for collapse histogram and split to spare sheets
        MAP = Round(Range("F3").Value - Range("F7").Value)
        If MAP > 100 Then MAP = 100
        If MAP < 1 Then MAP = 1
        Bins(MAP) = Bins(MAP) + 1
        Separate_fast (Counter)
        Counter = Counter + 1
    End If
Loop


Sheets("sheet0").Select
Range("A1").Select

Set TheRange = ActiveCell.Range(Cells(1, 1), Cells(1, 100))
TheRange.Value = Bins

    Rows("1:1").Select
    ActiveSheet.Shapes.AddChart.Select
    ActiveChart.SetSourceData Source:=Range("'sheet0'!$1:$1")
    ActiveChart.ChartType = xlLine

End Sub

Sub Separate_fast(cntr)
'
'
  
    cntr = cntr + 2
    Sheets("dummy").Select
    Rows("3:3").Select
    Selection.Copy
    Sheets("10080").Select
    Range("A" & cntr).Select
    ActiveSheet.Paste
    
    Sheets("dummy").Select
    Rows("4:4").Select
    Selection.Copy
    Sheets("20160").Select
    Range("A" & cntr).Select
    ActiveSheet.Paste
    
    Sheets("dummy").Select
    Rows("5:5").Select
    Selection.Copy
    Sheets("20280").Select
    Range("A" & cntr).Select
    ActiveSheet.Paste
    
    Sheets("dummy").Select
    Rows("6:6").Select
    Selection.Copy
    Sheets("20310").Select
    Range("A" & cntr).Select
    ActiveSheet.Paste
    
    Sheets("dummy").Select
    Rows("7:7").Select
    Selection.Copy
    Sheets("20440").Select
    Range("A" & cntr).Select
    ActiveSheet.Paste
  
    Sheets("dummy").Select
    Rows("3:7").Select
    Selection.Delete Shift:=xlUp
    Range("A2").Select
End Sub

Sub PasteToNew()

   Rows("2:7").Select
    Selection.Copy
    Sheets.Add
    Range("A2").Select
    ActiveSheet.Paste
    Range("A1").Select
    Application.CutCopyMode = False
    ActiveCell.FormulaR1C1 = ""
End Sub

Sub MeansAndDevs10080(cntr)

    cntr = cntr + 2
    Sheets("10080").Select
    Range("A" & cntr).Select
    ActiveCell.FormulaR1C1 = "=AVERAGE(R[- cntr]C:R[-2]C)"
    ActiveCell.FormulaR1C1 = "=STDEV(R[-cntr-1]C:R[-3]C)"
    
    Range("A" & cntr).Select
    Selection.Copy
    Rows(cntr).Select
    ActiveSheet.Paste
    Range("A" & cntr + 1).Select
    Selection.Copy
    Rows(cntr + 1).Select
    ActiveSheet.Paste

End Sub

Sub MeansAndDevs20160(cntr)

    cntr = cntr + 2
    Sheets("20160").Select
    Range("A" & cntr).Select
    ActiveCell.FormulaR1C1 = "=AVERAGE(R[-cntr]C:R[-2]C)"
    ActiveCell.FormulaR1C1 = "=STDEV(R[-cntr-1]C:R[-3]C)"
    
    Range("A" & cntr).Select
    Selection.Copy
    Rows(cntr).Select
    ActiveSheet.Paste
    Range("A" & cntr + 1).Select
    Selection.Copy
    Rows(cntr + 1).Select
    ActiveSheet.Paste

End Sub

Sub MeansAndDevs20280(cntr)

    cntr = cntr + 2
    Sheets("20280").Select
    Range("A" & cntr).Select
    ActiveCell.FormulaR1C1 = "=AVERAGE(R[-cntr]C:R[-2]C)"
    ActiveCell.FormulaR1C1 = "=STDEV(R[-cntr-1]C:R[-3]C)"
    
    Range("A" & cntr).Select
    Selection.Copy
    Rows(cntr).Select
    ActiveSheet.Paste
    Range("A" & cntr + 1).Select
    Selection.Copy
    Rows(cntr + 1).Select
    ActiveSheet.Paste

End Sub

Sub MeansAndDevs20310(cntr)

    cntr = cntr + 2
    Sheets("20310").Select
    Range("A" & cntr).Select
    ActiveCell.FormulaR1C1 = "=AVERAGE(R[-cntr]C:R[-2]C)"
    ActiveCell.FormulaR1C1 = "=STDEV(R[-cntr-1]C:R[-3]C)"
    
    Range("A" & cntr).Select
    Selection.Copy
    Rows(cntr).Select
    ActiveSheet.Paste
    Range("A" & cntr + 1).Select
    Selection.Copy
    Rows(cntr + 1).Select
    ActiveSheet.Paste

End Sub

Sub MeansAndDevs20440(cntr)

    cntr = cntr + 2
    Sheets("20440").Select
    Range("A" & cntr).Select
    ActiveCell.FormulaR1C1 = "=AVERAGE(R[-cntr]C:R[-2]C)"
    ActiveCell.FormulaR1C1 = "=STDEV(R[-cntr-1]C:R[-3]C)"
    
    Range("A" & cntr).Select
    Selection.Copy
    Rows(cntr).Select
    ActiveSheet.Paste
    Range("A" & cntr + 1).Select
    Selection.Copy
    Rows(cntr + 1).Select
    ActiveSheet.Paste

End Sub





Attribute VB_Name = "Module11"
Sub AnalysisPackage()




Open_slow
MAP_Sheet
SetHisto

End Sub

Sub Open_slow()
'
' Open_fast Macro
'

'
    ChDir "C:\Documents and Settings\Hester_lab\Desktop\small-stoch-model\StochTom"
    Workbooks.OpenText Filename:= _
        "C:\Documents and Settings\Hester_lab\Desktop\small-stoch-model\StochTom\TestSH.txt" _
        , Origin:=437, StartRow:=1, DataType:=xlDelimited, TextQualifier:= _
        xlDoubleQuote, ConsecutiveDelimiter:=True, Tab:=True, Semicolon:=False, _
        Comma:=True, Space:=True, Other:=False, FieldInfo:=Array(Array(1, 1), _
        Array(2, 1)), TrailingMinusNumbers:=True
    Range("B3:B69").Select
    Selection.Copy
    Range("A2:BQ2").Select
    Selection.PasteSpecial Paste:=xlPasteAll, Operation:=xlNone, SkipBlanks:= _
        False, Transpose:=True
    Application.CutCopyMode = False
    Rows("3:71").Select
    Selection.Delete Shift:=xlUp
    Range("A2").Select
End Sub

Sub MAP_Sheet()
    Sheets.Add
    Sheets("Sheet1").Select
    Sheets("Sheet1").Name = "MAPEnd"
    
    Sheets("TestSH").Select
    Rows("2:2").Select
    Selection.Copy
    Sheets.Add
    Sheets("Sheet2").Select
    Sheets("Sheet2").Name = "28800"
    Range("A1").Select
    ActiveSheet.Paste
    

    Sheets("TestSH").Select
    Rows("2:2").Select
    Selection.Copy
    Sheets.Add
    Sheets("Sheet3").Select
    Sheets("Sheet3").Name = "28815"
    Range("A1").Select
    ActiveSheet.Paste

    Sheets("TestSH").Select
    Rows("2:2").Select
    Selection.Copy
    Sheets.Add
    Sheets("Sheet4").Select
    Sheets("Sheet4").Name = "28830"
    Range("A1").Select
    ActiveSheet.Paste
    
    Sheets("TestSH").Select
    Rows("2:2").Select
    Selection.Copy
    Sheets.Add
    Sheets("Sheet5").Select
    Sheets("Sheet5").Name = "28845"
    Range("A1").Select
    ActiveSheet.Paste
    
    Sheets("TestSH").Select
    Rows("2:2").Select
    Selection.Copy
    Sheets.Add
    Sheets("Sheet6").Select
    Sheets("Sheet6").Name = "28860"
    Range("A1").Select
    ActiveSheet.Paste
    
    Sheets("TestSH").Select
    
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
    If Range("A3").Value <> 28800 Then
        'Delete t=0 and nonconverging solutions
        Rows("3:3").Select
        Selection.Delete Shift:=xlUp
    Else
        'get pressures for collapse histogram and split to spare sheets
        MAP = Round(Range("F3").Value - Range("F7").Value)
        If MAP > 100 Then MAP = 100
        If MAP < 1 Then MAP = 1
        Bins(MAP) = Bins(MAP) + 1
        Separate_Slow (Counter)
        Counter = Counter + 1
    End If
Loop

'MeansAndDevs28800 (Counter)
'MeansAndDevs28815 (Counter)
'MeansAndDevs28830 (Counter)
'MeansAndDevs28845 (Counter)
'MeansAndDevs28860 (Counter)


Sheets("MAPEnd").Select
Range("A1").Select

Set TheRange = ActiveCell.Range(Cells(1, 1), Cells(1, 100))
TheRange.Value = Bins

    Rows("1:1").Select
    ActiveSheet.Shapes.AddChart.Select
    ActiveChart.SetSourceData Source:=Range("'MAPEnd'!$1:$1")
    ActiveChart.ChartType = xlLine

End Sub

Sub Separate_Slow(cntr)
'
' Separate_Slow Macro
'
  
 'PasteToNew
     
    cntr = cntr + 1
    Sheets("TestSH").Select
    Rows("3:3").Select
    Selection.Copy
    Sheets("28800").Select
    Range("A" & cntr).Select
    ActiveSheet.Paste
    
    Sheets("TestSH").Select
    Rows("4:4").Select
    Selection.Copy
    Sheets("28815").Select
    Range("A" & cntr).Select
    ActiveSheet.Paste
    
    Sheets("TestSH").Select
    Rows("5:5").Select
    Selection.Copy
    Sheets("28830").Select
    Range("A" & cntr).Select
    ActiveSheet.Paste
    
    Sheets("TestSH").Select
    Rows("6:6").Select
    Selection.Copy
    Sheets("28845").Select
    Range("A" & cntr).Select
    ActiveSheet.Paste
    
    Sheets("TestSH").Select
    Rows("7:7").Select
    Selection.Copy
    Sheets("28860").Select
    Range("A" & cntr).Select
    ActiveSheet.Paste
  
    Sheets("TestSH").Select
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

Sub MeansAndDevs28800(cntr)

    cntr = cntr + 2
    Sheets("28800").Select
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

Sub MeansAndDevs28815(cntr)

    cntr = cntr + 2
    Sheets("28815").Select
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

Sub MeansAndDevs28830(cntr)

    cntr = cntr + 2
    Sheets("28830").Select
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

Sub MeansAndDevs28845(cntr)

    cntr = cntr + 2
    Sheets("28845").Select
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

Sub MeansAndDevs28860(cntr)

    cntr = cntr + 2
    Sheets("28860").Select
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


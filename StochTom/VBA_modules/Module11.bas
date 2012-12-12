Attribute VB_Name = "Module11"
Sub AnalysisPackage()




Open_fast
MakeSheets
'SetHisto
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
    Sheets("Sheet1").Name = "MAPEnd"
    
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
    
    Sheets("TestFH").Select
    
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
        Separate_fast (Counter)
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

Sub Separate_fast(cntr)
'
' Separate_Slow Macro
'
  
 'PasteToNew
     
    cntr = cntr + 1
    Sheets("TestFH").Select
    Rows("3:3").Select
    Selection.Copy
    Sheets("28800").Select
    Range("A" & cntr).Select
    ActiveSheet.Paste
    
    Sheets("TestFH").Select
    Rows("4:4").Select
    Selection.Copy
    Sheets("28805").Select
    Range("A" & cntr).Select
    ActiveSheet.Paste
    
    Sheets("TestFH").Select
    Rows("5:5").Select
    Selection.Copy
    Sheets("28810").Select
    Range("A" & cntr).Select
    ActiveSheet.Paste
    
    Sheets("TestFH").Select
    Rows("6:6").Select
    Selection.Copy
    Sheets("28815").Select
    Range("A" & cntr).Select
    ActiveSheet.Paste
    
    Sheets("TestFH").Select
    Rows("7:7").Select
    Selection.Copy
    Sheets("28820").Select
    Range("A" & cntr).Select
    ActiveSheet.Paste
  
    Sheets("TestFH").Select
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

Sub MeansAndDevs28805(cntr)

    cntr = cntr + 2
    Sheets("28805").Select
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

Sub MeansAndDevs28810(cntr)

    cntr = cntr + 2
    Sheets("28810").Select
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

Sub MeansAndDevs28820(cntr)

    cntr = cntr + 2
    Sheets("28820").Select
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



Sub ComputeDeltaMAP()
'
' Macro1 Macro
'

'
    Sheets("28820").Select
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
    ActiveWindow.ScrollRow = 60
    ActiveWindow.ScrollRow = 59
    ActiveWindow.ScrollRow = 58
    ActiveWindow.ScrollRow = 57
    ActiveWindow.ScrollRow = 56
    ActiveWindow.ScrollRow = 55
    ActiveWindow.ScrollRow = 54
    ActiveWindow.ScrollRow = 53
    ActiveWindow.ScrollRow = 52
    ActiveWindow.ScrollRow = 51
    ActiveWindow.ScrollRow = 50
    ActiveWindow.ScrollRow = 49
    ActiveWindow.ScrollRow = 48
    ActiveWindow.ScrollRow = 47
    ActiveWindow.ScrollRow = 46
    ActiveWindow.ScrollRow = 45
    ActiveWindow.ScrollRow = 44
    ActiveWindow.ScrollRow = 43
    ActiveWindow.ScrollRow = 42
    ActiveWindow.ScrollRow = 41
    ActiveWindow.ScrollRow = 40
    ActiveWindow.ScrollRow = 39
    ActiveWindow.ScrollRow = 38
    ActiveWindow.ScrollRow = 37
    ActiveWindow.ScrollRow = 36
    ActiveWindow.ScrollRow = 35
    ActiveWindow.ScrollRow = 34
    ActiveWindow.ScrollRow = 33
    ActiveWindow.ScrollRow = 32
    ActiveWindow.ScrollRow = 31
    ActiveWindow.ScrollRow = 29
    ActiveWindow.ScrollRow = 28
    ActiveWindow.ScrollRow = 27
    ActiveWindow.ScrollRow = 26
    ActiveWindow.ScrollRow = 25
    ActiveWindow.ScrollRow = 24
    ActiveWindow.ScrollRow = 23
    ActiveWindow.ScrollRow = 22
    ActiveWindow.ScrollRow = 21
    ActiveWindow.ScrollRow = 20
    ActiveWindow.ScrollRow = 19
    ActiveWindow.ScrollRow = 18
    ActiveWindow.ScrollRow = 17
    ActiveWindow.ScrollRow = 16
    ActiveWindow.ScrollRow = 15
    ActiveWindow.ScrollRow = 14
    ActiveWindow.ScrollRow = 13
    ActiveWindow.ScrollRow = 12
    ActiveWindow.ScrollRow = 11
    ActiveWindow.ScrollRow = 10
    ActiveWindow.ScrollRow = 9
    ActiveWindow.ScrollRow = 8
    ActiveWindow.ScrollRow = 7
    ActiveWindow.ScrollRow = 6
    ActiveWindow.ScrollRow = 5
    ActiveWindow.ScrollRow = 4
    ActiveWindow.ScrollRow = 3
    ActiveWindow.ScrollRow = 2
    ActiveWindow.ScrollRow = 1
    Range("AQ1").Select
    ActiveCell.FormulaR1C1 = "='28800'!RC[-37]-'28820'!RC[-37]"
    Range("AQ1").Select
    Selection.Copy
    Range("AQ2:AQ200").Select
    ActiveSheet.Paste
    Range("AR1").Select
    Application.CutCopyMode = False
End Sub


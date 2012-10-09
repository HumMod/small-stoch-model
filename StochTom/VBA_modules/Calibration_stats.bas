Attribute VB_Name = "Module1"
Sub Macro2()
Attribute Macro2.VB_ProcData.VB_Invoke_Func = " \n14"
'
' Macro2 Macro
'

'
    Range("A25").Select
    ActiveCell.FormulaR1C1 = "=AVERAGE(R[-22]C:R[-2]C)"
    Range("A26").Select
    ActiveCell.FormulaR1C1 = "=STDEV(R[-23]C:R[-3]C)"
    Range("A25:A26").Select
    Selection.Copy
    Range("B25:BU26").Select
    ActiveSheet.Paste
End Sub

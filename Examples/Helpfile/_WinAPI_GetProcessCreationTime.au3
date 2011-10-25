#Include <WinAPIEx.au3>

Opt('MustDeclareVars ', 1)

Global $tSYSTEMTIME, $Hour, $Minute, $Second, $Id = ProcessExists('Explorer.exe')

If $Id > 0 Then
	$tSYSTEMTIME = _WinAPI_GetProcessCreationTime($Id)
	$Hour = DllStructGetData($tSYSTEMTIME, 'Hour')
	$Minute = StringFormat('%02s ', DllStructGetData($tSYSTEMTIME, 'Minute'))
	$Second = StringFormat('%02s ', DllStructGetData($tSYSTEMTIME, 'Second'))
	msgbox('', 'Process Creation Time ', 'Explorer was run at:' & $Hour & ':' & $Minute & ':' & $Second & @CR)
EndIf


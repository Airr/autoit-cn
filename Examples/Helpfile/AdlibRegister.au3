AdlibRegister("MyAdlib")
;...
Exit

Func MyAdlib()
	;... �����о�������ʹ�õȴ�Ч���ĺ���, ���� Wait(), MsgBox(), InputBox()��...
	If WinActive("Error") Then
		;...
	EndIf
EndFunc   ;==>MyAdlib

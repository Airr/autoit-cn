$oShell = ObjCreate("shell.application")
if not IsObj($oShell) then
	Msgbox(0,"����","$oShell ����һ������.")
else
	Msgbox(0,"�ɹ�","�ɹ��������� $oShell.")
endif

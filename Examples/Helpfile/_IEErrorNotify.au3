; *******************************************************
; ʾ�� 1 - ��� _IEErrorNotify �ĵ�ǰ״̬, �������ر���, ��֮����
; *******************************************************

#include <IE.au3>

If _IEErrorNotify() Then
	MsgBox(4096, "_IEErrorNotify Status", "Notification is ON, turning it OFF")
	_IEErrorNotify(False)
Else
	MsgBox(4096, "_IEErrorNotify Status", "Notification is OFF, turning it ON")
	_IEErrorNotify(True)
EndIf

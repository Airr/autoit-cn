#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; ��ʾ��¼���û��ͱ��ؼ��������
; *****************************************************************************
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

; ���ص�¼���û��ͱ��ؼ��������
msgbox(64, "Active Directory Functions", _
		"Class for logged on user:" & _AD_GetObjectClass(@UserName) & @CRLF & _
		"Class for local computer:" & _AD_GetObjectClass(@ComputerName & "$"))

; �ر�Active Directory����
_AD_Close()


#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Example1()
Example2()

;ʾ�� 1
Func Example1()
	Local $msg

	GUICreate("My GUI") ; ����һ��������ʾ�� GUI ����
	GUISetState(@SW_SHOW) ; ��ʾһ���հ׵Ĵ���

	; ���н���,ֱ�����ڱ��ر�
	While 1
		$msg = GUIGetMsg()

		If $msg = $GUI_EVENT_CLOSE Then ExitLoop
	WEnd
	GUIDelete()
EndFunc   ;==>Example1

;ʾ�� 2
Func Example2()
	Local $sFile = "..\GUI\logo4.gif"

	Local $gui = GUICreate("Background", 400, 100)
	; ��������ͼƬ
	GUICtrlCreatePic("..\GUI\msoobe.jpg", 0, 0, 400, 100)

	GUISetState(@SW_SHOW)

	; ����͸���� MDI�Ӵ���
	GUICreate("", 169, 68, 20, 20, $WS_POPUP, BitOR($WS_EX_LAYERED, $WS_EX_MDICHILD), $gui)
	; ͸��ͼƬ
	GUICtrlCreatePic($sFile, 0, 0, 169, 68)
	GUISetState(@SW_SHOW)

	Do
		Local $msg = GUIGetMsg()

	Until $msg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example2
#include  <ScreenCapture.au3>

_Main()

Func _Main()
	Local $hGUI

	; ��������
	$hGUI = GUICreate(" Screen Capture ", 400, 300)
	GUISetState()

	; ��׽����
	_ScreenCapture_CaptureWnd(@MyDocumentsDir & " \GDIPlus_Image.jpg ", $hGUI)

endfunc   ;==>_Main


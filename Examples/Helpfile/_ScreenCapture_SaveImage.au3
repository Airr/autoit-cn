#include <ScreenCapture.au3>

_Main()

Func _Main()
	Local $hBmp

	; ����������Ļ
	$hBmp = _ScreenCapture_Capture("")

	; ����λͼ���ļ�
	_ScreenCapture_SaveImage(@MyDocumentsDir & "\GDIPlus_Image.jpg", $hBmp)

EndFunc   ;==>_Main

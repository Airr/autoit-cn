#include <ScreenCapture.au3>

_Main()

Func _Main()
	Local $hBmp

	; ��׽ȫ��
	$hBmp = _ScreenCapture_Capture("")

	; ��λͼ���浽�ļ�
	_ScreenCapture_SaveImage(@MyDocumentsDir & " \GDIPlus_Image.jpg ", $hBmp)

endfunc   ;==>_Main


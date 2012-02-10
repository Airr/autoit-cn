#Include <GDIPlusEx.au3>
#Include <ScreenCapture.au3>

Opt('MustDeclareVars ', 1)

_Example()

Func _Example()
	Local $hBitmap, $hBmp, $iColor

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hBmp = _ScreenCapture_Capture("", 0, 0, -1, -1, False)
	$hBmp = _ScreenCapture_Capture("", 0, 0, -1, -1, False)

	; ��GDIλͼ���󴴽�GDI+λͼ����
	$hBitmap = _GDIPlus_BitmapCreateFromHBITMAP($hBmp)
	$iColor = _GDIPlus_BitmapGetPixel($hBitmap, 150, 150)

	MsgBox(0x40, "Color ", "Bitmap Pixel Color at [150, 150] is: 0x" & Hex($iColor))

	; �����Դ
	_GDIPlus_ImageDispose($hBitmap)
	_WinAPI_DeleteObject($hBmp)

	; �ر�GDI+��
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


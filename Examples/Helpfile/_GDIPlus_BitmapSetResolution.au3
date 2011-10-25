#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>
#Include <ScreenCapture.au3>

Opt('MustDeclareVars ', 1)

_Example()

Func _Example()
	Local $hBitmap, $hBmp, $hGraphics

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hBmp = _ScreenCapture_Capture("", 0, 0, -1, -1, False)
	$hBitmap = _GDIPlus_BitmapCreateFromHBITMAP($hBmp)

	; ����ÿӢ��96x144��, ͨ��Ϊ96x96��120x120: ����ͬ��
	_GDIPlus_BitmapSetResolution($hBitmap, 96, 144)

	_GDIPlus_ImageSaveToFile($hBitmap, @MyDocumentsDir & " \96x144.jpg ")

	; �����Դ
	_GDIPlus_GraphicsDispose($hGraphics)
	_GDIPlus_ImageDispose($hBitmap)
	_WinAPI_DeleteObject($hBmp)

	; �ر�GDI+��
	_GDIPlus_Shutdown()

	ShellExecute(@MyDocumentsDir & " \96x144.jpg ")
endfunc   ;==>_Example


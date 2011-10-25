#Include <GDIPlusEx.au3>
#Include <ScreenCapture.au3>
#Include <WinAPIEx.au3>

Opt('MustDeclareVars ', 1)

_Example()

Func _Example()
	Local $hInst, $hIcon, $hBitmap

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hInst = _WinAPI_GetModuleHandle(" user32.dll ")
	$hIcon = _WinAPI_LoadIcon($hInst, 104)

	$hBitmap = _GDIPlus_BitmapCreateFromHICON($hIcon)

	; ��ͼ��ͼ�񱣴�Ϊ�ļ�
	_GDIPlus_ImageSaveToFile($hBitmap, @MyDocumentsDir & " \Information.jpg ")

	; �����Դ
	_GDIPlus_ImageDispose($hBitmap)
	_WinAPI_DestroyIcon($hIcon)

	; �ر�GDI+��
	_GDIPlus_Shutdown()

	ShellExecute(@MyDocumentsDir & " \Information.jpg ")
endfunc   ;==>_Example


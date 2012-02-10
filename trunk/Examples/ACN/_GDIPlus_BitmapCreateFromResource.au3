#Include <GDIPlusEx.au3>
#Include <ScreenCapture.au3>
#Include <WinAPIEx.au3>

Opt('MustDeclareVars ', 1)

_Example()

Func _Example()
	Local $hInst, $hBitmap

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hInst = _WinAPI_LoadLibrary(@SystemDir & " taskmgr.exe ")
	$hBitmap = _GDIPlus_BitmapCreateFromResource($hInst, 103)

	; ��ͼ��ͼ�񱣴�Ϊ�ļ�
	_GDIPlus_ImageSaveToFile($hBitmap, @MyDocumentsDir & " \ResourceTest.jpg ")

	; �����Դ
	_GDIPlus_ImageDispose($hBitmap)
	_WinAPI_FreeLibrary($hInst)

	; �ر�GDI+��
	_GDIPlus_Shutdown()

	ShellExecute(@MyDocumentsDir & " \ResourceTest.jpg ")
endfunc   ;==>_Example


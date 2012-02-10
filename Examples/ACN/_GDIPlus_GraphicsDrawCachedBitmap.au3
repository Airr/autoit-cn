#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>
#Include <ScreenCapture.au3>

Opt('MustDeclareVars ', 1)

_Example()

Func _Example()
	Local $hGUI
	Local $hBitmap, $hBmp, $hGraphics, $hCachedBitmap

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	; ����GUI����, ��ESC�˳�
	$hGUI = GUICreate("", @DesktopWidth, @DesktopHeight)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	$hBmp = _ScreenCapture_Capture("", 0, 0, -1, -1, False)

	; ��GDIλͼ���󴴽�GDI+λͼ����
	$hBitmap = _GDIPlus_BitmapCreateFromHBITMAP($hBmp)
	; ���Ѵ��ڵ�λͼ��ͼ�ζ��󴴽�����λͼ
	$hCachedBitmap = _GDIPlus_GraphicsDrawCachedBitmap($hBitmap, $hGraphics)
	GUISetState()

	; ���ƻ���λͼ
	_GDIPlus_GraphicsDrawCachedBitmap($hGraphics, $hCachedBitmap, 0, 0)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; �����Դ
	_GDIPlus_CachedBitmapDispose($hCachedBitmap)
	_GDIPlus_ImageDispose($hBitmap)
	_WinAPI_DeleteObject($hBmp)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+��
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


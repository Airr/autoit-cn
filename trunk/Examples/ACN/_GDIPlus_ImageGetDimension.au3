#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>
#Include <ScreenCapture.au3>
#Include <WinAPIEX.au3>

Opt('MustDeclareVars ', 1)

_Example()

Func _Example()
	Local $hGUI
	Local $hBitmap, $hBmp, $hGraphics
	Local $iColor, $iX, $iY, $iImageWidth, $iImageHeight
	Local $aSize

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	; ����GUI����, ��ESC�˳�
	$hGUI = GUICreate("", @DesktopWidth, @DesktopHeight)

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	$hBmp = _ScreenCapture_Capture("", 0, 0, -1, -1, False)

	; ��GDIλͼ���󴴽�GDI+λͼ����
	$hBitmap = _GDIPlus_BitmapCreateFromHBITMAP($hBmp)
	$aSize = _GDIPlus_ImageGetDimension($hBitmap)
	$iColor = $GDIP_DARKSEAGREEN

	$iImageWidth = $aSize[0]
	$iImageHeight = $aSize[1]

	For $iX = 0 To $iImageWidth Step 16
		For $iY = 0 To $iImageHeight Step 16
			_GDIPlus_BitmapSetPixel($hBitmap, $iX, $iY, $iColor)
		Next
	Next
	GUISetState()

	; ����ѡ������Ļ��׽
	_GDIPlus_GraphicsDrawImage($hGraphics, $hBitmap, 0, 0)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; �����Դ
	_GDIPlus_ImageDispose($hBitmap)
	_WinAPI_DeleteObject($hBmp)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+��
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


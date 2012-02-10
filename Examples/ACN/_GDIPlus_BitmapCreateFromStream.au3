#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>
#Include <Memory.au3>
#Include <ScreenCapture.au3>
#Include <WinAPIEx.au3>

Opt('MustDeclareVars ', 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics
	Local $hBitmap, $hBmp, $hBitmapFromStream
	Local $sEncoderCLSID, $tEncoderCLSID, $pEncoderCLSID
	Local $pStream

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	; ����GUI����, ��ESC�˳�
	$hGUI = GUICreate("", @DesktopWidth, @DesktopHeight)

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	$hBmp = _ScreenCapture_Capture("", 0, 0, -1, -1, False)
	$hBitmap = _GDIPlus_BitmapCreateFromHBITMAP($hBmp)

	$sEncoderCLSID = _GDIPlus_EncodersGetCLSID(" tiff ")
	$tEncoderCLSID = _WinAPI_GUIDFromString($sEncoderCLSID)
	$pEncoderCLSID = DllStructGetPtr($tEncoderCLSID)
	$pStream = _WinAPI_CreateStreamOnHGlobal(0)
	_GDIPlus_ImageSaveToStream($hBitmap, $pStream, $pEncoderCLSID)

	$hBitmapFromStream = _GDIPlus_BitmapCreateFromStream($pStream)

	GUISetState()
	_GDIPlus_GraphicsDrawImage($hGraphics, $hBitmapFromStream, 0, 0)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; �����Դ
	_GDIPlus_ImageDispose($hBitmapFromStream)
	_GDIPlus_ImageDispose($hBitmap)
	_WinAPI_DeleteObject($hBmp)

	; �ر�GDI+��
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


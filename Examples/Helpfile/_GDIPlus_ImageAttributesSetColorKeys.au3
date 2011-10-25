#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>
#Include <ScreenCapture.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hBmp, $hBitmap, $hIA

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	; ����GUI����, ��ESC�˳�
	$hGUI = GUICreate("", @DesktopWidth, @DesktopHeight / 2)
	GUISetBkColor(0x00C080)

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	$hBmp = _ScreenCapture_Capture("", 0, 0, -1, -1, False)

	; ��GDIλͼ���󴴽�GDI+λͼ����
	$hBitmap = _GDIPlus_BitmapCreateFromHBITMAP($hBmp)
	; ����ImageAttribute����������ɫ��
	$hIA = _GDIPlus_ImageAttributesCreate()
	; ����4210752��ɫ��ȫ��Χ͸��
	_GDIPlus_ImageAttributesSetColorKeys($hIA, 0, True, 0xFF000000, 0xFF404040)

	GUISetState()

	; ���ò�ֵģʽ�����ѹ������
	_GDIPlus_GraphicsSetInterpolationMode($hGraphics, 7)

	; Ӧ��ͼ�����ʱ����ͼ��
	_GDIPlus_GraphicsDrawImageRectRectIA($hGraphics, $hBitmap, 0, 0, @DesktopWidth, @DesktopHeight, 0, 0, @DesktopWidth, @DesktopHeight / 2, $hIA)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_ImageAttributesDispose($hIA)
	_WinAPI_DeleteObject($hBmp)
	_GDIPlus_ImageDispose($hBitmap)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


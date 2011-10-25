#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>
#Include <ScreenCapture.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hBmp, $hBitmap, $hIA, $tColorMatrix, $pColorMatrix, $iWidth, $iHeight, $aSize

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	; ����GUI����, ��ESC�˳�
	$hGUI = GUICreate("", @DesktopWidth, @DesktopHeight)

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	$hBmp = _ScreenCapture_Capture("", 0, 0, -1, -1, False)

	; ��GDIλͼ���󴴽�GDI+λͼ����
	$hBitmap = _GDIPlus_BitmapCreateFromHBITMAP($hBmp)
	; ����ImageAttribute����
	$hIA = _GDIPlus_ImageAttributesCreate()

	; �������ڵ���ͼ����ɫ����ɫ����
	; ʹ��͸����ɫ��������ͼ������
	$tColorMatrix = _GDIPlus_ColorMatrixCreateTranslate(0.15, 0.15, 0.15)
	$pColorMatrix = DllStructGetPtr($tColorMatrix)

	; ����ImageAttribute�ؼ�ɫ��ɫ����
	_GDIPlus_ImageAttributesSetColorMatrix($hIA, 0, True, $pColorMatrix)

	GUISetState()

	; ��ȡͼ���С
	$aSize = _GDIPlus_ImageGetDimension($hBitmap)
	$iWidth = $aSize[0]
	$iHeight = $aSize[1]

	; ���ò���ģʽ���ѹ������
	_GDIPlus_GraphicsSetInterpolationMode($hGraphics, 7)

	; ���Ʋ�׽��ͼ��
	_GDIPlus_GraphicsDrawImageRect($hGraphics, $hBitmap, 0, 0, @DesktopWidth, @DesktopHeight / 2) ; ����ʹ����ɫ������ͼ��
	_GDIPlus_GraphicsDrawImageRectRectIA($hGraphics, $hBitmap, 0, 0, $iWidth, $iHeight, 0, @DesktopHeight / 2, @DesktopWidth, @DesktopHeight / 2, $hIA)

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


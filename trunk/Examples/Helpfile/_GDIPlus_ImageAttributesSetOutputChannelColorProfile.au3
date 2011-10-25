#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>
#Include <ScreenCapture.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hBmp, $hBitmap, $hIA, $iWidth, $iHeight, $aSize

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	; ����GUI����, ��ESC�˳�
	$hGUI = GUICreate("", @DesktopWidth, @DesktopHeight)

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	$hBmp = _ScreenCapture_Capture("", 0, 0, -1, -1, False)

	; ��GDIλͼ���󴴽�GDI+λͼ����
	$hBitmap = _GDIPlus_BitmapCreateFromHBITMAP($hBmp)

	; ��ȡͼ���С
	$aSize = _GDIPlus_ImageGetDimension($hBitmap)
	$iWidth = $aSize[0]
	$iHeight = $aSize[1]

	GUISetState()

	; ���ò�ֵģʽΪ������˫���β�ֵ. ����ѹ��ͼ��ʱȷ��������
	_GDIPlus_GraphicsSetInterpolationMode($hGraphics, 7)

	; �������ڵ���ͼ����ɫ��ImageAttributes����
	$hIA = _GDIPlus_ImageAttributesCreate()

	; �������ͨ����ɫ�����ļ�
	_GDIPlus_ImageAttributesSetOutputChannelColorProfile($hIA, 1, True, "sRGB Color Space Profile.icm ")

	; ����ͼ��, ��ʾ��ɫͨ����ǿ��
	_GDIPlus_ImageAttributesSetOutputChannel($hIA, 1, True, 0) ; ��ɫ
	_GDIPlus_GraphicsDrawImageRectRectIA($hGraphics, $hBitmap, 0, 0, $iWidth, $iHeight, 0, 0, @DesktopHeight / 2, @DesktopHeight / 2, $hIA)

	; ����ͼ��, ��ʾ�Ϻ�ɫͨ����ǿ��
	_GDIPlus_ImageAttributesSetOutputChannel($hIA, 1, True, 1) ; �Ϻ�ɫ
	_GDIPlus_GraphicsDrawImageRectRectIA($hGraphics, $hBitmap, 0, 0, $iWidth, $iHeight, @DesktopWidth / 2, 0, @DesktopWidth / 2, @DesktopHeight / 2, $hIA)

	; ����ͼ��, ��ʾ��ɫͨ����ǿ��
	_GDIPlus_ImageAttributesSetOutputChannel($hIA, 1, True, 2) ; ��ɫ
	_GDIPlus_GraphicsDrawImageRectRectIA($hGraphics, $hBitmap, 0, 0, $iWidth, $iHeight, 0, @DesktopHeight / 2, @DesktopWidth / 2, @DesktopHeight / 2, $hIA)

	; ����ͼ��, ��ʾ��ɫͨ����ǿ��
	_GDIPlus_ImageAttributesSetOutputChannel($hIA, 1, True, 3) ; ��ɫ
	_GDIPlus_GraphicsDrawImageRectRectIA($hGraphics, $hBitmap, 0, 0, $iWidth, $iHeight, @DesktopWidth / 2, @DesktopHeight / 2, @DesktopWidth / 2, @DesktopHeight / 2, $hIA)

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


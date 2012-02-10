#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>
#Include <ScreenCapture.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hBmp, $hBitmap, $tPreHue, $tPostHue, $tColorMatrix, $pColorMatrix, $iWidth, $iHeight, $aSize
	Local $hBrightIA, $hHueIA, $hGrayIA, $hContIA

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	; ����GUI���� , ��ESC�˳�
	$hGUI = GUICreate("", @DesktopWidth, @DesktopHeight)

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	$hBmp = _ScreenCapture_Capture("", 0, 0, -1, -1, False)

	; ��GDIλͼ���󴴽�GDI+λͼ
	$hBitmap = _GDIPlus_BitmapCreateFromHBITMAP($hBmp)

	; ��������ImageAttributes����
	$hBrightIA = _GDIPlus_ImageAttributesCreate()
	; ����ɫ��ImageAttributes����
	$hHueIA = _GDIPlus_ImageAttributesCreate()
	; �����Ҷ�ImageAttributes����
	$hGrayIA = _GDIPlus_ImageAttributesCreate()
	; �����Աȶ�ImageAttributes����
	$hContIA = _GDIPlus_ImageAttributesCreate()

	; ������ɫ���Ⱦ���
	$tColorMatrix = _GDIPlus_ColorMatrixCreateTranslate(0.5, 0.5, 0.5)
	$pColorMatrix = DllStructGetPtr($tColorMatrix)

	; ��ͼ�����50%
	_GDIPlus_ImageAttributesSetColorMatrix($hBrightIA, 0, True, $pColorMatrix)

	; ������λ��ɫ����ɫ����ɫ����
	$tColorMatrix = _GDIPlus_ColorMatrixCreate()
	$tPreHue = _GDIPlus_ColorMatrixCreate()
	$tPostHue = _GDIPlus_ColorMatrixCreate()
	_GDIPlus_ColorMatrixInitHue($tPreHue, $tPostHue)
	$pColorMatrix = DllStructGetPtr($tColorMatrix)

	; ͨ����ת90�ȵ���ͼ��ɫ��
	_GDIPlus_ColorMatrixRotateHue($tColorMatrix, $tPreHue, $tPostHue, 90)
	_GDIPlus_ImageAttributesSetColorMatrix($hHueIA, 0, True, $pColorMatrix)

	; �����Ҷ���ɫ����
	$tColorMatrix = _GDIPlus_ColorMatrixCreateGrayScale()
	$pColorMatrix = DllStructGetPtr($tColorMatrix)

	; ���������ҶȻ���ͼ����ɫ
	_GDIPlus_ImageAttributesSetColorMatrix($hGrayIA, 0, True, $pColorMatrix)

	; �����Աȶ���ɫ����
	$tColorMatrix = _GDIPlus_ColorMatrixCreateScale(4, 4, 4)
	$pColorMatrix = DllStructGetPtr($tColorMatrix)

	; ͨ��ɫ����ת������ɫ
	_GDIPlus_ColorMatrixRotateHue($tColorMatrix, $tPreHue, $tPostHue, 0)

	; ����ͼ�ζԱȶ�
	_GDIPlus_ImageAttributesSetColorMatrix($hContIA, 0, True, $pColorMatrix)

	GUISetState()

	; ��ȡͼ��ߴ�
	$aSize = _GDIPlus_ImageGetDimension($hBitmap)
	$iWidth = $aSize[0]
	$iHeight = $aSize[1]

	; ���ò���ģʽ�����ѹ������
	_GDIPlus_GraphicsSetInterpolationMode($hGraphics, 7)

	; ���Ƶ������Ⱥ��ͼ��
	_GDIPlus_GraphicsDrawImageRectRectIA($hGraphics, $hBitmap, 0, 0, $iWidth, $iHeight, 0, 0, @DesktopWidth / 2, @DesktopHeight / 2, $hBrightIA)

	; ���Ƶ���ɫ�����ͼ��
	_GDIPlus_GraphicsDrawImageRectRectIA($hGraphics, $hBitmap, 0, 0, $iWidth, $iHeight, @DesktopWidth / 2, 0, @DesktopWidth / 2, @DesktopHeight / 2, $hHueIA)

	; ����ͨ���ҶȾ��������ͼ��
	_GDIPlus_GraphicsDrawImageRectRectIA($hGraphics, $hBitmap, 0, 0, $iWidth, $iHeight, 0, @DesktopHeight / 2, @DesktopWidth / 2, @DesktopHeight / 2, $hGrayIA)

	; ���Ƶ����ԱȶȺ��ͼ��
	_GDIPlus_GraphicsDrawImageRectRectIA($hGraphics, $hBitmap, 0, 0, $iWidth, $iHeight, @DesktopWidth / 2, @DesktopHeight / 2, @DesktopWidth / 2, @DesktopHeight / 2, $hContIA)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_ImageAttributesDispose($hContIA)
	_GDIPlus_ImageAttributesDispose($hGrayIA)
	_GDIPlus_ImageAttributesDispose($hHueIA)
	_GDIPlus_ImageAttributesDispose($hBrightIA)
	_WinAPI_DeleteObject($hBmp)
	_GDIPlus_ImageDispose($hBitmap)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ͷ�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>

Opt('MustDeclareVars ', 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hPath, $hPathBrush, $hLineBrush, $hBitmap, $hContext
	Local $avColors[2] = [1, 0x00FFFFFF]

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_BitmapCreateFromScan0 Example ", 400 - 200)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; �������д�С��û�����ݵ�λͼ
	$hBitmap = _GDIPlus_BitmapCreateFromScan0(200, 200)

	; ��ȡλͼͼ�γ����Ա�ʹ��˫��������л���
	$hContext = _GDIPlus_ImageGetGraphicsContext($hBitmap)
	; �������������״�������ݶȻ�ˢ
	$hLineBrush = _GDIPlus_LineBrushCreate(1, 1, 200 - 2, 200 - 2, 0x000000FF, 0xA00000FF)

	; ʹ��Ĭ�����ģʽ��������ͼ�ε�ͼ��·��
	$hPath = _GDIPlus_PathCreate()

	; ��ʼ��ͼ
	_GDIPlus_PathStartFigure($hPath)
	; ������Բ
	_GDIPlus_PathAddEllipse($hPath, 2, 2, 200 - 4, 200 - 4)

	; ������ͼ��·����ص�·��ˢ
	$hPathBrush = _GDIPlus_PathBrushCreateFromPath($hPath)

	_GDIPlus_PathBrushSetCenterColor($hPathBrush, 0x8000FFFF)
	_GDIPlus_PathBrushSetCenterPoint($hPathBrush, 200 / 2, 200 / 2)
	_GDIPlus_PathBrushSetFocusScales($hPathBrush, 0.1, 0.1)
	_GDIPlus_PathBrushSetSurroundColorsWithCount($hPathBrush, $avColors)

	; ����ͼ��ƽ��ģʽ��ʹ��·��ˢ���Ƶ�λͼ����
	_GDIPlus_GraphicsSetSmoothingMode($hContext, $SmoothingModeAntiAlias)
	_GDIPlus_GraphicsFillPath($hContext, $hPath, $hLineBrush)
	_GDIPlus_GraphicsFillPath($hContext, $hPath, $hPathBrush)

	; ���, ��ͼ���ϻ���λͼ
	_GDIPlus_GraphicsDrawImage($hGraphics, $hBitmap, 100, 0)

	Do
	Until GUIGetMsg(() = $GUI_EVENT_CLOSE

	; �����Դ
	_GDIPlus_BrushDispose($hPathBrush)
	_GDIPlus_PathDispose($hPath)
	_GDIPlus_BrushDispose($hLineBrush)
	_GDIPlus_GraphicsDispose($hContext)
	_GDIPlus_ImageDispose($hBitmap)
	_GDIPlus_GraphicsDispose($hGraphics)

	; ж��GDI+��
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


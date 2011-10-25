#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hBrush

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_LineBrushSetColors Example ", 420, 200)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; �����Ӻ�ɫ����ɫ�Ľ���ˢ
	$hBrush = _GDIPlus_LineBrushCreate(0, 0, 0, 100, 0xFFFF0000, 0xFF00FF00, 1)

	; ʹ�ý���ˢ������
	_GDIPlus_GraphicsFillRect($hGraphics, 0, 0, 200, 200, $hBrush)

	; ������ˢ��ʼɫ����ֹɫ��Ϊ��ɫ�Ͱ�ɫ
	_GDIPlus_LineBrushSetColors($hBrush, 0xFF000000, 0xFFFFFFFF)
	; ʹ�ôӺ�ɫ����ɫ�Ľ���ˢ������
	_GDIPlus_GraphicsFillRect($hGraphics, 200, 0, 200, 200, $hBrush)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_BrushDispose($hBrush)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


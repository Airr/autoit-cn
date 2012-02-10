#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hBrush

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_LineBrushSetGammaCorrection Example ", 420, 200)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; �����Ӻ�ɫ����ɫ�Ľ���ˢ
	$hBrush = _GDIPlus_LineBrushCreate(0, 0, 0, 200, 0xFFFF0000, 0xFF0000FF, 1)

	; ʹ�ý���ˢ������
	_GDIPlus_GraphicsFillRect($hGraphics, 0, 0, 200, 200, $hBrush)

	; ʹ��٤��У��
	_GDIPlus_LineBrushSetGammaCorrection($hBrush, True)
	; ʹ��٤��У����Ľ���ˢ������
	_GDIPlus_GraphicsFillRect($hGraphics, 220, 0, 200, 200, $hBrush)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_BrushDispose($hBrush)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


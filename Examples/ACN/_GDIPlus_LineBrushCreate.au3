#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hBrush

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_LineBrushCreate Example ", 400, 200)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	;  �����Ӻ�ɫ����ɫ�ݶȸı�Ľ����ݶ�ˢ
	$hBrush = _GDIPlus_LineBrushCreate(0, 0, 50, 100, 0xFFFF0000, 0xFF00FF00, 1)
	;  ʹ�ý����ݶ�ˢ������
	_GDIPlus_GraphicsFillRect($hGraphics, 0, 0, 400, 200, $hBrush)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_BrushDispose($hBrush)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


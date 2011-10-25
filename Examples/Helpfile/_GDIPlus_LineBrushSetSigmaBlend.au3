#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hBrush

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_LineBrushSetSigmaBlend Example ", 400, 320)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; �����Ӻ�ɫ����ɫ�Ľ���ˢ
	$hBrush = _GDIPlus_LineBrushCreate(0, 0, 400, 0, 0xFFFF0000, 0xFF0000FF, 1)

	; ������ˢ��������������50%������60%���(40%��ɫ60%��ɫ)
	_GDIPlus_LineBrushSetSigmaBlend($hBrush, 0.5, 0.6)
	; ʹ�ý���ˢ������
	_GDIPlus_GraphicsFillRect($hGraphics, 0, 0, 400, 100, $hBrush)

	; ������ˢ��������������20%������80%���(20%��ɫ80%��ɫ)
	_GDIPlus_LineBrushSetSigmaBlend($hBrush, 0.2, 0.8)
	_GDIPlus_GraphicsFillRect($hGraphics, 0, 110, 400, 100, $hBrush)

	; ������ˢ��������������80%������100%���(0%��ɫ100%��ɫ)
	_GDIPlus_LineBrushSetSigmaBlend($hBrush, 0.8, 1)
	_GDIPlus_GraphicsFillRect($hGraphics, 0, 220, 400, 100, $hBrush)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_BrushDispose($hBrush)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


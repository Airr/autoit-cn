#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hBrush, $tRectF

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_LineBrushCreateFromRectWithAngle Example ", 420, 200)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; Ϊ����ˢ��������ľ���
	$tRectF = _GDIPlus_RectFCreate(0, 0, 50, 100)
	; ��20�ȽǴ����Ӻ�ɫ����ɫ�ݶȸı�Ľ���ˢ
	$hBrush20 = _GDIPlus_LineBrushCreateFromRectWithAngle($tRectF, 0xFFFF0000, 0xFF00FF00, 20, True, 1)
	; ��120�ȽǴ����Ӻ�ɫ����ɫ�ݶȸı�Ľ���ˢ
	$hBrush120 = _GDIPlus_LineBrushCreateFromRectWithAngle($tRectF, 0xFFFF0000, 0xFF00FF00, 120, True, 1)

	; ʹ��20�Ƚ����ݶ�ˢ������
	_GDIPlus_GraphicsFillRect($hGraphics, 0, 0, 200, 200, $hBrush20)
	; ʹ��120�Ƚ����ݶ�ˢ������
	_GDIPlus_GraphicsFillRect($hGraphics, 0, 0, 200, 200, $hBrush120)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_BrushDispose($hBrush20)
	_GDIPlus_BrushDispose($hBrush120)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


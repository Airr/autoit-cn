#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hBrush, $aInterpolations[5][2]

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_LineBrushSetBlend Example ", 400, 200)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; �����Ӻ�ɫ����ɫ�Ľ���ˢ
	$hBrush = _GDIPlus_LineBrushCreate(0, 0, 400, 200,, 0xFF000000, 0xFFFFFFFF, 1)

	; ���彥��ˢ��ɫ��λ��
	$aInterpolations[0][0] = 4 ; ʹ��4��Ҫ�غ�λ��

	$aInterpolations[1][0] = 0xFFFF0000 ; ��ɫ
	$aInterpolations[1][1] = 0 ; �����0%
	$aInterpolations[2][0] = 0xFF00FF00 ; ��ɫ
	$aInterpolations[2][1] = 0.3 ; �����30%
	$aInterpolations[3][0] = 0xFF0000FF ; ��ɫ
	$aInterpolations[3][1] = 0.7 ; �����70%
	$aInterpolations[4][0] = 0xFFFFFF00 ; ��ɫ
	$aInterpolations[4][1] = 1 ; �����100%

	; ���ý���ˢλ�ú�Ҫ��
	_GDIPlus_LineBrushSetPresetBlend($hBrush, $aInterpolations)

	; ʹ�ý���ˢ������
	_GDIPlus_GraphicsFillRect($hGraphics, 0, 0, 400, 200, $hBrush)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_BrushDispose($hBrush)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


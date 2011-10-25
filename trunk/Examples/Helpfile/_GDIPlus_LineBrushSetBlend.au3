#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hBrush, $tRectF, $aBlends[5][2]

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_LineBrushSetBlend Example ", 400, 200)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; Ϊ�����ݶ�ˢ��������ľ���
	$tRectF = _GDIPlus_RectFCreate(0, 0, 50, 100)
	; �����Ӻ�ɫ����ɫ�ݶȸı�Ľ����ݶ�ˢ
	$hBrush = _GDIPlus_LineBrushCreateFromRect($tRectF, 0xFFFF0000, 0xFF00FF00, 0, 1)

	; ���彥��ˢ��ɫ��λ��
	$aBlends[0][0] = 4 ; ʹ��4��Ҫ�غ�λ��

	$aBlends[1][0] = 0 ; Ҫ��
	$aBlends[1][1] = 0 ; λ��
	$aBlends[2][0] = 1 ; ��ϰٷֱ�Ϊ100% (����࿪ʼ��20%��ɴӺ�ɫ����ɫ����)
	$aBlends[2][1] = 0.2 ; ��ˢ�����󶨵ľ���ٷֱ�Ϊ20%
	$aBlends[3][0] = 0 ; ��ϰٷֱ�Ϊ0% (����࿪ʼ��20%��70%��ɴ���ɫ����ɫ�Ľ���)
	$aBlends[3][1] = 0.7 ; ��ˢ�����󶨵ľ���ٷֱ�Ϊ70%
	$aBlends[4][0] = 1 ; ��ϰٷֱ�Ϊ100% (�����70%��100%��ɴӺ�ɫ����ɫ����)
	$aBlends[4][1] = 1 ; ��ˢ�����󶨵ľ���ٷֱ�Ϊ100%

	; ���ý���ˢλ�ú�Ҫ��
	_GDIPlus_LineBrushSetBlend($hBrush, $aBlends)

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


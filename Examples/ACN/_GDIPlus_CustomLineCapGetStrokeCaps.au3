#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hPath, $hCustomLineCap, $hCustomLineCap2, $hPen, $nBaseInset
	Local $avPoints[4][2] = [[3],[-15, -15],[0, 0],[15, -15]]

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_CustomLineCapStrokeCaps Example ", 400, 200)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; ����GraphicsPath�����������������
	$hPath = _GDIPlus_PathCreate()
	_GDIPlus_PathAddLines($hPath, $avPoints)

	; ����CustomLineCap����
	$hCustomLineCap = _GDIPlus_CustomLineCapCreate(0, $hPath)

	; ���������յ��CustomLineCap����
	_GDIPlus_CustomLineCapSetStrokeCaps($hCustomLineCap, $LineCapTriangle, $LineCapRound)

	; ��ȡ�����յ��CustomLineCap����
	_GDIPlus_CustomLineCapGetStrokeCaps($hCustomLineCap)

	; �������ʶ��� , �����Ƶ���ñ���Զ�����ñ���� , ��һ��ֱ��
	$hPen = _GDIPlus_PenCreate(0xFFFF00CC, 15)
	_GDIPlus_PenSetLineCap($hPen, $avCaps[0], $avCaps[1], $DashCapFlat)

	_GDIPlus_GraphicsDrawLine($hGraphics, 90, 100, 310, 100, $hPen)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_CustomLineCapDispose($hCustomLineCap)
	_GDIPlus_PathDispose($hPath)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


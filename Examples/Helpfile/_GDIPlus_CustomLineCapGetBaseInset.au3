#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hPath, $hCustomLineCap, $hCustomLineCap2, $hPen, $nBaseInset
	Local $avPoints[4][2] = [[3],[-15, -15],[0, 0],[15, -15]]

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_CustomLineCap* Example ", 400, 200)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; ����GraphicsPath�����������������
	$hPath = _GDIPlus_PathCreate()
	_GDIPlus_PathAddLines($hPath, $avPoints)

	; ����CustomLineCap����
	$hCustomLineCap = _GDIPlus_CustomLineCapCreate(0, $hPath, $LineCapRound, 5)

	; ����CustomLineCap����$hCustomLineCap2����������������Ϊ$hCustomLineCap��5
	$nBaseInset = _GDIPlus_CustomLineCapGetBaseInset($hCustomLineCap) + 5
	$hCustomLineCap2 = _GDIPlus_CustomLineCapCreate(0, $hPath, $LineCapRound)
	_GDIPlus_CustomLineCapSetBaseInset($hCustomLineCap2, $nBaseInset)

	; �������ʶ��� , �����Ƶ���ñ���Զ�����ñ���� , ��һ��ֱ��
	$hPen = _GDIPlus_PenCreate(0xFF000000, 2)
	_GDIPlus_PenSetCustomStartCap($hPen, $hCustomLineCap)
	_GDIPlus_PenSetCustomEndCap($hPen, $hCustomLineCap2)

	_GDIPlus_GraphicsDrawLine($hGraphics, 10, 10, 100, 100, $hPen)
	_GDIPlus_GraphicsDrawLine($hGraphics, 100, 100, 110, 110, $hPen)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_CustomLineCapDispose($hClonedLineCap2)
	_GDIPlus_CustomLineCapDispose($hCustomLineCap)
	_GDIPlus_PathDispose($hPath)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


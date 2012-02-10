#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hPath, $hJoinPath, $hCustomLineCap, $hPen, $iStrokeJoin
	Local $avPoints[4][2] = [[3],[-15, -15],[0, 0],[15, -15]]

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_CustomLineCapStrokeJoin Example ", 400, 200)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; ����GraphicsPath�����������������
	$hPath = _GDIPlus_PathCreate()
	_GDIPlus_PathAddLines($hPath, $avPoints)

	; ����CustomLineCap����
	$hCustomLineCap = _GDIPlus_CustomLineCapCreate(0, $hPath)

	; ����CustomLineCap����Ŀ��
	_GDIPlus_CustomLineCapSetWidthScale($hCustomLineCap, 0.5)

	; ��ȡCustomLineCap����Ŀ��
	$nWidthScale = _GDIPlus_CustomLineCapGetWidthScale($hCustomLineCap)

	; �������ʶ��� , ���������ø�CustomLineCap����
	$hPen = _GDIPlus_PenCreate($GDIP_CORAL, 5, $UnitWorld)
	_GDIPlus_PenSetCustomEndCap($hPen, $hCustomLineCap)

	_GDIPlus_GraphicsDrawLine($hGraphics, 90, 100, 310, 310, $hPen)

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


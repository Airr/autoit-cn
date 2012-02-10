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

	; �����������ӵ�CustomLineCap����
	_GDIPlus_CustomLineCapSetStrokeJoin($hCustomLineCap, $LineJoinBevel)

	; ��ȡ�������ӵ�CustomLineCap����
	$iStrokeJoin = _GDIPlus_CustomLineCapGetStrokeJoin($hCustomLineCap)

	; �������ʶ��� , �����Ƶ���ñ���Զ�����ñ���� , ��һ��ֱ��
	$hPen = _GDIPlus_PenCreate($GDIP_DODGERBLUE, 15)
	_GDIPlus_PenSetLineJoin($hPen, $iStrokeJoin)

	$hJoinPath = _GDIPlus_PathCreate()
	_GDIPlus_PathAddRectangle($hJoinPath, 20, 20, 360, 160)

	_GDIPlus_GraphicsDrawPath($hGraphics, $hJoinPath, $hPen)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_PathDispose($hJoinPath)
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_CustomLineCapDispose($hCustomLineCap)
	_GDIPlus_PathDispose($hPath)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


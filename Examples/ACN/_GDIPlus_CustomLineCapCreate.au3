#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hPath, $hCustomLineCap, $hClonedLineCap, $hPen
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
	$hCustomLineCap = _GDIPlus_CustomLineCapCreate(0, $hPath)

	; �������Ƶ�CustomLineCap����
	$hClonedLineCap = _GDIPlus_CustomLineCapClone($hCustomLineCap)

	; �������ʶ��� , �����Ƶ���ñ���Զ�����ñ���� , ��һ��ֱ��
	$hPen = _GDIPlus_PenCreate()
	_GDIPlus_PenSetCustomEndCap($hPen, $hClonedLineCap)

	_GDIPlus_GraphicsDrawLine($hGraphics, 0, 0, 100, 100, $hPen)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_CustomLineCapDispose($hClonedLineCap)
	_GDIPlus_CustomLineCapDispose($hCustomLineCap)
	_GDIPlus_PathDispose($hPath)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


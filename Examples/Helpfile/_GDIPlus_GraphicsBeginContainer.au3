#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hBrush, $iGraphicsCont, $tDstRect, $tSrcRect

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_GraphicsBeginContainer Example ", 400, 350)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; ����ͼ������ʹ�õľ���
	$tSrcRect = _GDIPlus_RectFCreate(0, 0, 200, 100)
	$tDstRect = _GDIPlus_RectFCreate(100, 100, 200, 200)

	; Create a Graphics container with a (100, 100) translation and (1, 2) scale
	$iGraphicsCont = _GDIPlus_GraphicsBeginContainer($hGraphics, $tDstRect, $tSrcRect)

	; ��������ڵ���Բ
	$hBrush = _GDIPlus_BrushCreateSolid(0xFFFF0000) ; Red
	_GDIPlus_GraphicsFillEllipse($hGraphics, 0, 0, 100, 60, $hBrush)

	; ������������������ͼ��״̬Ϊ������ʼǰ��ͼ��״̬
	_GDIPlus_GraphicsEndContainer($hGraphics, $iGraphicsCont)

	; ������������Բ
	_GDIPlus_BrushSetSolidColor($hBrush, 0xFF0000FF) ; Blue
	_GDIPlus_GraphicsFillEllipse($hGraphics, 0, 0, 100, 60, $hBrush)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_BrushDispose($hBrush)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


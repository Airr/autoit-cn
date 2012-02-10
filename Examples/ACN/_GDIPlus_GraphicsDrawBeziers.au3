#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hPen, $aPoints[11][2], $iI

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_GraphicsDrawBeziers Example ", 400, 350)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; ʹ�÷����
	_GDIPlus_GraphicsSetSmoothingMode($hGraphics, $SmoothingModeAntiAlias)
	; ����һЩ�����
	$aPoints[0][0] = 10

	For $iI = 0 To 10
		$aPoints[$iI][0] = Random(0, 350, 1)
		$aPoints[$iI][1] = Random(0, 300, 1)
	Next

	; �������ʶ���
	$hPen = _GDIPlus_PenCreate($GDIP_MAROON, 8)

	; ���Ʊ���������
	_GDIPlus_GraphicsDrawBeziers($hGraphics, $aPoints, $hPen)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


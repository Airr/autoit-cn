#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hPen, $hBitmap, $aPoints[11][2], $iI, $iJ

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_GraphicsDrawCurve2 Example ", 400, 350)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; ʹ�÷����
	_GDIPlus_GraphicsSetSmoothingMode($hGraphics, $SmoothingModeAntiAlias)
	; ����һЩ��
	$aPoints[0][0] = 10

	For $iI = 0 To 1
		For $iJ = 1 To 5
			$aPoints[$iI * 5 + $iJ][0] = 300 * $iI + 50
			$aPoints[$iI * 5 + $iJ][1] = $iJ * 50
		Next
	Next

	; �������ʶ���
	$hPen = _GDIPlus_PenCreate($GDIP_ORCHID, 8)

	; ����ָ��ʹ�õĵ������, �׸����ƫ�Ƽ�����ֵ������
	; �ӵ�2�㿪ʼ����ʹ�õ�3�����������
	_GDIPlus_GraphicsDrawCurve3($hGraphics, $aPoints, 1, 3, 0.8, $hPen)
	; �ӵ�6�㿪ʼ����ʹ�õ�3�����������
	_GDIPlus_GraphicsDrawCurve3($hGraphics, $aPoints, 5, 3, 0.8, $hPen)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


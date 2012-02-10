#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hBrush
	Local $aColors[11] = [10, 0xFFFF0000, 0xFFFF0000, 0xFF0000FF, 0xFFFF0000, 0xFFFF0000, 0xFF0000FF, 0xFFFF0000, 0xFFFFFFFF, 0xFFFF0000, 0xFF0000FF]
	Local $aPoints[11][2] = [[10],[0, 100],[130, 100],[200, 0],[270, 100],[400, 100],[300, 150],[400, 300],[200, 200],[0, 300],[100, 150]]

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_PathBrushCreate Example ", 400, 300)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	;  �ӵ㴴��·���ݶ�ˢ
	$hBrush = _GDIPlus_PathBrushCreate($aPoints)
	;  ����·���ݶ�ˢ����ɫ
	_GDIPlus_PathBrushSetCenterColor($hBrush, 0xFF00FF00)
	;  ����·���ݶ�ˢ����ɫ
	_GDIPlus_PathBrushSetSurroundColorsWithCount($hBrush, $aColors)

	;  ��·���ݶ�ˢ�������
	_GDIPlus_GraphicsFillPolygon($hGraphics, $aPoints, $hBrush)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_BrushDispose($hBrush)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


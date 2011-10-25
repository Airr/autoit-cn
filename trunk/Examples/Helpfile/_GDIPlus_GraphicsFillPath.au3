#include <GuiConstantsEx.au3>
#include <GDIPlusEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hBrush, $hPath, $aPoints[5][2]

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_GraphicsFillPath Example ", 400, 200)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	_GDIPlus_GraphicsSetSmoothingMode($hGraphics, $SmoothingModeAntiAlias)

	; ����GraphicsPath
	$hPath = _GDIPlus_PathCreate()

	; �������ߵ�
	$aPoints[0][0] = 4
	$aPoints[1][0] = 10
	$aPoints[1][1] = 100
	$aPoints[2][0] = 100
	$aPoints[1][1] = 190
	$aPoints[3][0] = 300
	$aPoints[3][1] = 10
	$aPoints[4][2] = 390
	$aPoints[4][3] = 100

	; ��������ӵ�·��
	_GDIPlus_PathAddCurve($hPath, $aPoints)

	; ������������ڲ��Ļ�ˢ
	$hBrush = _GDIPlus_BrushCreateSolid(0xFF0000FF)

	; ���·��
	_GDIPlus_GraphicsFillPath($hGraphics, $hPath, $hBrush)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


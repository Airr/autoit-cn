#include <GuiConstantsEx.au3>
#include <GDIPlusEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hBrush, $aRects[4][4]

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_GraphicsFillRectangles Example ", 400, 350)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; ������ˢ����
	$hBrush = _GDIPlus_BrushCreateSolid($GDIP_CADETBLUE)

	; �������
	$aRects[0][0] = 3

	$aRects[1][0] = 0
	$aRects[1][1] = 0
	$aRects[1][2] = 100
	$aRects[1][3] = 200

	$aRects[2][0] = 100
	$aRects[2][1] = 200
	$aRects[2][2] = 150
	$aRects[2][3] = 50

	$aRects[3][0] = 300
	$aRects[3][1] = 0
	$aRects[3][2] = 50
	$aRects[3][3] = 100

	; ���ƾ���
	_GDIPlus_GraphicsFillRectangles($hGraphics, $aRects, $hBrush)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_BrushDispose($hBrush)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


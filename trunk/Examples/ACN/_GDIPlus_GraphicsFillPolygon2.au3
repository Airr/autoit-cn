#include <GuiConstantsEx.au3>
#include <GDIPlusEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hBrush, $aPoints[21][2], $iI

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_GraphicsFillPolygon2 Example ", 400, 400)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	_GDIPlus_GraphicsSetSmoothingMode($hGraphics, $SmoothingModeAntiAlias)

	; ������ˢ����
	$hBrush = _GDIPlus_BrushCreateSolid($GDIP_BROWN)

	; ���������
	$aRects[0][0] = 20

	For $iI = 1 To 20
		$aPoints[$iI][0] = Random(1, 399, 1)
		$aPoints[$iI][1] = Random(1, 399, 1)
	Next
	; �������Ķ����
	_GDIPlus_GraphicsFillPolygon2($hGraphics, $aPoints, $hBrush)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_BrushDispose($hBrush)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


#include <GuiConstantsEx.au3>
#include <GDIPlusEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hBrush, $hRegion1, $hRegion2

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_GraphicsFillRegion Example ", 400, 300)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; �������򲢺ϲ�
	$hRegion1 = _GDIPlus_RegionCreateFromRect( _GDIPlus_RectFCreate(50, 50, 200, 200))
	$hRegion2 = _GDIPlus_RegionCreateFromRect( _GDIPlus_RectFCreate(100, 100, 50, 50))

	_GDIPlus_GraphicsFillRegion($hRegion1, $hRegion2, 3)

	; ���������������Ļ�ˢ
	$hBrush = _GDIPlus_BrushCreateSolid(0xFF208080)
	_GDIPlus_GraphicsFillRegion($hGraphics, $hRegion1, $hBrush)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_BrushDispose($hBrush)
	_GDIPlus_RegionDispose($hRegion2)
	_GDIPlus_RegionDispose($hRegion1)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


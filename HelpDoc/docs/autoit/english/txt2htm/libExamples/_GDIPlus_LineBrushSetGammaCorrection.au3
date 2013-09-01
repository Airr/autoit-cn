#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	_GDIPlus_Startup() ;initialize GDI+
	Local Const $iWidth = 600, $iHeight = 300, $iBgColor = 0x303030 ;$iBGColor format RRGGBB

	Local $hGUI = GUICreate("GDI+ example", $iWidth, $iHeight) ;create a test GUI
	GUISetBkColor($iBgColor, $hGUI) ;set GUI background color
	GUISetState()

	Local $hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI) ;create a graphics object from a window handle
	_GDIPlus_GraphicsSetSmoothingMode($hGraphics, $GDIP_SMOOTHINGMODE_HIGHQUALITY) ;sets the graphics object rendering quality (antialiasing)
	Local $hBrush = _GDIPlus_LineBrushCreate(0, 0, 0, 280, 0xFFFFFF00, 0xFF4020FF, 1) ;create linear gradient flipped brush

	_GDIPlus_GraphicsFillRect($hGraphics, 10, 10, 280, 280, $hBrush) ;draw the filled rectangle

	_GDIPlus_LineBrushSetGammaCorrection($hBrush)

	_GDIPlus_GraphicsFillRect($hGraphics, 310, 10, 280, 280, $hBrush) ;draw the filled rectangle

	_GDIPlus_GraphicsDrawString($hGraphics, "w/o gamma correction", 14, 14)
	_GDIPlus_GraphicsDrawString($hGraphics, "w/ gamma correction", 314, 14)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	;cleanup GDI+ resources
	_GDIPlus_BrushDispose($hBrush)
	_GDIPlus_GraphicsDispose($hGraphics)
	_GDIPlus_Shutdown()
	GUIDelete($hGUI)
EndFunc   ;==>Example

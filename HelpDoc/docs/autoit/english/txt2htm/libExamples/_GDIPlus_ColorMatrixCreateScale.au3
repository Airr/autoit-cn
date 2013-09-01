#include <GUIConstantsEx.au3>
#include <ScreenCapture.au3>

Example()

Func Example()
	_GDIPlus_Startup() ;initialize GDI+
	Local Const $iWidth = 600, $iHeight = 600

	Local $hGUI = GUICreate("GDI+ example", $iWidth, $iHeight) ;create a test GUI
	GUISetState()

	Local $hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI) ;create a graphics object from a window handle
	Local $hIA = _GDIPlus_ImageAttributesCreate() ;create an ImageAttribute object

	Local $tColorMatrix = _GDIPlus_ColorMatrixCreateScale(0.5, 0.5, 0.5) ;create the scale factor color matrix for RGB color channel
	Local $pColorMatrix = DllStructGetPtr($tColorMatrix)

	_GDIPlus_ImageAttributesSetColorMatrix($hIA, 0, True, $pColorMatrix) ;decrease each color (RGB) level by 50%

	Local $hHBmp = _ScreenCapture_Capture("", 0, 0, $iWidth, $iHeight) ;create a GDI bitmap by capturing an area on desktop
	Local $hBitmap = _GDIPlus_BitmapCreateFromHBITMAP($hHBmp) ;convert GDI to GDI+ bitmap
	_WinAPI_DeleteObject($hHBmp) ;release GDI bitmap resource because not needed anymore

	_GDIPlus_GraphicsDrawImageRectRect($hGraphics, $hBitmap, 0, 0, $iWidth, $iHeight, 0, 0, $iWidth, $iHeight, $hIA) ;draw the bitmap while applying the color adjustment

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	;cleanup GDI+ resources
	_GDIPlus_ImageAttributesDispose($hIA)
	_GDIPlus_GraphicsDispose($hGraphics)
	_GDIPlus_BitmapDispose($hBitmap)
	_GDIPlus_Shutdown()
	GUIDelete($hGUI)
EndFunc   ;==>Example

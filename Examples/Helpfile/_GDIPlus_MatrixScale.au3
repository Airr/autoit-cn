#include <GUIConstants.au3>
#include <ScreenCapture.au3>
#include <WinAPI.au3>

; ���� GUI
Local $hWnd = GUICreate("GDI+ Example", 500, 500)
GUISetState()

; ��ʼ�� GDI+
_GDIPlus_Startup()
Local $hGraphics = _GDIPlus_GraphicsCreateFromHWND($hWnd)
_GDIPlus_GraphicsClear($hGraphics)

; ץȡ��Ļ���½ǽ�ͼ
Local $hScreenCap_hBitmap = _ScreenCapture_Capture("", 0, @DesktopHeight - 500, 500, @DesktopHeight)
Local $hScreenCap_Bitmap = _GDIPlus_BitmapCreateFromHBITMAP($hScreenCap_hBitmap)

Local $hMatrix = _GDIPlus_MatrixCreate()
; �Ŵ���� 2 �� (���ж������ 2 ����С)
_GDIPlus_MatrixScale($hMatrix, 2.0, 2.0)


_GDIPlus_GraphicsSetTransform($hGraphics, $hMatrix)
_GDIPlus_GraphicsDrawImageRect($hGraphics, $hScreenCap_Bitmap, 0, 0, 500, 500)

Do
Until GUIGetMsg() = $GUI_EVENT_CLOSE

; ������Դ
_WinAPI_DeleteObject($hScreenCap_hBitmap)
_GDIPlus_BitmapDispose($hScreenCap_Bitmap)
_GDIPlus_MatrixDispose($hMatrix)
_GDIPlus_GraphicsDispose($hGraphics)
_GDIPlus_Shutdown()

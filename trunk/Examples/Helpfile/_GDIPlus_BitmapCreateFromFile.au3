#include <GUIConstantsEx.au3>
#include <GDIPlus.au3>
#include <ScreenCapture.au3>

_Main()

Func _Main()
	Local $hGUI, $hBMP, $hBitmap, $hGraphic, $hImage, $iX, $iY, $hClone

	; ���� GUI
	$hGUI = GUICreate("GDI+", 400, 300)
	GUISetState()

	; ��ʼ�� GDI+ ��
	_GDIPlus_Startup()

	; ���� 32 λλͼ
	$hBMP = _ScreenCapture_Capture("")
	$hImage = _GDIPlus_BitmapCreateFromHBITMAP($hBMP)

	; ���� 24 λλͼ����
	$iX = _GDIPlus_ImageGetWidth($hImage)
	$iY = _GDIPlus_ImageGetHeight($hImage)
	$hClone = _GDIPlus_BitmapCloneArea($hImage, 0, 0, $iX, $iY, $GDIP_PXF24RGB)

	; ����λͼ���ļ�
	_GDIPlus_ImageSaveToFile($hClone, @MyDocumentsDir & "\GDIPlus_Image.bmp")

	; ������Դ
	_GDIPlus_BitmapDispose($hClone)
	_GDIPlus_BitmapDispose($hImage)
	_WinAPI_DeleteObject($hBMP)

	; �� GUI �����λͼ
	$hBitmap = _GDIPlus_BitmapCreateFromFile(@MyDocumentsDir & "\GDIPlus_Image.bmp")
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	_GDIPlus_GraphicsDrawImage($hGraphic, $hBitmap, 0, 0)

	; ������Դ
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_BitmapDispose($hBitmap)

	; �ر� GDI+ ��
	_GDIPlus_Shutdown()

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE


EndFunc   ;==>_Main

#include <GUIConstantsEx.au3>
#include <GDIPlus.au3>
#include <ScreenCapture.au3>

_Main()

Func _Main()
	Local $hBMP, $hImage, $iX, $iY, $hClone

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
	_GDIPlus_ImageSaveToFile($hClone, @TempDir & "\GDIPlus_Image.bmp")

	; ������Դ
	_GDIPlus_BitmapDispose($hClone)
	_GDIPlus_BitmapDispose($hImage)
	_WinAPI_DeleteObject($hBMP)

	; ����ͼ��
	$hImage = _GDIPlus_ImageLoadFromFile(@TempDir & "\GDIPlus_Image.bmp")
	$hBMP = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hImage)

	; ����λͼ���ļ�
	_ScreenCapture_SaveImage(@TempDir & "\Image.bmp", $hBMP, True) ; True -> �ͷ� $hBMP

	; ������Դ
	_GDIPlus_ImageDispose($hImage)

	; �ر� GDI+ ��
	_GDIPlus_Shutdown()

EndFunc   ;==>_Main

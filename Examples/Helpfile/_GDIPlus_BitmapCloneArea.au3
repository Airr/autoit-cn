#include <GDIPlus.au3>
#include <ScreenCapture.au3>

_Main()

Func _Main()
	Local $hBitmap, $hClone, $hImage, $iX, $iY

	; ��ʼ�� GDI+ ��
	_GDIPlus_Startup()

	; ���� 32 λλͼ
	$hBitmap = _ScreenCapture_Capture("")
	$hImage = _GDIPlus_BitmapCreateFromHBITMAP($hBitmap)

	; ���� 24 λλͼ����
	$iX = _GDIPlus_ImageGetWidth($hImage)
	$iY = _GDIPlus_ImageGetHeight($hImage)
	$hClone = _GDIPlus_BitmapCloneArea($hImage, 0, 0, $iX, $iY, $GDIP_PXF24RGB)

	; ����λͼ���ļ�
	_GDIPlus_ImageSaveToFile($hClone, @MyDocumentsDir & "\GDIPlus_Image.bmp")

	; ������Դ
	_GDIPlus_ImageDispose($hClone)
	_GDIPlus_ImageDispose($hImage)
	_WinAPI_DeleteObject($hBitmap)

	; �ر� GDI+ ��
	_GDIPlus_Shutdown()

EndFunc   ;==>_Main

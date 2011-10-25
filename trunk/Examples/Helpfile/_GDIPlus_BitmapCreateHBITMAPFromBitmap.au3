
#include  <GuiConstantsEx.au3>
#include  <GDIPlus.au3>
#include  <ScreenCapture.au3>

Opt('MustDeclareVars', 1)

_Main()

Func _Main()
	Local $hBitmap, $hImage, $iX, $iY, $hClone

	; ��ʼ��GDI+��
	_GDIPlus_Startup()

	; ��׽32λλͼ
	$hBitmap = _ScreenCapture_Capture("")
	$hImage = _GDIPlus_BitmapCreateFromHBITMAP($hBitmap)

	; ����24λλͼ����
	$iX = _GDIPlus_ImageGetWidth($hImage)
	$iY = _GDIPlus_ImageGetHeight($hImage)
	$hClone = _GDIPlus_BitmapCloneArea($hImage, 0, 0, $iX, $iY, $GDIP_PXF24RGB)

	; ��λͼ���浽�ļ�
	_GDIPlus_ImageSaveToFile($hClone, @MyDocumentsDir & "\GDIPlus_Image.bmp")

	; �����Դ
	_GDIPlus_ImageDispose($hClone)
	_GDIPlus_ImageDispose($hImage)
	_WinAPI_DeleteObject($hBitmap)

	; ����ͼ��
	$hImage = _GDIPlus_ImageLoadFromFile(@MyDocumentsDir & "\GDIPlus_Image.bmp")
	$hBitmap = _GDIPlus_BitmapCreateHBITMAPFromBitmap($hImage)

	; ��λͼ���浽�ļ�
	_ScreenCapture_SaveImage(@MyDocumentsDir & "\Image.bmp", $hBitmap)

	; �����Դ
	_GDIPlus_ImageDispose($hImage)
	_WinAPI_DeleteObject($hBitmap)

	; �ر�GDI+��
	_GDIPlus_ShutDown()

endfunc   ;==>_Main


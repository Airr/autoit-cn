#include  <GuiConstantsEx.au3>
#include  <GDIPlus.au3>
#include  <ScreenCapture.au3>

Opt('MustDeclareVars', 1)

_Main()

Func _Main()
	Local $hGUI, $hBitmap, $hGraphic, $hImage, $iX, $iY, $hClone

	; ��������
	$hGUI = GUICreate("GDI+", 400, 300)
	GUISetState()

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

	; ��λͼ���Ƶ�GUI
	$hBitmap = _GDIPlus_BitmapCreateFromFile(@MyDocumentsDir & "\GDIPlus_Image.bmp")
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	_GDIPlus_GraphicsDrawImage($hGraphic, $hBitmap, 0, 0)

	; �����Դ
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_ImageDispose($hBitmap)
	_WinAPI_DeleteObject($hBitmap)

	; �ر�GDI+��
	_GDIPlus_ShutDown()

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

endfunc   ;==>_Main


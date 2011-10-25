#include  <GuiConstantsEx.au3>
#include  <GDIPlus.au3>
#include  <ScreenCapture.au3>

Opt('MustDeclareVars', 1)

_Main()

Func _Main()
	Local $hGUI1, $hGUI2, $hImage, $hGraphic1, $hGraphic2

	; ��׽��Ļ���Ͻ�
	_ScreenCapture_Capture(@MyDocumentsDir & "\GDIPlus_Image.jpg", 0, 0, 400, 300)

	; ΪԴͼ�񴴽�����
	$hGUI1 = GUICreate("Original", 400, 300, 0, 0)
	GUISetState()

	; Ϊ�Ŵ��ͼ�񴴽�����
	$hGUI2 = GUICreate("Zoomed", 400, 300, 0, 400)
	GUISetState()

	; ��ʼ��GDI+�Ⲣ����ͼ��
	_GDIPlus_Startup()
	$hImage = _GDIPlus_ImageLoadFromFile(@MyDocumentsDir & "\GDIPlus_Image.jpg")

	; ����Դͼ��
	$hGraphic1 = _GDIPlus_GraphicsCreateFromHWND($hGUI1)
	_GDIPlus_GraphicsDrawImage($hGraphic1, $hImage, 0, 0)

	; ����2x�Ŵ��ͼ��
	$hGraphic2 = _GDIPlus_GraphicsCreateFromHWND($hGUI2)
	_GDIPlus_GraphicsDrawImageRectRect($hGraphic2, $hImage, 0, 0, 200, 200, 0, 0, 400, 300)

	; �ͷ���Դ
	_GDIPlus_GraphicsDispose($hGraphic1)
	_GDIPlus_GraphicsDispose($hGraphic2)
	_GDIPlus_ImageDispose($hImage)
	_GDIPlus_Shutdown()

	; �����Ļ�����ļ�
	FileDelete(@MyDocumentsDir & "\GDIPlus_Image.jpg")

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

endfunc   ;==>_Main


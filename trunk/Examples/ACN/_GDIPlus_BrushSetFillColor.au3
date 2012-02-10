#include <GuiConstantsEx.au3>
#include <GDIPlusEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hBrush, $iGraphicsCont

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_GraphicsContainer Example ", 400, 350)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; ����ͼ�ζ���ļ�������
	_GDIPlus_GraphicsSetClipRect($hGraphics, 10, 10, 150, 150)

	; ����ͼ������
	$iGraphicsCont = _GDIPlus_GraphicsBeginContainer2($hGraphics)

	; ���������Ķ����������
	_GDIPlus_GraphicsSetClipRect($hGraphics, 100, 50, 100, 75)

	; ������������ɫ����
	$hBrush = _GDIPlus_BrushCreateSolid(0xFFFF0000) ; ��ɫ
	_GDIPlus_GraphicsFillRect($hGraphics, 0, 0, 400, 400, $hBrush)

	; ������������ͼ��״̬��������Ϊ��������ǰ��ͼ��
	_GDIPlus_GraphicsEndContainer($hGraphics, $iGraphicsCont)

	; �������������ɫ����
	_GDIPlus_BrushSetFillColor($hBrush, 0x800000FF) ; ��͸����ɫ
	_GDIPlus_GraphicsFillRect($hGraphics, 0, 0, 400, 400, $hBrush)

	; ����ǰ����������������
	_GDIPlus_GraphicsResetClip($hGraphics)
	_GDIPlus_GraphicsDrawRect($hGraphics, 10, 10, 150, 150)
	_GDIPlus_GraphicsDrawRect($hGraphics, 100, 50, 100, 75)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_BrushDispose($hHatchBrush)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


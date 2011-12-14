#include <GUIConstantsEx.au3>
#include <GDIPlus.au3>
#include <WindowsConstants.au3>

_Main()

Func _Main()
	Local $hGUI, $Label1, $label2, $hGraphic, $hBrush1, $iClr1, $iClr2

	; ���� GUI
	$hGUI = GUICreate("GDI+", 345, 150)
	$Label1 = GUICtrlCreateLabel("", 2, 2, 150, 20)
	$label2 = GUICtrlCreateLabel("", 202, 2, 150, 20)
	GUISetState()
	Sleep(100)

	; ��ʼ�� GDIPlus
	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; ����ʵ�Ļ�ˢ
	$hBrush1 = _GDIPlus_BrushCreateSolid()

	; ��ȡʵ�Ļ�ˢ��ɫ
	$iClr1 = _GDIPlus_BrushGetSolidColor($hBrush1)

	; ʹ��ԭ���Ļ�ˢ��ɫ���ͼ��
	_GDIPlus_GraphicsFillEllipse($hGraphic, 25, 25, 100, 100, $hBrush1)

	; �����µĻ�ˢ��ɫ (0xFFFF0000 = ��ɫ)
	_GDIPlus_BrushSetSolidColor($hBrush1, 0xFFFF0000)

	; ��ȡ�µ�ʵ�»�ˢ��ɫ
	$iClr2 = _GDIPlus_BrushGetSolidColor($hBrush1)

	; ʹ���µĻ�ˢ��ɫ���ͼ��
	_GDIPlus_GraphicsFillRect($hGraphic, 220, 25, 100, 100, $hBrush1)

	; ��ԭ���Ļ�ˢ��ɫд�� Label1
	GUICtrlSetData($Label1, "Brush orignal color: " & Hex($iClr1))

	; ���µĻ�ˢ��ɫд�� Label2
	GUICtrlSetData($label2, "Brush new color: " & Hex($iClr2))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ������Դ
	_GDIPlus_BrushDispose($hBrush1)
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()

EndFunc   ;==>_Main

#include <GUIConstantsEx.au3>
#include <GDIPlus.au3>

_Main()

Func _Main()
	Local $hGUI, $hGraphic, $hPen

	; ���� GUI
	$hGUI = GUICreate("GDI+", 400, 300)
	GUISetState()

	; �������
	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	$hPen = _GDIPlus_PenCreate(0xFF000000, 8)
	_GDIPlus_PenSetWidth($hPen, 4)
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 10, 390, 10, $hPen)

	; ��ʾ���ʿ��
	MsgBox(4096, "��Ϣ", "Pen Width: " & _GDIPlus_PenGetWidth($hPen))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ������Դ
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()

EndFunc   ;==>_Main

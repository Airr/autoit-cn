#include <GUIConstantsEx.au3>
#include <GDIPlus.au3>

_Main()

Func _Main()
	Local $hGUI, $hGraphic, $hPen, $hEndCap

	; ���� GUI
	$hGUI = GUICreate("GDI+", 400, 300)
	GUISetState()

	; ������Դ
	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	$hPen = _GDIPlus_PenCreate(0xFF000000, 4)
	$hEndCap = _GDIPlus_ArrowCapCreate(3, 6)
	_GDIPlus_PenSetCustomEndCap($hPen, $hEndCap)

	; ��ʾ�ʶ˸�
	MsgBox(4096, "��Ϣ", "Pen end cap: " & _GDIPlus_PenGetCustomEndCap($hPen))

	; ����ͷ
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 120, 390, 120, $hPen)
	_GDIPlus_PenSetWidth($hPen, 6)
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 150, 390, 150, $hPen)
	_GDIPlus_PenSetWidth($hPen, 8)
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 200, 390, 200, $hPen)

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ������Դ
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()

EndFunc   ;==>_Main

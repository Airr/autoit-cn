#include <GUIConstantsEx.au3>
#include <GDIPlus.au3>

_Main()

Func _Main()
	Local $hGUI, $hGraphic, $hPen

	; ���� GUI
	$hGUI = GUICreate("GDI+", 400, 300)
	GUISetState()

	; ������Դ
	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	$hPen = _GDIPlus_PenCreate(0xFF000000, 8)
	_GDIPlus_PenSetDashStyle($hPen, $GDIP_DASHSTYLEDASHDOT)
	_GDIPlus_PenSetDashCap($hPen, $GDIP_DASHCAPTRIANGLE)

	; ��ʾ�ʶ̻���ñ
	MsgBox(4096, "��Ϣ", "Pen dash cap: " & _GDIPlus_PenGetDashCap($hPen))

	; �������
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 150, 390, 150, $hPen)

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ������Դ
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()

EndFunc   ;==>_Main

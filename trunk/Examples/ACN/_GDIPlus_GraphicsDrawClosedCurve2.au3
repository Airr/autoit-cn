#include <GuiConstantsEx.au3>
#include <GDIPlusEx.au3>

Opt('MustDeclareVars ', 1)

_Main()

Func _Main()
	Local $hGUI, $hGraphics, $hPen, $aPoints[11][2], $iI, $iJ

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	; ��������
	$hGUI = GUICreate(" _GDIPlus_GraphicsDrawClosedCurve2 Example ", 400, 350)
	GUISetState()

	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; ʹ�÷����
	_GDIPlus_GraphicsSetSmoothingMode($hGraphics, $SmoothingModeAntiAlias)

	; ����һЩ��
	For $iI = 0 To 1
		For $iJ = 0 To 5
			$aPoints[$iI * 5 + $iJ][0] = 300 * $iI + 50
			$aPoints[$iI * 5 + $iJ][1] = $iJ * 50
		Next
	Next

	; �������ʶ���
	$hPen = _GDIPlus_PenCreate($GDIP_ORCHID, 0)

	; ����ָ������ֵ������
	_GDIPlus_GraphicsDrawClosedCurve2($hGraphic, $aPoints, 1.2, $hPen)

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; �����Դ
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_GraphicsDispose($hGraphic)

	; �ͷ�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Main


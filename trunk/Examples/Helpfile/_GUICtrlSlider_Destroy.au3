
#include  <GuiConstantsEx.au3>
#include  <GuiSlider.au3>

Opt('MustDeclareVars', 1)

$Debug_S = False ; ��鴫�ݸ�����������,
����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

_Main()

Func _Main()
	Local $hGUI, $hSlider

	; ��������
	$hGUI = GUICreate("(UDF Created) Slider Destroy", 400, 296)

	$hSlider = _GUICtrlSlider_Create($hGUI, 2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS))

	GUISetState()

	MsgBox(4160, "Information", "Destroy
	Slider" )
	_GUICtrlSlider_Destroy($hSlider)

	;
	ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main



#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w
6
#include  <GuiConstantsEx.au3>
#include  <GuiSlider.au3>

Opt('MustDeclareVars', 1)

$Debug_S = False ; ��鴫�ݸ�����������,
����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

_Main()

Func _Main()
	Local $hInput, $hInput2, $hSlider

	; ��������
	GUICreate( "Slider Get
	Buddy" ,  400 ,  296 )
	$hSlider = GUICtrlCreateSlider(95, 2, 205, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	$hInput = GUICtrlCreateInput("0", 2, 25, 90, 20)

	$hInput2 = GUICtrlCreateInput("0", 2, 25, 90, 20)
	GUISetState()

	; ���������õ����
	_GUICtrlSlider_SetBuddy($hSlider, True, $hInput)
	; ���������õ��Ҳ�

	_GUICtrlSlider_SetBuddy($hSlider, False, $hInput2)

	;
	������ȡ����
	MsgBox(4160, "Information", "Buddy Handle:
	"  &  _GUICtrlSlider_GetBuddy ( $hSlider ,  True ))

	; ѭ�����û��˳�
	Do

	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main


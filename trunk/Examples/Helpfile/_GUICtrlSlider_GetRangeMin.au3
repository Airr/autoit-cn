
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w
6
#include  <GuiConstantsEx.au3>
#include  <GuiSlider.au3>

Opt('MustDeclareVars', 1)

$Debug_S = False ; ��鴫�ݸ�����������,
����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

_Main()

Func _Main()
	Local $hSlider

	; ��������
	GUICreate( "Slider Get/Set Range
	Min" ,  400 ,  296 )
	$hSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState()


	; ��ȡ��С��Χ
	MsgBox(4160, "Information", "Range Min:" & _GUICtrlSlider_GetRangeMin($hSlider))

	;
	������С��Χ
	_GUICtrlSlider_SetRangeMin($hSlider, 20)

	; ��ȡ��С��Χ
	MsgBox(4160, "Information", "Range Min:" & _GUICtrlSlider_GetRangeMin($hSlider))


	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main


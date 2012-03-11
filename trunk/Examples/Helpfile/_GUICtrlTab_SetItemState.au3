#include <GUIConstantsEx.au3>
#include <GuiTab.au3>

$Debug_TAB = False ; ��鴫�ݸ�����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $hTab

	; ���� GUI
	GUICreate("Tab Control Set Item State", 400, 300)
	$hTab = GUICtrlCreateTab(2, 2, 396, 296, $TCS_BUTTONS)
	GUISetState()

	; ��ӱ�ǩ
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")

	; ��ȡ/���õڶ�����ǩ��״̬
	_GUICtrlTab_SetItemState($hTab, 1, $TCIS_BUTTONPRESSED)
	MsgBox(4160, "��Ϣ", "Tab 2 state: " & _ExplainItemState(_GUICtrlTab_GetItemState($hTab, 1)))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

Func _ExplainItemState($iState)
	Local $sText = ""
	If $iState = 0 Then $sText &= "No state set on this item" & @LF
	If BitAND($iState, 1) Then $sText &= "Button Pressed" & @LF
	If BitAND($iState, 2) Then $sText &= "Button Highlighted"
	Return $sText
EndFunc   ;==>_ExplainItemState

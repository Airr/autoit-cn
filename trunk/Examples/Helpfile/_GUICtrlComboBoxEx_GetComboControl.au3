#include <GuiComboBoxEx.au3>
#include <GuiImageList.au3>
#include <GUIConstantsEx.au3>

$Debug_CB = False ;��鴫�ݸ� ComboBox/ComboBoxEx ����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

_Main()

Func _Main()
	Local $hGUI, $hImage, $hCombo

	; ���� GUI
	$hGUI = GUICreate("ComboBoxEx Get Combo Control", 400, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGUI, "", 2, 2, 394, 268)
	GUISetState()

	$hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 165)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 168)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 137)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 146)
	_GUICtrlComboBoxEx_SetImageList($hCombo, $hImage)

	For $x = 0 To 5
		_GUICtrlComboBoxEx_AddString($hCombo, StringFormat("%03d : Random string", Random(1, 100, 1)), $x)
	Next

	MsgBox(4160, "��Ϣ", _
			"Combo Control Handle: " & _GUICtrlComboBoxEx_GetComboControl($hCombo) & @LF & _
			"Edit Control Handle: " & _GUICtrlComboBoxEx_GetEditControl($hCombo))

	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>_Main

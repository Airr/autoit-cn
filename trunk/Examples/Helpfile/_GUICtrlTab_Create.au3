#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <WindowsConstants.au3>

$Debug_TAB = False ; ��鴫�ݸ�����������, ����ΪTrue�������һ���ؼ��ľ��,���ڼ�����Ƿ���

Global $hTab

_Main()

Func _Main()
	Local $hGUI

	; ���� GUI
	$hGUI = GUICreate("(UDF Created) Tab Control Create", 400, 300)
	$hTab = _GUICtrlTab_Create($hGUI, 2, 2, 396, 296)
	GUISetState()

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; ��ӱ�ǩ
	_GUICtrlTab_InsertItem($hTab, 0, "Tab 1")
	_GUICtrlTab_InsertItem($hTab, 1, "Tab 2")
	_GUICtrlTab_InsertItem($hTab, 2, "Tab 3")
	; ѭ��ֱ���û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>_Main

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $hWndTab
	$hWndTab = $hTab
	If Not IsHWnd($hTab) Then $hWndTab = GUICtrlGetHandle($hTab)

	$tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hWndTab
			Switch $iCode
				Case $NM_CLICK ; �û��ڿؼ��е����������
					_DebugPrint("$NM_CLICK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; ��ǩ�ؼ����Դ˷���ֵ
				Case $NM_DBLCLK ; �û��ڿؼ���˫����������
					_DebugPrint("$NM_DBLCLK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
;~ 					Return 1 ; ����ֵ�Բ��������Ĭ�ϴ���
					Return 0 ; �����������Ĭ�ϴ���
				Case $NM_RCLICK ; �û��ڿؼ��е��������Ҽ�
					_DebugPrint("$NM_RCLICK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
;~ 					Return 1 ; ����ֵ�Բ��������Ĭ�ϴ���
					Return 0 ; �����������Ĭ�ϴ���
				Case $NM_RDBLCLK ; �û��ڿؼ��е��������Ҽ�
					_DebugPrint("$NM_RDBLCLK" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
;~ 					Return 1 ; ����ֵ�Բ��������Ĭ�ϴ���
					Return 0 ; �����������Ĭ�ϴ���
				Case $NM_RELEASEDCAPTURE ; �ؼ����ͷ���겶��
					_DebugPrint("$NM_RELEASEDCAPTURE" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @LF & _
							"-->Code:" & @TAB & $iCode)
					; û�з���ֵ
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func _DebugPrint($s_text, $line = @ScriptLineNumber)
	ConsoleWrite( _
			"!===========================================================" & @LF & _
			"+======================================================" & @LF & _
			"-->Line(" & StringFormat("%04d", $line) & "):" & @TAB & $s_text & @LF & _
			"+======================================================" & @LF)
EndFunc   ;==>_DebugPrint

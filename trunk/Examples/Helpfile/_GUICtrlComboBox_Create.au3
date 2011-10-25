#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include <GUIComboBox.au3>
#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Constants.au3>

Opt('MustDeclareVars ', 1)

$Debug_CB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤��

Global $hCombo

_Main()

Func _Main()
	Local $hGUI

	; ��������
	$hGUI = GUICreate(" (UDF) ComboBox Create ", 400, 296)
	$hCombo = _GUICtrlComboBox_Create($hGUI, "", 2, 272, 396, 296)
	$edit = GUICtrlCreateEdit("", 2, 2, 396, 266, BitOR($WS_VSCROLL, $ES_AUTOVSCROLL))
	GUISetState()

	; ����ļ�
	_GUICtrlComboBox_BeginUpdate($hCombo)
	_GUICtrlComboBox_AddDir($hCombo, "", $DDL_DRIVES, False)
	_GUICtrlComboBox_EndUpdate($hCombo)

	GUIRegisterMsg($WM_COMMAND, "WM_COMMAND ")

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

Func WM_COMMAND($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg
	Local $hWndFrom, $iIDFrom, $iCode, $hWndCombo
	If Not IsHWnd($hCombo) Then $hWndCombo = GUICtrlGetHandle($hCombo)
	$hWndFrom = $ilParam
	$iIDFrom = BitAND($iwParam, 0xFFFF) ; Low Word
	$iCode = BitShift($iwParam, 16) ; Hi Word
	Switch $hWndFrom
		Case $hCombo, $hWndCombo
			Switch $iCode
				Case $CBN_CLOSEUP ; ��Ͽ���б��ر�ʱ����
					memowrite(" $CBN_CLOSEUP" & @LF)
					memowrite(" -->hWndFrom:" & @TAB & $hWndFrom & @LF)
					memowrite(" -->IDFrom:" & @TAB & $iIDFrom & @LF)
					memowrite(" -->Code:" & @TAB & $iCode)
					; �޷���ֵ
				Case $CBN_DBLCLK ; ˫����Ͽ���б���е�һ���ַ���ʱ����
					memowrite(" $CBN_DBLCLK" & @LF)
					memowrite(" -->hWndFrom:" & @TAB & $hWndFrom & @LF)
					memowrite(" -->IDFrom:" & @TAB & $iIDFrom & @LF)
					memowrite(" -->Code:" & @TAB & $iCode)
					; �޷���ֵ
				Case $CBN_DROPDOWN ; ����Ͽ���б�򽫿ɼ�ʱ����
					memowrite(" $CBN_DROPDOWN" & @LF)
					memowrite(" -->hWndFrom:" & @TAB & $hWndFrom & @LF)
					memowrite(" -->IDFrom:" & @TAB & $iIDFrom & @LF)
					memowrite(" -->Code:" & @TAB & $iCode)
					; �޷���ֵ
				Case $CBN_EDITCHANGE ; ����Ͽ�ı༭�ؼ�������ִ��ѡ���ı���������
					memowrite(" $CBN_EDITCHANGE" & @LF)
					memowrite(" -->hWndFrom:" & @TAB & $hWndFrom & @LF)
					memowrite(" -->IDFrom:" & @TAB & $iIDFrom & @LF)
					memowrite(" -->Code:" & @TAB & $iCode)
					; �޷���ֵ
				Case $CBN_EDITUPDATE ; ��Ͽ�༭�ؼ�������ʾ��ѡ�ı�ʱ����
					memowrite(" $CBN_EDITUPDATE" & @LF)
					memowrite(" -->hWndFrom:" & @TAB & $hWndFrom & @LF)
					memowrite(" -->IDFrom:" & @TAB & $iIDFrom & @LF)
					memowrite(" -->Code:" & @TAB & $iCode)
					; �޷���ֵ
				Case $CBN_ERRSPACE ; ��Ͽ��޷������㹻�ڴ�����������ʱ����
					memowrite(" $CBN_ERRSPACE" & @LF)
					memowrite(" -->hWndFrom:" & @TAB & $hWndFrom & @LF)
					memowrite(" -->IDFrom:" & @TAB & $iIDFrom & @LF)
					memowrite(" -->Code:" & @TAB & $iCode)
					; �޷���ֵ
				Case $CBN_KILLFOCUS ; ��Ͽ�ʧ���̽���ʱ����
					memowrite(" $CBN_KILLFOCUS" & @LF)
					memowrite(" -->hWndFrom:" & @TAB & $hWndFrom & @LF)
					memowrite(" -->IDFrom:" & @TAB & $iIDFrom & @LF)
					memowrite(" -->Code:" & @TAB & $iCode)
					; �޷���ֵ
				Case $CBN_SELCHANGE ; ��Ͽ���б���еĵ�ǰѡ��ı�ʱ����
					memowrite(" $CBN_SELCHANGE" & @LF)
					memowrite(" -->hWndFrom:" & @TAB & $hWndFrom & @LF)
					memowrite(" -->IDFrom:" & @TAB & $iIDFrom & @LF)
					memowrite(" -->Code:" & @TAB & $iCode)
					; �޷���ֵ
				Case $CBN_SELENDCANCEL ; ѡ��һ����Ŀʱ����, Ȼ��ѡȡ��һ�ؼ���رնԻ���
					memowrite(" $CBN_SELENDCANCEL" & @LF)
					memowrite(" -->hWndFrom:" & @TAB & $hWndFrom & @LF)
					memowrite(" -->IDFrom:" & @TAB & $iIDFrom & @LF)
					memowrite(" -->Code:" & @TAB & $iCode)
					; �޷���ֵ
				Case $CBN_SELENDOK ; ѡȡһ���б����һ����Ŀ��ر��б�ʱ����
					memowrite(" $CBN_SELENDOK" & @LF)
					memowrite(" -->hWndFrom:" & @TAB & $hWndFrom & @LF)
					memowrite(" -->IDFrom:" & @TAB & $iIDFrom & @LF)
					memowrite(" -->Code:" & @TAB & $iCode)
					; �޷���ֵ
				Case $CBN_SETFOCUS ; ��Ͽ��յ����̽���ʱ����
					memowrite(" $CBN_SETFOCUS" & @LF)
					memowrite(" -->hWndFrom:" & @TAB & $hWndFrom & @LF)
					memowrite(" -->IDFrom:" & @TAB & $iIDFrom & @LF)
					memowrite(" -->Code:" & @TAB & $iCode)
					; �޷���ֵ
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
endfunc   ;==>WM_COMMAND

Func memowrite($s_text)
	GUICtrlSetData($edit, $s_text & @CRLF, 1)
endfunc   ;==>memowrite


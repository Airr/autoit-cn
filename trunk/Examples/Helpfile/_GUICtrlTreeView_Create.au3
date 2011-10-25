#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#include <EditConstants.au3>
#include <GuiConstantsEx.au3>
#include <GuiTreeView.au3>
#include <WindowsConstants.au3>

Opt('MustDeclareVars', 1)

$Debug_TV = False ; ��鴫�ݸ����������� , ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

Global $hTreeView, $edit

_Main()

Func _Main()

	Local $GUI, $hItem
	Local $iStyle = BitOR($TVS_EDITLABELS, $TVS_HASBUTTONS, $TVS_HASLINES, $TVS_LINESATROOT, $TVS_DISABLEDRAGDROP, $TVS_SHOWSELALWAYS, $TVS_CHECKBOXES)
	$GUI = GUICreate(" (UDF Created) TreeView Create ", 400, 300)
	$edit = GUICtrlCreateEdit(" ", 2, 277, 394, 258, BitOR($WS_VSCROLL, $ES_AUTOVSCROLL))

	$hTreeView = _GUICtrlTreeView_Create($GUI, 2, 2, 396, 268, $iStyle, $WS_EX_CLIENTEDGE)
	GUISetState()

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY ")

	_GUICtrlTreeView_BeginUpdate($hTreeView)
	For $x = 1 To Random(2, 10, 1)
		$hItem = _GUICtrlTreeView_Add($hTreeView, 0, StringFormat(" [%02d] New Item ", $x))
		For $y = 1 To Random(2, 10, 1)
			_GUICtrlTreeView_AddChild($hTreeView, $hItem, StringFormat(" [%02d] New Child ", $y))
		Next
	Next
	_GUICtrlTreeView_EndUpdate($hTreeView)

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main

Func WM_NOTIFY($hWnd, $iMsg, $iwParam, $ilParam)
	#forceref $hWnd, $iMsg, $iwParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $hWndTreeview
	$hWndTreeview = $hTreeView
	If Not IsHWnd($hTreeView) Then $hWndTreeview = GUICtrlGetHandle($hTreeView)

	$tNMHDR = DllStructCreate($tagNMHDR, $ilParam)
	$hWndFrom = HWnd( DllStructGetData($tNMHDR, "hWndFrom "))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom ")
	$iCode = DllStructGetData($tNMHDR, "Code ")
	Switch $hWndFrom
		Case $hWndTreeview
			Switch $iCode
				Case $NM_CLICK ; �û��ڿؼ��ڵ��������
					memowrite(" $NM_CLICK" & @LF)
					memowrite(" -->hWndFrom:" & $hWndFrom @LF)
					memowrite(" -->IDFrom:" & $iIDFrom @LF)
					memowrite(" -->Code:" & $iCode @CRLF)
;~          Return 1 ; ��0Ϊ������Ĭ�ϲ���
					Return 0 ; 0Ϊ����Ĭ�ϲ���
				Case $NM_DBLCLK ; �û��ڿؼ���˫��������
					memowrite(" $NM_DBLCLK" & @LF)
					memowrite(" -->hWndFrom:" & $hWndFrom @LF)
					memowrite(" -->IDFrom:" & $iIDFrom @LF)
					memowrite(" -->Code:" & $iCode @CRLF)
;~          Return 1 ; ��0Ϊ������Ĭ�ϲ���
					Return 0 ; 0Ϊ����Ĭ�ϲ���
				Case $NM_RCLICK ; �û��ڿؼ��ڵ�������Ҽ�
					memowrite(" $NM_RCLICK" & @LF)
					memowrite(" -->hWndFrom:" & $hWndFrom @LF)
					memowrite(" -->IDFrom:" & $iIDFrom @LF)
					memowrite(" -->Code:" & $iCode @CRLF)
;~          Return 1 ; ��0Ϊ������Ĭ�ϲ���
					Return 0 ; 0Ϊ����Ĭ�ϲ���
				Case $NM_RDBLCLK ; �û��ڿؼ���˫������Ҽ�
					memowrite(" $NM_RDBLCLK" & @LF)
					memowrite(" -->hWndFrom:" & $hWndFrom @LF)
					memowrite(" -->IDFrom:" & $iIDFrom @LF)
					memowrite(" -->Code:" & $iCode @CRLF)
;~          Return 1 ; ��0Ϊ������Ĭ�ϲ���
					Return 0 ; 0Ϊ����Ĭ�ϲ���
				Case $NM_KILLFOCUS ; �ؼ���ʧ���뽹��
					memowrite(" $NM_KILLFOCUS" & @LF)
					memowrite(" -->hWndFrom:" & $hWndFrom @LF)
					memowrite(" -->IDFrom:" & $iIDFrom @LF)
					memowrite(" -->Code:" & $iCode @CRLF)
;~          ; �޷���ֵ
				Case $NM_RETURN ; �ؼ��������뽹�����û��ѻ���
					memowrite(" $NM_RETURN" & @LF)
					memowrite(" -->hWndFrom:" & $hWndFrom @LF)
					memowrite(" -->IDFrom:" & $iIDFrom @LF)
					memowrite(" -->Code:" & $iCode @CRLF)
;~          Return 1 ; ��0Ϊ������Ĭ�ϲ���
					Return 0 ; 0Ϊ����Ĭ�ϲ���
;~        Case $NM_SETCURSOR ; �ؼ���������Ի�ӦWM_SETCURSOR��Ϣ
;~          Local $tinfo = DllStructCreate($tagNMMOUSE , $ilParam)
;~          $hWndFrom = HWnd(DllStructGetData($tinfo , "hWndFrom"))
;~          $iIDFrom = DllStructGetData($tinfo , "IDFrom")
;~          $iCode = DllStructGetData($tinfo , "Code")
;~          memowrite("$NM_SETCURSOR" & @LF & "--> hWndFrom:" & @TAB & $hWndFrom & @LF)
;~          memowrite("-->IDFrom:" & @TAB & $iIDFrom & @LF)
;~          memowrite("-->Code:" & @TAB & $iCode & @LF)
;~          memowrite("-->ItemSpec:" & @TAB & DllStructGetData($tinfo , "ItemSpec") & @LF)
;~          memowrite("-->ItemData:" & @TAB & DllStructGetData($tinfo , "ItemData") & @LF)
;~          memowrite("-->X:" & @TAB & DllStructGetData($tinfo , "X") & @LF)
;~          memowrite("-->Y:" & @TAB & DllStructGetData($tinfo , "Y") & @LF)
;~          memowrite("-->HitInfo:" & @TAB & DllStructGetData($tinfo , "HitInfo"))
;~          Return 0 ; ʹ�ؼ��������ù��
;~          Return 1 ; ��0��ֹ�ؼ����ù��
				Case $NM_SETFOCUS ; �ؼ����յ����뽹��
					memowrite(" $NM_KILLFOCUS" & @LF)
					memowrite(" -->hWndFrom:" & $hWndFrom @LF)
					memowrite(" -->IDFrom:" & $iIDFrom @LF)
					memowrite(" -->Code:" & $iCode @CRLF)
;~          ; �޷���ֵ
				Case $TVN_BEGINDRAGA, $TVN_BEGINDRAGW
					memowrite(" $TVN_BEGINDRAG ")
				Case $TVN_BEGINLABELEDITA, $TVN_BEGINLABELEDITW
					memowrite(" $TVN_BEGINLABELEDIT ")
				Case $TVN_BEGINRDRAGA, $TVN_BEGINRDRAGW
					memowrite(" $TVN_BEGINRDRAG ")
				Case $TVN_DELETEITEMA, $TVN_DELETEITEMW
					memowrite(" $TVN_DELETEITEM ")
				Case $TVN_ENDLABELEDITA, $TVN_ENDLABELEDITW
					memowrite(" $TVN_ENDLABELEDIT ")
				Case $TVN_GETDISPINFOA, $TVN_GETDISPINFOW
					memowrite(" $TVN_GETDISPINFO ")
				Case $TVN_GETINFOTIPA, $TVN_GETINFOTIPW
					memowrite(" $TVN_GETINFOTIP ")
				Case $TVN_ITEMEXPANDEDA, $TVN_ITEMEXPANDEDW
					memowrite(" $TVN_ITEMEXPANDED ")
				Case $TVN_ITEMEXPANDINGA, $TVN_ITEMEXPANDINGW
					memowrite(" $TVN_ITEMEXPANDING ")
				Case $TVN_KEYDOWN
					memowrite(" $TVN_KEYDOWN ")
				Case $TVN_SELCHANGEDA, $TVN_SELCHANGEDW
					memowrite(" $TVN_SELCHANGED ")
				Case $TVN_SELCHANGINGA, $TVN_SELCHANGINGW
					memowrite(" $TVN_SELCHANGING ")
				Case $TVN_SETDISPINFOA, $TVN_SETDISPINFOW
					memowrite(" $TVN_SETDISPINFO ")
				Case $TVN_SINGLEEXPAND
					memowrite(" $TVN_SINGLEEXPAND ")
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
endfunc   ;==>WM_NOTIFY

Func memowrite($s_text)
	GUICtrlSetData($edit, $s_text & @CRLF, 1)
endfunc   ;==>memowrite


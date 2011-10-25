#Include <GUIConstantsEx.au3>
#Include <GUIRichEdit.au3>
#Include <WinAPIEx.au3>

Opt('MustDeclareVars ', 1)

Global Const $sText = ' AutoIt v3 is a freeware BASIC-like scripting language designed for automating the Windows GUI and' & _
		' general scripting. It uses a combination of simulated keystrokes , mouse movement and window/control manipulation in order' & _
		' to automate tasks in a way not possible or reliable with other languages(e.g. VBScript and SendKeys). AutoIt is also very' & _
		' small , self-contained and will run on all versions of Windows out-of-the-box with no annoying " runtimes " required!' & @CRLF & @CRLF & _
		' AutoIt was initially designed for PC " roll out " situations to reliably automate and configure thousands of PCs. Over time' & _
		' it has become a powerful language that supports complex expressions , user functions , loops and everything else that veteran' & _
		' scripters would expect. '

Global $hForm, $hDlg, $hRichEdit, $hFont, $Msg, $Menu, $ExitItem, $FindItem, $ReplaceItem, $Text, $Lenght

; ��������
$hForm = GUICreate('MyGUI ', 800, 600)

; �������˵�
$Menu = GUICtrlCreateMenu('&File')
$ExitItem = GUICtrlCreateMenuItem('E&xit... ', $Menu)
$Menu = GUICtrlCreateMenu('&Edit')
$FindItem = GUICtrlCreateMenuItem('&Find... ', $Menu)
$ReplaceItem = GUICtrlCreateMenuItem('R&eplace... ', $Menu)

; ��������ѡ�����ֵĸ��ı��ؼ�, �����ÿؼ�Ϊ"Courier New"����
$hRichEdit = _GUICtrlRichEdit_Create($hForm, $sText, 0, 0, 800, 600, BitOR($ES_AUTOVSCROLL, $ES_NOHIDESEL, $ES_MULTILINE, $WS_VSCROLL), 0)
$hFont = _WinAPI_CreateFont(17, 0, 0, 0, $FW_NORMAL, 0, 0, 0, $DEFAULT_CHARSET, $OUT_DEFAULT_PRECIS, $CLIP_DEFAULT_PRECIS, $ANTIALIASED_QUALITY, $DEFAULT_PITCH, 'Courier New')
_SendMessage($hRichEdit, $WM_SETFONT, $hFont, 1)
_SendMessage($hRichEdit, $EM_SETSEL)

; ע��FINDMSGSTRING��Ϣ���Խ��ܶԻ�����Ϣ
GUIRegisterMsg( _WinAPI_RegisterWindowMessage('commdlg_FindReplace'), 'WM_FINDMSGSTRING')

; ��ʾ����
GUISetState()

While 1
	$Msg = GUIGetMsg()
	Switch $Msg
		Case $GUI_EVENT_CLOSE, $ExitItem
			ExitLoop
		Case $FindItem, $ReplaceItem
			$Text = _GUICtrlRichEdit_GetSelText($hRichEdit)
			If @error Then
				$Text = ''
			EndIf
			Switch $Msg
				Case $FindItem
					$hDlg = _WinAPI_FindTextDlg($hForm, $Text, $FR_DOWN, 0, $hRichEdit)
				Case $ReplaceItem
					$hDlg = _WinAPI_ReplaceTextDlg($hForm, $Text, '', 0, 0, $hRichEdit)
			EndSwitch
		Case $ReplaceItem
	EndSwitch
WEnd

GUIDelete()

Func _IsMatchSelection($hWnd, $sText, $iBehavior)

	Local $Pos

	$Pos = _GUICtrlRichEdit_GetSel($hWnd)
	If @error Then
		Return 0
	EndIf
	$Pos = _GUICtrlRichEdit_FindTextInRange($hWnd, $sText, $Pos[0], $Pos[1], BitAND($iBehavior, $FR_MATCHCASE) = $FR_MATCHCASE, BitAND($iBehavior, $FR_WHOLEWORD) = $FR_WHOLEWORD, BitAND($iBehavior, BitOR($FR_MATCHALEFHAMZA, $FR_MATCHDIAC, $FR_MATCHKASHIDA)))
	If($Pos[0] = -1) Or($Pos[1] = -1) Then
		Return 0
	Else
		Return 1
	EndIf
endfunc   ;==>_IsMatchSelection

Func WM_FINDMSGSTRING($hWnd, $iMsg, $wParam, $lParam)

	Local $tFINDREPLACE = DllStructCreate($tagFINDREPLACE, $lParam)
	Local $sReplace = _WinAPI_GetString(DllStructGetData($tFINDREPLACE, 'ReplaceWith'))
	Local $sFind = _WinAPI_GetString(DllStructGetData($tFINDREPLACE, 'FindWhat'))
	Local $hRichEdit = Ptr( DllStructGetData($tFINDREPLACE, 'lParam'))
	Local $Flags = DllStructGetData($tFINDREPLACE, 'Flags')
	Local $Pos, $Cur = -1

	Select
		; �û�����滻�Ի����е�"Replace"��ť
		Case BitAND($Flags, $FR_REPLACE)
			If _IsMatchSelection($hRichEdit, $sFind, $Flags) Then
				_GUICtrlRichEdit_ReplaceText($hRichEdit, $sReplace)
			EndIf
			ContinueCase
			; �û��������/�滻�Ի����е�"Find Next"��ť
		Case BitAND($Flags, $FR_FINDNEXT)
			$Pos = _GUICtrlRichEdit_GetSel($hRichEdit)
			If @error Then
				Return
			EndIf
			If BitAND($Flags, $FR_DOWN) Then
				$Pos = _GUICtrlRichEdit_FindTextInRange($hRichEdit, $sFind, $Pos[1], -1, BitAND($Flags, $FR_MATCHCASE) = $FR_MATCHCASE, BitAND($Flags, $FR_WHOLEWORD) = $FR_WHOLEWORD)
			Else
				$Pos = _GUICtrlRichEdit_FindTextInRange($hRichEdit, $sFind, $Pos[0], 0, BitAND($Flags, $FR_MATCHCASE) = $FR_MATCHCASE, BitAND($Flags, $FR_WHOLEWORD) = $FR_WHOLEWORD, BitAND($Flags, $FR_DOWN))
			EndIf
			If($Pos[0] = -1) Or($Pos[1] = -1) Then
				MsgBox(64, WinGetTitle($hDlg), 'Cannot find "'& $sFind & ' " ', 0, $hDlg)
				Return
			EndIf
			; �˴�������ֱ��ʹ��EM_SETSEL��Ϣ��Ϊ_GUICtrlRichEdit_SetSel()���ý��㵽���ı��ؼ�
			_SendMessage($hRichEdit, $EM_SETSEL, $Pos[0], $Pos[1])
			;_GUICtrlRichEdit_ScrollToCaret($hRichEdit)
			; �û�����滻�Ի����е�"Replace All"��ť
		Case BitAND($Flags, $FR_REPLACEALL)
			Dim $Pos[2] = [0, -1]
			While 1
				$Pos = _GUICtrlRichEdit_FindTextInRange($hRichEdit, $sFind, $Pos[1], -1, BitAND($Flags, $FR_MATCHCASE) = $FR_MATCHCASE, BitAND($Flags, $FR_WHOLEWORD) = $FR_WHOLEWORD)
				If($Pos[0] = -1) Or($Pos[1] = -1) Then
					If $Cur = -1 Then
						MsgBox(64, WinGetTitle($hDlg), 'Cannot find "'& $sFind & ' " ', 0, $hDlg)
						Return
					EndIf
					ExitLoop
				EndIf
				If $Cur = -1 Then
					_GUICtrlRichEdit_PauseRedraw($hRichEdit)
				EndIf
				_SendMessage($hRichEdit, $EM_SETSEL, $Pos[0], $Pos[1])
				If _GUICtrlRichEdit_ReplaceText($hRichEdit, $sReplace) Then
					$Cur = $Pos[0] + StringLen($sReplace)
				Else
					ExitLoop
				EndIf
			WEnd
			_SendMessage($hRichEdit, $EM_SETSEL, $Cur, $Cur)
			;_GUICtrlRichEdit_ScrollToCaret($hRichEdit)
			_GUICtrlRichEdit_ResumeRedraw($hRichEdit)
			; ���ڹرնԻ���
		Case BitAND($Flags, $FR_DIALOGTERM)
			; �����ڲ����������ͷ��ڴ�
			_WinAPI_FlushFRBuffer()
	EndSelect
endfunc   ;==>WM_FINDMSGSTRING


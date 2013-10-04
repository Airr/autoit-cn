; ===============================================================================
;
; Program Name:     MsgBoxWizard()
; Description:      Generate the MessageBox function code according to the user
;                   choices
; Requirement(s):   None
; Return Value(s):  None
; Author(s):        Giuseppe Criaco <gcriaco@quipo.it>
;
; ===============================================================================
;
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <EditConstants.au3>

Global $iFlag, $Button, $MsgBox, $asMsgText
Global $optWarning, $optInfo, $optCritical, $optQuestion
Global $optNoIcon, $optApplication, $optSysModal, $optTaskModal, $optOK
Global $optOkCancel, $optYesNo, $optYesNoCancel, $optAbortRetryIgnore
Global $optRetryCancel, $optCancelRetryContinue, $optNothing, $optTopMost
Global $optRightJust, $optFirst, $optSecond, $optThird

_Main()

Func _Main()
	Local $TITLE, $TEXT, $Timeout
	Local $BTNCOPY, $BTNEXIT, $BTNPREVIEW, $MSG, $sText

GUICreate("MsgBox �� v.1.0", 440, 540, 100, 100)  ; will create a dialog box 

GUICtrlCreateLabel("����", 10, 5, 30)
	$TITLE = GUICtrlCreateInput("", 10, 20, 420, 20)
	GUICtrlSetState(-1, $GUI_FOCUS)
GUICtrlSetTip(-1, "��Ϣ����ʾ�ı���.")
GUICtrlCreateLabel("�ı�", 10, 50, 30)
	$TEXT = GUICtrlCreateEdit("", 10, 65, 420, 100, $ES_AUTOVSCROLL + $WS_VSCROLL + $ES_MULTILINE + $ES_WANTRETURN)
GUICtrlSetTip(-1, "��Ϣ����ʾ���ı�.")

GUICtrlCreateGroup("ͼ��", 10, 170, 200, 130)
$optWarning = GUICtrlCreateRadio("����", 20, 190, 100, 20)
	GUICtrlSetState(-1, $GUI_CHECKED)
$optInfo = GUICtrlCreateRadio("��Ϣ", 20, 210, 100, 20)
$optCritical = GUICtrlCreateRadio("���ش���", 20, 230, 100, 20)
$optQuestion = GUICtrlCreateRadio("�ʺ�", 20, 250, 100, 20)
$optNoIcon = GUICtrlCreateRadio("û��", 20, 270, 100, 20)
	GUICtrlCreateGroup("", -99, -99, 1, 1) ;close group

GUICtrlCreateGroup("��ʽ", 10, 310, 200, 90)
$optApplication = GUICtrlCreateRadio("Ӧ�ó���", 20, 330, 100, 20)
	GUICtrlSetState(-1, $GUI_CHECKED)
$optSysModal = GUICtrlCreateRadio("ϵͳ��ʽ", 20, 350, 100, 20)
$optTaskModal = GUICtrlCreateRadio("����ʽ", 20, 370, 100, 20)
	GUICtrlCreateGroup("", -99, -99, 1, 1) ;close group

GUICtrlCreateGroup("��ť", 230, 170, 200, 170)
$optOK = GUICtrlCreateRadio("ȷ��", 240, 190, 100, 20)
	GUICtrlSetState(-1, $GUI_CHECKED)
$optOkCancel = GUICtrlCreateRadio("ȷ��, ȡ��", 240, 210, 100, 20)
$optYesNo = GUICtrlCreateRadio("��, ��", 240, 230, 100, 20)
$optYesNoCancel = GUICtrlCreateRadio("��, ��, ȡ��", 240, 250, 100, 20)
$optAbortRetryIgnore = GUICtrlCreateRadio("��ֹ, ����, ����", 240, 270, 120, 20)
$optRetryCancel = GUICtrlCreateRadio("����, ȡ��", 240, 290, 100, 20)
$optCancelRetryContinue = GUICtrlCreateRadio("ȡ��, ����, ����", 240, 310, 130, 20)
	GUICtrlCreateGroup("", -99, -99, 1, 1) ;close group

GUICtrlCreateGroup("����ѡ��", 10, 410, 200, 90)
$optNothing = GUICtrlCreateRadio("��", 20, 430, 100, 20)
	GUICtrlSetState(-1, $GUI_CHECKED)
$optTopMost = GUICtrlCreateRadio("�����ö�", 20, 450, 130, 20)
$optRightJust = GUICtrlCreateRadio("���ҵ�����Ķ�˳��", 20, 470, 150, 20)
	GUICtrlCreateGroup("", -99, -99, 1, 1) ;close group

GUICtrlCreateGroup("Ĭ�ϰ�ť", 230, 350, 200, 90)
$optFirst = GUICtrlCreateRadio("��һ����ť", 240, 370, 130, 20)
	GUICtrlSetState(-1, $GUI_CHECKED)
$optSecond = GUICtrlCreateRadio("�ڶ�����ť", 240, 390, 130, 20)
	GUICtrlSetState(-1, $GUI_DISABLE)
$optThird = GUICtrlCreateRadio("��������ť", 240, 410, 130, 20)
	GUICtrlSetState(-1, $GUI_DISABLE)
	GUICtrlCreateGroup("", -99, -99, 1, 1) ;close group

GUICtrlCreateGroup("��ʱ(��):", 230, 450, 200, 50)
	$Timeout = GUICtrlCreateInput("", 240, 470, 100, 20, $ES_NUMBER)
GUICtrlSetTip(-1, "������������ʱ��,��Ϣ�򽫻��Զ��Ĺر�.")
	GUICtrlCreateGroup("", -99, -99, 1, 1) ;close group

$BTNPREVIEW = GUICtrlCreateButton("Ԥ��(&P)", 10, 510, 100)
GUICtrlSetTip(-1, "��ʾ��Ϣ��")
$BTNCOPY = GUICtrlCreateButton("����(&C)", 120, 510, 100)
GUICtrlSetTip(-1, "�������ɵ� AutoIt ���뵽���а�")
$BTNEXIT = GUICtrlCreateButton("�˳�(&E)", 230, 510, 100)
GUICtrlSetTip(-1, "�˳�����")

	$Button = $optOK

	GUISetState() ; will display an empty dialog box

	; Run the GUI until the dialog is closed
	While 1
		$MSG = GUIGetMsg()
		Select
			Case $MSG = $GUI_EVENT_CLOSE Or $MSG = $BTNEXIT
				Exit

			Case $MSG = $optOK
				$Button = $optOK
				GUICtrlSetState($optFirst, $GUI_CHECKED)
				GUICtrlSetState($optFirst, $GUI_ENABLE)
				GUICtrlSetState($optSecond, $GUI_DISABLE)
				GUICtrlSetState($optThird, $GUI_DISABLE)

			Case $MSG = $optOkCancel
				$Button = $optOkCancel
				GUICtrlSetState($optFirst, $GUI_CHECKED)
				GUICtrlSetState($optFirst, $GUI_ENABLE)
				GUICtrlSetState($optSecond, $GUI_ENABLE)
				GUICtrlSetState($optThird, $GUI_DISABLE)

			Case $MSG = $optYesNo
				$Button = $optYesNo
				GUICtrlSetState($optFirst, $GUI_CHECKED)
				GUICtrlSetState($optFirst, $GUI_ENABLE)
				GUICtrlSetState($optSecond, $GUI_ENABLE)
				GUICtrlSetState($optThird, $GUI_DISABLE)

			Case $MSG = $optYesNoCancel
				$Button = $optYesNoCancel
				GUICtrlSetState($optFirst, $GUI_CHECKED)
				GUICtrlSetState($optFirst, $GUI_ENABLE)
				GUICtrlSetState($optSecond, $GUI_ENABLE)
				GUICtrlSetState($optThird, $GUI_ENABLE)

			Case $MSG = $optAbortRetryIgnore
				$Button = $optAbortRetryIgnore
				GUICtrlSetState($optFirst, $GUI_CHECKED)
				GUICtrlSetState($optFirst, $GUI_ENABLE)
				GUICtrlSetState($optSecond, $GUI_ENABLE)
				GUICtrlSetState($optThird, $GUI_ENABLE)

			Case $MSG = $optRetryCancel
				$Button = $optRetryCancel
				GUICtrlSetState($optFirst, $GUI_CHECKED)
				GUICtrlSetState($optFirst, $GUI_ENABLE)
				GUICtrlSetState($optSecond, $GUI_ENABLE)
				GUICtrlSetState($optThird, $GUI_DISABLE)

			Case $MSG = $optCancelRetryContinue
				$Button = $optCancelRetryContinue
				GUICtrlSetState($optFirst, $GUI_CHECKED)
				GUICtrlSetState($optFirst, $GUI_ENABLE)
				GUICtrlSetState($optSecond, $GUI_ENABLE)
				GUICtrlSetState($optThird, $GUI_ENABLE)

			Case $MSG = $BTNPREVIEW
				MsgBox(_SetFlag($iFlag), GUICtrlRead($TITLE), GUICtrlRead($TEXT), GUICtrlRead($Timeout))

			Case $MSG = $BTNCOPY
				$asMsgText = StringSplit(GUICtrlRead($TEXT), @CRLF, 1)
				If $asMsgText[0] = 1 Then
					$sText = GUICtrlRead($TEXT)
				Else
					$sText = $asMsgText[1]

					For $iCtr = 2 To $asMsgText[0]
						$sText = $sText & Chr(34) & " & @CRLF & " & Chr(34) & $asMsgText[$iCtr]
					Next

				EndIf

				Select
					Case $Button = $optOK
						If GUICtrlRead($Timeout) = "" Then
							$MsgBox = "MsgBox(" & _SetFlag($iFlag) & "," & Chr(34) & GUICtrlRead($TITLE) & Chr(34) & "," _
									 & Chr(34) & $sText & Chr(34) & ")"
						Else
							$MsgBox = "Dim $iMsgBoxAnswer" & @CRLF & _
									"$iMsgBoxAnswer = MsgBox(" & _SetFlag($iFlag) & "," & Chr(34) & GUICtrlRead($TITLE) & Chr(34) & "," _
									 & Chr(34) & $sText & Chr(34) & "," & GUICtrlRead($Timeout) & ")" & @CRLF & _
									"Select" & @CRLF & _
									"   Case $iMsgBoxAnswer = -1 ;Timeout" & @CRLF & @CRLF & _
									"   Case Else                ;OK" & @CRLF & @CRLF & _
									"EndSelect"
						EndIf

					Case $Button = $optOkCancel
						If GUICtrlRead($Timeout) = "" Then
							$MsgBox = "Dim $iMsgBoxAnswer" & @CRLF & _
									"$iMsgBoxAnswer = MsgBox(" & _SetFlag($iFlag) & "," & Chr(34) & GUICtrlRead($TITLE) & Chr(34) & "," _
									 & Chr(34) & $sText & Chr(34) & ")" & @CRLF & _
									"Select" & @CRLF & _
									"   Case $iMsgBoxAnswer = 1 ;OK" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = 2 ;Cancel" & @CRLF & @CRLF & _
									"EndSelect"
						Else
							$MsgBox = "Dim $iMsgBoxAnswer" & @CRLF & _
									"$iMsgBoxAnswer = MsgBox(" & _SetFlag($iFlag) & "," & Chr(34) & GUICtrlRead($TITLE) & Chr(34) & "," _
									 & Chr(34) & $sText & Chr(34) & "," & GUICtrlRead($Timeout) & ")" & @CRLF & _
									"Select" & @CRLF & _
									"   Case $iMsgBoxAnswer = 1  ;OK" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = 2  ;Cancel" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = -1 ;Timeout" & @CRLF & @CRLF & _
									"EndSelect"
						EndIf

					Case $Button = $optYesNo
						If GUICtrlRead($Timeout) = "" Then
							$MsgBox = "Dim $iMsgBoxAnswer" & @CRLF & _
									"$iMsgBoxAnswer = MsgBox(" & _SetFlag($iFlag) & "," & Chr(34) & GUICtrlRead($TITLE) & Chr(34) & "," _
									 & Chr(34) & $sText & Chr(34) & ")" & @CRLF & _
									"Select" & @CRLF & _
									"   Case $iMsgBoxAnswer = 6 ;Yes" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = 7 ;No" & @CRLF & @CRLF & _
									"EndSelect"
						Else
							$MsgBox = "Dim $iMsgBoxAnswer" & @CRLF & _
									"iMsgBoxAnswer = MsgBox(" & _SetFlag($iFlag) & "," & Chr(34) & GUICtrlRead($TITLE) & Chr(34) & "," _
									 & Chr(34) & $sText & Chr(34) & "," & GUICtrlRead($Timeout) & ")" & @CRLF & _
									"Select" & @CRLF & _
									"   Case $iMsgBoxAnswer = 6  ;Yes" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = 7  ;No" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = -1 ;Timeout" & @CRLF & @CRLF & _
									"EndSelect"
						EndIf

					Case $Button = $optYesNoCancel
						If GUICtrlRead($Timeout) = "" Then
							$MsgBox = "Dim $iMsgBoxAnswer" & @CRLF & _
									"$iMsgBoxAnswer = MsgBox(" & _SetFlag($iFlag) & "," & Chr(34) & GUICtrlRead($TITLE) & Chr(34) & "," _
									 & Chr(34) & $sText & Chr(34) & ")" & @CRLF & _
									"Select" & @CRLF & _
									"   Case $iMsgBoxAnswer = 6 ;Yes" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = 7 ;No" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = 2 ;Cancel" & @CRLF & @CRLF & _
									"EndSelect"
						Else
							$MsgBox = "Dim $iMsgBoxAnswer" & @CRLF & _
									"$iMsgBoxAnswer = MsgBox(" & _SetFlag($iFlag) & "," & Chr(34) & GUICtrlRead($TITLE) & Chr(34) & "," _
									 & Chr(34) & $sText & Chr(34) & "," & GUICtrlRead($Timeout) & ")" & @CRLF & _
									"Select" & @CRLF & _
									"   Case $iMsgBoxAnswer = 6  ;Yes" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = 7  ;No" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = 2  ;Cancel" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = -1 ;Timeout" & @CRLF & @CRLF & _
									"EndSelect"
						EndIf

					Case $Button = $optAbortRetryIgnore
						If GUICtrlRead($Timeout) = "" Then
							$MsgBox = "Dim $iMsgBoxAnswer" & @CRLF & _
									"$iMsgBoxAnswer = MsgBox(" & _SetFlag($iFlag) & "," & Chr(34) & GUICtrlRead($TITLE) & Chr(34) & "," _
									 & Chr(34) & $sText & Chr(34) & ")" & @CRLF & _
									"Select" & @CRLF & _
									"   Case $iMsgBoxAnswer = 3 ;Abort" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = 4 ;Retry" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = 5 ;Ignore" & @CRLF & @CRLF & _
									"EndSelect"
						Else
							$MsgBox = "Dim $iMsgBoxAnswer" & @CRLF & _
									"$iMsgBoxAnswer = MsgBox(" & _SetFlag($iFlag) & "," & Chr(34) & GUICtrlRead($TITLE) & Chr(34) & "," _
									 & Chr(34) & $sText & Chr(34) & "," & GUICtrlRead($Timeout) & ")" & @CRLF & _
									"Select" & @CRLF & _
									"   Case $iMsgBoxAnswer = 3  ;Abort" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = 4  ;Retry" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = 5  ;Ignore" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = -1 ;Timeout" & @CRLF & @CRLF & _
									"EndSelect"
						EndIf

					Case $Button = $optRetryCancel
						If GUICtrlRead($Timeout) = "" Then
							$MsgBox = "Dim $iMsgBoxAnswer" & @CRLF & _
									"$iMsgBoxAnswer = MsgBox(" & _SetFlag($iFlag) & "," & Chr(34) & GUICtrlRead($TITLE) & Chr(34) & "," _
									 & Chr(34) & $sText & Chr(34) & ")" & @CRLF & _
									"Select" & @CRLF & _
									"   Case $iMsgBoxAnswer = 4 ;Retry" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = 2 ;Cancel" & @CRLF & @CRLF & _
									"EndSelect"
						Else
							$MsgBox = "Dim $iMsgBoxAnswer" & @CRLF & _
									"$iMsgBoxAnswer = MsgBox(" & _SetFlag($iFlag) & "," & Chr(34) & GUICtrlRead($TITLE) & Chr(34) & "," _
									 & Chr(34) & $sText & Chr(34) & "," & GUICtrlRead($Timeout) & ")" & @CRLF & _
									"Select" & @CRLF & _
									"   Case $iMsgBoxAnswer = 4  ;Retry" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = 2  ;Cancel" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = -1 ;Timeout" & @CRLF & @CRLF & _
									"EndSelect"
						EndIf

					Case $Button = $optCancelRetryContinue
						If GUICtrlRead($Timeout) = "" Then
							$MsgBox = "Dim $iMsgBoxAnswer" & @CRLF & _
									"$iMsgBoxAnswer = MsgBox(" & _SetFlag($iFlag) & "," & Chr(34) & GUICtrlRead($TITLE) & Chr(34) & "," _
									 & Chr(34) & $sText & Chr(34) & ")" & @CRLF & _
									"Select" & @CRLF & _
									"   Case $iMsgBoxAnswer = 2 ;Cancel" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = 10 ;Try Again" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = 11 ;Continue" & @CRLF & @CRLF & _
									"EndSelect"
						Else
							$MsgBox = "Dim $iMsgBoxAnswer" & @CRLF & _
									"$iMsgBoxAnswer = MsgBox(" & _SetFlag($iFlag) & "," & Chr(34) & GUICtrlRead($TITLE) & Chr(34) & "," _
									 & Chr(34) & $sText & Chr(34) & "," & GUICtrlRead($Timeout) & ")" & @CRLF & _
									"Select" & @CRLF & _
									"   Case $iMsgBoxAnswer = 2  ;Cancel" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = 10 ;Try Again" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = 11 ;Continue" & @CRLF & @CRLF & _
									"   Case $iMsgBoxAnswer = -1 ;Timeout" & @CRLF & @CRLF & _
									"EndSelect"
						EndIf
				EndSelect

				ClipPut($MsgBox)
		EndSelect

	WEnd
EndFunc   ;==>_Main

; ===============================================================================
;
; Function Name:    _SetFlag()
; Description:      Set the flag that indicates the type of message box and the
;                   possible button combinations.
; Parameter(s):     $iFlag        - Flag
; Requirement(s):   None
; Return Value(s):  On Success - Returns the message box flag
;                   None
; Author(s):        Giuseppe Criaco <gcriaco@quipo.it>
;
; ===============================================================================
;

Func _SetFlag($iFlag)
	$iFlag = 0

	;Icons
	Select
		Case GUICtrlRead($optWarning) = $GUI_CHECKED
			$iFlag = $iFlag + 48
		Case GUICtrlRead($optInfo) = $GUI_CHECKED
			$iFlag = $iFlag + 64
		Case GUICtrlRead($optCritical) = $GUI_CHECKED
			$iFlag = $iFlag + 16
		Case GUICtrlRead($optQuestion) = $GUI_CHECKED
			$iFlag = $iFlag + 32
	EndSelect

	;Modality
	Select
		Case GUICtrlRead($optSysModal) = $GUI_CHECKED
			$iFlag = $iFlag + 4096
		Case GUICtrlRead($optTaskModal) = $GUI_CHECKED
			$iFlag = $iFlag + 8192
	EndSelect

	;Buttons
	Select
		Case GUICtrlRead($optOkCancel) = $GUI_CHECKED
			$iFlag = $iFlag + 1
		Case GUICtrlRead($optYesNo) = $GUI_CHECKED
			$iFlag = $iFlag + 4
		Case GUICtrlRead($optYesNoCancel) = $GUI_CHECKED
			$iFlag = $iFlag + 3
		Case GUICtrlRead($optAbortRetryIgnore) = $GUI_CHECKED
			$iFlag = $iFlag + 2
		Case GUICtrlRead($optRetryCancel) = $GUI_CHECKED
			$iFlag = $iFlag + 5
		Case GUICtrlRead($optCancelRetryContinue) = $GUI_CHECKED
			$iFlag = $iFlag + 6
	EndSelect

	;Miscellaneous
	Select
		Case GUICtrlRead($optTopMost) = $GUI_CHECKED
			$iFlag = $iFlag + 262144
		Case GUICtrlRead($optRightJust) = $GUI_CHECKED
			$iFlag = $iFlag + 5244288
	EndSelect

	;Default Buttons
	Select
		Case GUICtrlRead($optSecond) = $GUI_CHECKED
			$iFlag = $iFlag + 256
		Case GUICtrlRead($optThird) = $GUI_CHECKED
			$iFlag = $iFlag + 512
	EndSelect

	Return $iFlag
EndFunc   ;==>_SetFlag
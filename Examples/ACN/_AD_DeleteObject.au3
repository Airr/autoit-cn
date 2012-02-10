#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; ɾ��AD����
; *****************************************************************************
#include  <AD.au3>
#include  <ButtonConstants.au3>
#include  <GUIConstantsEx.au3>
#include  <WindowsConstants.au3>

; ��Active Directory����
_AD_Open()

Global $iReply = msgbox(308, "Active Directory Functions", "This script deletes an AD object." & @CRLF & @CRLF & _
		"Are you sure you want to change the Active Directory?")
If $iReply <> 6 Then Exit

; ����Ҫɾ���Ķ���
#region ### START Koda GUI section ### Form=
Global $Form1 = GUICreate("Active Directory Functions", 814, 124)
GUICtrlCreateLabel("Object to delete (FQDN or sAMAcccountName):", 8, 10, 231, 17)
Global $IObject = GUICtrlCreateInput("", 241, 8, 559, 21)
Global $BOK = GUICtrlCreateButton("Delete object", 8, 72, 130, 33)
Global $BCancel = GUICtrlCreateButton("Cancel", 728, 72, 73, 33, BitOR($GUI_SS_DEFAULT_BUTTON, $BS_DEFPUSHBUTTON))
GUISetState(@SW_SHOW)
#endregion ### END Koda GUI section ###

While 1
	Global $nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE, $BCancel
			Exit
		Case $BOK
			Global $sObject = GUICtrlRead($IObject)
			ExitLoop
	EndSwitch
WEnd

; ɾ������
Global $iValue = _AD_DeleteObject($sObject, _AD_GetObjectClass( _AD_FQDNToSamAccountName($sObject)))
If $iValue = 1 Then
	msgbox(64, "Active Directory Functions", "Object'" & $sObject & "'successfully deleted")
ElseIf @error = 1 Then
	msgbox(64, "Active Directory Functions", "Object'" & $sObject & "'does not exist")
Else
	msgbox(64, "Active Directory Functions", "Return code'" & @error & "'from Active Directory")
EndIf

; �ر�Active Directory����
_AD_Close()


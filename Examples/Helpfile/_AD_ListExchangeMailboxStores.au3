#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
; *****************************************************************************
; ��ȡ����Exchange Mailbox Stores���б�
; *****************************************************************************
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

Global $aExServers = _AD_ListExchangeMailboxStores()
If @error > 0 Then
	msgbox(16, "Active Directory Functions", "Could not find any Exchange Mailbox Stores!")
Else
	_ArrayDisplay($aExServers, "Active Directory Functions - All Exchange Mailbox Stores in the Forest")
EndIf

; �ر�Active Directory����
_AD_Close()


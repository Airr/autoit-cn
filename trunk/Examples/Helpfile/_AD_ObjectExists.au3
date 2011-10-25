#AutoIt3Wrapper_AU3Check_Parameters= -d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=Y
#include  <AD.au3>

; ��Active Directory����
_AD_Open()

; *****************************************************************************
; ʾ��1 - ִ�е�ǰ�û�. ��һ����ȡ��ǰ�û���һЩ����. �ڶ�������û��ĸ�����.
; *****************************************************************************

; ��ȡ��ǰ��¼�û����Ժ󽫼���һЩ��Ϣ
Global $asProperties[8] = ["sAMAccountName", "cn", "mail", "userPrincipalName", "name", "mailNickname", "displayName", "dNSHostName"]
Global $asObjects[8], $iCount

For $iCount = 0 To UBound($asObjects) - 1
	$asObjects[$iCount] = _AD_GetObjectAttribute(@UserName, $asProperties[$iCount])
Next

; ���������ռ�����Ϣ
Global $sOutput = "Get Attributes for User:" & @UserName & @CRLF & @CRLF
For $iCount = 0 To UBound($asObjects) - 1
	If _AD_ObjectExists($asObjects[$iCount], $asProperties[$iCount]) Then
		$sOutput &= "Object'" & $asObjects[$iCount] & "'for property'" & $asProperties[$iCount] & "'exists" & @CRLF
	ElseIf @error = 1 Then
		$sOutput &= "Object'" & $asObjects[$iCount] & "'for property'" & $asProperties[$iCount] & "'does not exist" & @CRLF
	Else
		$sOutput &= "Object'" & $asObjects[$iCount] & "'for property'" & $asProperties[$iCount] & "'is not unique: >=" & @error & " records found" & @CRLF
	EndIf
Next
msgbox(64, "Active Directory Functions", $sOutput)

; *****************************************************************************

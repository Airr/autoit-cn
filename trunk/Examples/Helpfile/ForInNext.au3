;ʹ��һ������
Local $aArray[4]

$aArray[0] = "a"
$aArray[1] = 0
$aArray[2] = 1.3434
$aArray[3]="����"

Local $string = ""
For $element In $aArray
	$string = $string & $element & @CRLF
Next

MsgBox(4096,"For..IN �������","���: " & @CRLF & $string)

;ʹ��һ�����󼯺�

Local $oShell = ObjCreate("shell.application")
Local $oShellWindows = $oShell.windows

If IsObj($oShellWindows) Then
	$string = ""

	For $Window In $oShellWindows
		$string = $string & $Window.LocationName & @CRLF
	Next

  MsgBox(4096,"","���������д���:" & @CRLF & $string)
Else

  MsgBox(4096,"","��û�д���Ǵ���.")
EndIf

; ������õ�һ���������Խ���û�в���/����û�ò������Զ��庯������"Test1".
Call("Test1")

; ������õ�һ����������һ������,���������������.
Call("Test2", "���� Call() ����Ϣ!")

; ��ʾ���ʹ��һ�������������.
Global $aArgs[4]
$aArgs[0] = "CallArgArray" ; ���Ǳ����, ����, Call() ��������������Ϊһ������.
$aArgs[1] = "����һ���ַ���"	; ��һ������Ϊһ���ַ���
$aArgs[2] = 47	; �ڶ�������Ϊһ������
Global $array[2]
$array[0] = "����Ԫ�� 0"
$array[1] = "����Ԫ�� 1"
$aArgs[3] = $array	; ������Ϊһ������

; ���ǹ�����������������,���������������������
Call("Test3", $aArgs)

; ��ô����һ�������ǲ��Ǵ���.  ����ʹ������ķ���:
; ��� @error �� @extended �еĶ����ʧ��ֵ.
Local Const $sFunction = "DoesNotExist"
Call($sFunction)
If @error = 0xDEAD And @extended = 0xBEEF Then MsgBox(4096, "", "����������.")

Func Test1()
	MsgBox(4096, "", "Hello")
EndFunc   ;==>Test1

Func Test2($sMsg)
	MsgBox(4096, "", $sMsg)
EndFunc   ;==>Test2

Func Test3($sString, $nNumber, $aArray)
	MsgBox(4096, "", "�ַ���Ϊ: " & @CRLF & $sString)
	MsgBox(4096, "", "����Ϊ: "& @CRLF & $nNumber)
	For $i = 0 To UBound($aArray) - 1
		MsgBox(4096, "", "Array[" & $i & "] �������:" & @CRLF & $aArray[$i])
	Next
EndFunc   ;==>Test3

; ����û�ò������Զ��庯������"Test1".
Call("Test1")

; �����ò������Զ��庯������"Test2".
Call("Test2", "��Ϣ���Ժ������� Call()!")

; ʾ�������ʹ���ر����麯���еĲ���.
Global $aArgs[4]
$aArgs[0] = "CallArgArray" ; ���Ǳ����,���� Call() ������ʶ��������Ĳ���
$aArgs[1] = "�������ִ�"	; �ִ�����
$aArgs[2] = 47	; ����[2]��һ������
Global $array[2]
$array[0] = "����Ԫ�� 0"
$array[1] = "����Ԫ�� 1"
$aArgs[3] = $array	;����[3]��һ������

; �����Ѿ������ر������, ���ڵ����Զ��庯��"Test3"
Call("Test3", $aArgs)

; ���Ե���һ�������ڵĺ���.  ������ʾ�ʵ��Ĳ��Է���
; ��� @error �� @extended ���߶�������ʧ��ֵ.
Local Const $sFunction = "DoesNotExist"
Call($sFunction)
If @error = 0xDEAD And @extended = 0xBEEF Then MsgBox(4096, "", "����������.")

Func Test1()
	MsgBox(4096, "", "����")
EndFunc

Func Test2($sMsg)
	MsgBox(4096, "", $sMsg)
EndFunc

Func Test3($sString, $nNumber, $aArray)
	MsgBox(4096, "", "�ִ���: " & @CRLF & $sString)
	MsgBox(4096, "", "������: "& @CRLF & $nNumber)
	For $i = 0 To UBound($aArray) - 1
		MsgBox(4096, "", "����[" & $i & "] ����:" & @CRLF & $aArray[$i])
	Next
EndFunc

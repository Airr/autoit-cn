Local $attrib = FileGetAttrib(@WindowsDir & "\win.ini")
If @error Then
	MsgBox(4096,"����", "�޷��������.")
	Exit
Else
	If StringInStr($attrib, "R") Then
	MsgBox(4096,"�ļ�����", "ֻ���ļ�.")
	EndIf
EndIf

;��ʾָ���ļ����������Դ���
;��ʵ��������ÿһ����д��ĸ��Ψһ��

Local $input = StringSplit("R,A,S,H,N,D,O,C,T", ",")
Local $output = StringSplit("ֻ�� /, �浵 /, ϵͳ /, ���� /" & _
		", ��ͨ /, Ŀ¼ /, �ѻ��ļ� /, ѹ�� /, ��ʱ /",  ",")
For $i = 1 To 9
	$attrib = StringReplace($attrib, $input[$i], $output[$i], 0, 1)
	;StringReplace ���һ��������ָ ���ִ�Сд
Next
$attrib = StringTrimRight($attrib, 2) ;�Ƴ���б��
MsgBox(0,"�������ļ�����:", $attrib)

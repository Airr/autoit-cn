$attrib = FileGetAttrib("c:\boot.ini")
If @error Then
	MsgBox(4096,"����", "�޷��������.")
	Exit
Else
	If StringInStr($attrib, "R") Then
	MsgBox(0,"�ļ�����", "ֻ���ļ�.")
	EndIf
EndIf

; ���ı���ʽ��ʾȫ��������Ϣ
; ��������ÿ����д��ĸ��Ψһ��
; ��ϰ��Ϣ�ִ�����ι�����...
$input = StringSplit("R,A,S,H,N,D,O,C,T",",")
$output = StringSplit("ֻ���ļ� /, �浵�ļ� /, ϵͳ�ļ� /, �����ļ� /" & _
		", ��ͨ�ļ� /, Ŀ¼�ļ� /, �ѻ��ļ� /, ѹ���ļ� /, ��ʱ�ļ� /",  ",")
For $i = 1 to 9
	$attrib = StringReplace($attrib, $input[$i], $output[$i], 0, 1)
	; �� StringReplace �����һ��������ν�ŷ�����������
Next
$attrib = StringTrimRight($attrib, 2) ;�Ƴ���βб��
MsgBox(0,"�������ļ�����:", $attrib)

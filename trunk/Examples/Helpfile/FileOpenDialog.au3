$message = "���� Ctrl �� Shift ��ѡ�����ļ�."

$var = FileOpenDialog($message, @WindowsDir & "\", "ͼ���ļ� (*.jpg;*.bmp)", 1 + 4 )

If @error Then
	MsgBox(4096,"","û��ѡ���ļ�!")
Else
	$var = StringReplace($var, "|", @CRLF)
	MsgBox(4096,"","��ѡ����:" & $var)
EndIf


; ��ɸѡ��
$message = "���� Ctrl �� Shift ��ѡ�����ļ�."

$var = FileOpenDialog($message, @WindowsDir & "", "ͼ�� (*.jpg;*.bmp)|��Ƶ (*.avi;*.mpg)", 1 + 4 )

If @error Then
	MsgBox(4096,"","û��ѡ���ļ�!")
Else
	$var = StringReplace($var, "|", @CRLF)
	MsgBox(4096,"","��ѡ����:" & $var)
EndIf


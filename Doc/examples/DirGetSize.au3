$size = DirGetSize(@HomeDrive)
Msgbox(0,"","��С(MB) :" & Round($size / 1024 / 1024))

$size = DirGetSize(@WindowsDir, 2)
Msgbox(0,"","��С(MB) :" & Round($size / 1024 / 1024))

$timer	= TimerInit()
$size	= DirGetSize("\\10.0.0.1\h$",1);��������һ����ʵ·��
$diff	= Round(TimerDiff($timer) / 1000)	; �����ʱ
If IsArray($size) Then
	Msgbox(0,"DirGetSize-��Ϣ","��С(�ֽ�):" & $size[0] & @LF _
		& "�ļ�:" & $size[1] & @LF & "�ļ���:" & $size[2] & @LF _
		& "��ʱ(��):" & $diff)
EndIf
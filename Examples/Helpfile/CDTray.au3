;ʾ�� 1 �������������� E: �̵Ĺ�������
CDTray("E:", "open")

;ʾ�� 2 ����ȫ�������������Ĺ�������
$var = DriveGetDrive( "CDROM" )
If NOT @error Then
    For $i = 1 to $var[0]
		CDTray($var[$i], "open")
    Next
EndIf
$p	= DllStructCreate("dword dwOSVersionInfoSize;dword dwMajorVersion;dword dwMinorVersion;dword dwBuildNumber;dword dwPlatformId;char szCSDVersion[128]")

;���� p->dwOSVersionInfoSize = sizeof(OSVERSIONINFO)
DllStructSetData($p, "dwOSVersionInfoSize", DllStructGetSize($p))

;���� Dll ����
$ret = DllCall("kernel32.dll","int","GetVersionEx","ptr",DllStructGetPtr($p))

if Not $ret[0] Then
	MsgBox(0,"Dll���ô���","Dll����ʧ��")
	exit
EndIf

;��ȡ����ֵ
$major		= DllStructGetData($p,"dwMajorVersion")
$minor		= DllStructGetData($p,"dwMinorVersion")
$build		= DllStructGetData($p,"dwBuildNumber")
$platform	= DllStructGetData($p,"dwPlatformId")
$version	= DllStructGetData($p,"szCSDVersion")

;�ͷ� struct
$p =0

msgbox(0,"","�ص�: " & $major & @CRLF & _
			"��Ҫ: " & $minor & @CRLF & _
			"����: " & $build & @CRLF & _
			"����ƽ̨ ID: " & $platform & @CRLF & _
			"�������汾: " & $version)


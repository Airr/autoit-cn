$p	= DllStructCreate("dword dwOSVersionInfoSize;dword dwMajorVersion;dword dwMinorVersion;dword dwBuildNumber;dword dwPlatformId;char szCSDVersion[128]")

;������Ϊ����(C++��ʽ): p->dwOSVersionInfoSize = sizeof(OSVERSIONINFO)
DllStructSetData($p, "dwOSVersionInfoSize", DllStructGetSize($p))

;���� DllCall
$ret = DllCall("kernel32.dll","int","GetVersionEx","ptr",DllStructGetPtr($p))

if Not $ret[0] Then
	MsgBox(0,"DllCall ����","DllCall ʧ��")
	exit
EndIf

;��ȡ����ֵ
$major		= DllStructGetData($p,"dwMajorVersion")
$minor		= DllStructGetData($p,"dwMinorVersion")
$build		= DllStructGetData($p,"dwBuildNumber")
$platform	= DllStructGetData($p,"dwPlatformId")
$version	= DllStructGetData($p,"szCSDVersion")

;�ͷ����ݽṹ��ռ�ڴ�
$p =0

msgbox(0,"","Major: " & $major & @CRLF & _
			"Minor: " & $minor & @CRLF & _
			"Build: " & $build & @CRLF & _
			"Platform ID: " & $platform & @CRLF & _
			"Version: " & $version)


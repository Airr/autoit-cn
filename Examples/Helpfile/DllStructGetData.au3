Local $p = DllStructCreate("dword dwOSVersionInfoSize;dword dwMajorVersion;dword dwMinorVersion;dword dwBuildNumber;dword dwPlatformId;char szCSDVersion[128]")

;������Ϊ����(C++��ʽ): p->dwOSVersionInfoSize = sizeof(OSVERSIONINFO)
DllStructSetData($p, "dwOSVersionInfoSize", DllStructGetSize($p))

;���� DllCall
Local $ret = DllCall("kernel32.dll", "int", "GetVersionEx", "ptr", DllStructGetPtr($p))

If Not $ret[0] Then
	MsgBox(0,"DllCall ����","DllCall ʧ��")
	Exit
EndIf

;��ȡ����ֵ
Local $major = DllStructGetData($p, "dwMajorVersion")
Local $minor = DllStructGetData($p, "dwMinorVersion")
Local $build = DllStructGetData($p, "dwBuildNumber")
Local $platform = DllStructGetData($p, "dwPlatformId")
Local $version = DllStructGetData($p, "szCSDVersion")

;�ͷ����ݽṹ��ռ�ڴ�
$p = 0

MsgBox(0, "", "Major: " & $major & @CRLF & _
		"Minor: " & $minor & @CRLF & _
		"Build: " & $build & @CRLF & _
		"Platform ID: " & $platform & @CRLF & _
		"Version: " & $version)


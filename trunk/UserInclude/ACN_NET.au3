#include-once
#include <ie.au3>
;======================================================
;
; ��������:		_Thunder($url,$Filename,$Path,$comment,$ReferUrl,$startmode,$Orgin,$OrginThread)
; ��ϸ��Ϣ:		����Ѹ������
; $Url:			���ص�ַ
; $Filename:	������ļ���
; $Path:		�����·��
; $comment:		��������ע��
; $ReferUrl:	���õ�URL
; $startmode:	��ʼģʽ,True(����)/False(�ֶ�)
; $Orgin:		ֻ��ԭʼ��ַ����(True/False)
; $OrginThread: ��ԭʼ��ַ�����߳���
; ����ֵ :		ʧ�ܷ���0,�ɹ�����1
; ����:			thesnow(rundll32@126.com)
;
;======================================================
Func _Thunder($Url, $Filename = "", $Path = "", $comment = "", $ReferUrl = "", $startmode = True, $Orgin = False, $OrginThread = 10)
	$obj = ObjCreate("ThunderAgent.Agent")
	If IsObj($obj) = 0 Then Return 0
	$obj.AddTask($Url, $Filename, $Path, $comment, $ReferUrl, $startmode, $Orgin, $OrginThread);�����������
	$obj.CommitTasks() ;�ύ����.
	Return 1
EndFunc   ;==>_Thunder

;======================================================
;
; ��������:		_Flashget($url,$Path,$flashgetpath)
; ��ϸ��Ϣ:		�������ʿ쳵����
; $url:			���ص�ַ
; $Path:		�����·��
; $flashgetpath:���ʿ쳵��·��
; ����ֵ :		ʧ�ܷ���0(���ʿ쳵δ��װ),�ɹ�����1
; ����:			thesnow(rundll32@126.com)
;
;======================================================
Func _Flashget($Url, $Path = "", $flashgetpath = "")
	If $flashgetpath = "" Then
		$flashgetpath = RegRead("HKEY_CURRENT_USER\Software\FlashGetX\General", "AppPath")
		If $flashgetpath = "" Then
			$flashgetpath = RegRead("HKEY_CURRENT_USER\Software\FlashGet\General", "AppPath")
		EndIf
		If $flashgetpath = "" Then Return 0
	EndIf
	ShellExecute($flashgetpath, $Url & " " & $Path)
	Return 1
EndFunc   ;==>_Flashget


;======================================================
;
; ��������:        _CMD_SetLocalIP("��������","IP��ַ",["��������"],["Ĭ������"],["DNS"])
; ��ϸ��Ϣ:        ����IP��ַ.
; $ConName:        ��������
; $IpADD:          IP��ַ
; $SubMask:        ��������
; $GateWay:        Ĭ������
; $ConDNS:         DNS(��������)
; ����:            thesnow(rundll32@126.com)
;
;======================================================
Func _CMD_SetLocalIP($ConName, $IpADD, $SubMask, $GateWay, $ConDNS)
	If $SubMask = "" Then $SubMask = "255.255.255.0"
	If $ConName = "" And $IpADD <> "" Then
		RunWait(@ComSpec & ' /C netsh -c interface ip set address "��������" static ' & $IpADD & " " & $SubMask & " " & $GateWay, "", @SW_HIDE)
	EndIf
	If $ConName <> "" And $IpADD <> "" Then
		RunWait(@ComSpec & ' /C netsh -c interface ip set address ' & '"' & $ConName & '"' & ' static ' & $IpADD & " " & $SubMask & " " & $GateWay, "", @SW_HIDE)
	EndIf
	If $ConDNS <> "" Then
		RunWait(@ComSpec & ' /C netsh -c interface ip set dns ' & '"' & $ConName & '"' & ' static ' & $ConDNS & ' primary', "", @SW_HIDE)
	EndIf
EndFunc   ;==>_CMD_SetLocalIP


;======================================================
;
; ��������:		_API_Get_NetworkAdapterMAC ($sIP)
; ��ϸ��Ϣ:		����API�õ�MAC.
; thesnow��ע:	�˺����ǲ��÷���ARP��ʽ,����д����·�ɰ󶨻򽻻�����.���ܵõ������MAC.
; $sIP:         IP��ַ
; ����:         jiexunpc
;
;======================================================
Func _API_Get_NetworkAdapterMAC($sIP)
	Local $MAC, $MACSize
	Local $i, $s, $r, $iIP

	$MAC = DllStructCreate("byte[6]")
	$MACSize = DllStructCreate("int")

	DllStructSetData($MACSize, 1, 6)
	$r = DllCall("Ws2_32.dll", "int", "inet_addr", "str", $sIP)
	$iIP = $r[0]
	$r = DllCall("iphlpapi.dll", "int", "SendARP", "int", $iIP, "int", 0, "ptr", DllStructGetPtr($MAC), "ptr", DllStructGetPtr($MACSize))
	$s = ""
	For $i = 0 To 5
		If $i Then $s = $s & ":"
		$s = $s & Hex(DllStructGetData($MAC, 1, $i + 1), 2)
	Next
	Return $s
EndFunc   ;==>_API_Get_NetworkAdapterMAC


;======================================================
;
; ��������:        _NetworkGetInternetIP
; ��ϸ��Ϣ:        �õ�����IP��ַ.
; ����:            pcbar
;
;======================================================
Func _NetworkGetInternetIP()
	;by pcbar
	$oie = _IECreate("http://www.net.cn/static/customercare/yourIP.asp", 0, 0, 1, -1)
	$sText = _IEBodyReadText($oie)
	$ttext = StringRegExp($sText, '((2[0-4]\d|25[0-5]|[01]?\d\d?)\.){3}(2[0-4]\d|25[0-5]|[01]?\d\d?)', 2)
	_IEQuit($oie)
	If IsArray($ttext) Then
		Return $ttext[0]
	Else
		SetError(1)
		Return 0
	EndIf
EndFunc   ;==>_NetworkGetInternetIP


;======================================================
;
; ��������:        _NetworkAdapterInfo()
; ��ϸ��Ϣ:        ���������Ϣ
; ����ֵ˵��:
; �Զ�ά���鷽ʽ����.���� $info=_NetworkAdapterInfo()
; $info[0][0]=��������
; $info[1][0]��һ�������ı�־1
; $info[2][0]�ڶ��������ı�־2
; $info[1][1]��һ����������������
; $info[2][1]�ڶ�����������������
; $info[1][2]��һ��������Ĭ������
; $info[1][3]��һ��������DNS��������(��������)
; $info[1][4]��һ��������IP��ַ
; $info[1][5]��һ����������DNS
; $info[1][6]��һ�������Ĵ�DNS
; $info[1][7]��һ����������������
; $info[1][8]��һ��������MAC��ַ
; $info[1][9]��һ����������������
; ע�⣬��UDF�����ȡ�Ѿ����õ�������
; �������Ҫ����ɾ��' WHERE IPEnabled != 0'��' WHERE NetConnectionStatus >0'
; ����:            thesnow(rundll32@126.com)
;
;======================================================
Func _NetworkAdapterInfo()
	Local $colItems = ""
	Local $objWMIService
	Local $NetworkAdapterID = 0
	Local $NetworkAdapterName = ""
	Local $NetworkAdapterGateway = ""
	Local $NetworkAdapterHostName = ""
	Local $NetworkAdapterIPaddress = ""
	Local $NetworkAdapterDNS1 = ""
	Local $NetworkAdapterDNS2 = ""
	Local $NetworkAdapterSubnet = ""
	Local $NetworkAdapterMAC = ""
	Local $NetworkAdapterNetConnectionID = ""
	Local $NetworkAdapterInfo[10][10] ;���10������.
	$NetworkAdapterInfo[0][0] = 0
	$objWMIService = ObjGet("winmgmts:\\localhost\root\CIMV2")
	$colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled != 0", "WQL", 0x10 + 0x20)
	$colItem2 = $objWMIService.ExecQuery('SELECT * FROM Win32_NetworkAdapter WHERE NetConnectionStatus >0', "WQL", 0x10 + 0x20)
	If IsObj($colItems) Then
		For $objItem In $colItems
			$NetworkAdapterName = $objItem.Description
			$NetworkAdapterGateway = $objItem.DefaultIPGateway(0)
			$NetworkAdapterHostName = $objItem.DNSHostName
			$NetworkAdapterIPaddress = $objItem.IPAddress(0)
			$NetworkAdapterDNS1 = $objItem.DNSServerSearchOrder(0)
			$NetworkAdapterDNS2 = $objItem.DNSServerSearchOrder(1)
			$NetworkAdapterSubnet = $objItem.IPSubnet(0)
			$NetworkAdapterMAC = $objItem.MACAddress
			$NetworkAdapterID += 1
			$NetworkAdapterInfo[0][0] = $NetworkAdapterID
			$NetworkAdapterInfo[$NetworkAdapterID][0] = $NetworkAdapterID
			$NetworkAdapterInfo[$NetworkAdapterID][1] = $NetworkAdapterName
			$NetworkAdapterInfo[$NetworkAdapterID][2] = $NetworkAdapterGateway
			$NetworkAdapterInfo[$NetworkAdapterID][3] = $NetworkAdapterHostName
			$NetworkAdapterInfo[$NetworkAdapterID][4] = $NetworkAdapterIPaddress
			$NetworkAdapterInfo[$NetworkAdapterID][5] = $NetworkAdapterDNS1
			$NetworkAdapterInfo[$NetworkAdapterID][6] = $NetworkAdapterDNS2
			$NetworkAdapterInfo[$NetworkAdapterID][7] = $NetworkAdapterSubnet
			$NetworkAdapterInfo[$NetworkAdapterID][8] = $NetworkAdapterMAC
		Next
	Else
		Return $NetworkAdapterInfo
	EndIf

	If IsObj($colItem2) Then
		$NetworkAdapterID = 0
		For $objItem2s In $colItem2
			$NetworkAdapterNetConnectionID = $objItem2s.NetConnectionID
			$NetworkAdapterID += 1
			$NetworkAdapterInfo[$NetworkAdapterID][9] = $NetworkAdapterNetConnectionID
		Next
		Return $NetworkAdapterInfo
	Else
		Return $NetworkAdapterInfo
	EndIf
EndFunc   ;==>_NetworkAdapterInfo

;======================================================
;
; ��������:		_WMI_SetNetworkAdapterInfo($HostName, $IpAdd, $SubMask, $GateWay, $DNS1, $DNS2, $IPX)
; ��ϸ��Ϣ:		����IP��ַ.
; $HostName:	���������
; $IpAdd:		IP��ַ
; $SubMask:		��������
; $GateWay:		Ĭ������
; $DNS1:		��DNS(��������)
; $DNS2:		��DNS(��������)
; $IPX:			IPX���������
; ����:			thesnow(rundll32@126.com)
;
;======================================================

Func _WMI_SetNetworkAdapterInfo($HostName, $IpADD, $SubMask, $GateWay, $DNS1, $DNS2, $IPX)
	Dim $SetDns[2], $SetIPAddress[1], $SetSubnetmask[1], $SetGateway[1]
	$SetDns[0] = $DNS1
	$SetDns[1] = $DNS2
	$SetIPAddress[0] = $IpADD
	$SetSubnetmask[0] = $SubMask
	$SetGateway[0] = $GateWay
	$objWMIService = ObjGet("winmgmts:\\localhost\root\CIMV2")
	$colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled = TRUE", "WQL", 0x10 + 0x20)
	$colComputers = $objWMIService.ExecQuery("Select * from Win32_ComputerSystem")
	$objNetworkSettings = $objWMIService.Get("Win32_NetworkAdapterConfiguration")
	For $objNetAdapter In $colComputers
		$objNetAdapter.Rename($HostName)
	Next
	If IsObj($colItems) Then
		For $objNetAdapter In $colItems
			$objNetAdapter.EnableStatic($SetIPAddress, $SetSubnetmask)
			$objNetAdapter.SetGateways($SetGateway)
			$objNetAdapter.SetDNSServerSearchOrder($SetDns)
		Next
	EndIf
	$objNetworkSettings.SetIPXVirtualNetworkNumber($IPX)
EndFunc   ;==>_WMI_SetNetworkAdapterInfo

;===============================================================================
;
; Function Name:    _FTPOpen()
; Description:      ��һ��FTP�Ự.
; Parameter(s):     $s_Agent      	- ��������. ( ���� "myftp" )
;                   $l_AccessType 	- ���ӷ�ʽ(
;									- 0,ʹ��IE����������,
;									- 1,ֱ�����ӵ�������,
;									- 3,ͨ�������������������)
;                   $s_ProxyName  	- �����������.
;                   $s_ProxyBypass	- �����������ַ.
;                   $l_Flags       	- ������(һ��Ϊ0).
; Requirement(s):   DllCall, wininet.dll
; Return Value(s):  �ɹ� - ����һ����ʶ��.
;                   ʧ�� - ����0������@ERROR = -1
; Author(s):        Wouter van Kesteren.
;
;===============================================================================

Func _FTPOpen($s_Agent, $l_AccessType = 1, $s_ProxyName = '', $s_ProxyBypass = '', $l_Flags = 0)
	
	Local $ai_InternetOpen = DllCall('wininet.dll', 'long', 'InternetOpen', 'str', $s_Agent, 'long', $l_AccessType, 'str', $s_ProxyName, 'str', $s_ProxyBypass, 'long', $l_Flags)
	If @error OR $ai_InternetOpen[0] = 0 Then
		SetError(-1)
		Return 0
	EndIf
		
	Return $ai_InternetOpen[0]
	
EndFunc ;==> _FTPOpen()

;===============================================================================
;
; Function Name:    _FTPConnect()
; Description:      ���ӵ�һ��FTP������.
; Parameter(s):     $l_InternetSession	- ��_FTPOpen()���صĻỰ��ʶ��.
;                   $s_ServerName 		- ��������ַ��IP.
;                   $s_Username  		- �û���.
;                   $s_Password			- ����.
;                   $i_ServerPort  		- �������˿� ( 0 Ĭ�ϵ���21�˿� )
;					$l_Service			- ����������(
;										- 1,FTP.
;										- 3,HTTP)
;					$l_Flags			- �����־.
;					$l_Context			- ������ID.
; Requirement(s):   DllCall, wininet.dll
; Return Value(s):  �ɹ� - ����һ����ʶ��.
;                   ʧ�� - ����0������@ERROR = -1
; Author(s):        Wouter van Kesteren
;
;===============================================================================

Func _FTPConnect($l_InternetSession, $s_ServerName, $s_Username, $s_Password, $i_ServerPort = 0, $l_Service = 1, $l_Flags = 0, $l_Context = 0)
	
	Local $ai_InternetConnect = DllCall('wininet.dll', 'long', 'InternetConnect', 'long', $l_InternetSession, 'str', $s_ServerName, 'int', $i_ServerPort, 'str', $s_Username, 'str', $s_Password, 'long', $l_Service, 'long', $l_Flags, 'long', $l_Context)
	If @error OR $ai_InternetConnect[0] = 0 Then
		SetError(-1)
		Return 0
	EndIf
			
	Return $ai_InternetConnect[0]
	
EndFunc ;==> _FTPConnect()

;===============================================================================
;
; Function Name:    _FTPPutFile()
; Description:      �ϴ�һ���ļ���FTP������.
; Parameter(s):     $l_FTPSession	- ��_FTPConnect()���صĻỰ��ʶ��.
;                   $s_LocalFile 	- �����ļ�.
;                   $s_RemoteFile  	- Զ���ļ�.
;                   $l_Flags		- �����־.
;                   $l_Context  	- ������ID.
; Requirement(s):   DllCall, wininet.dll
; Return Value(s):  �ɹ� - ����1
;                   ʧ�� - ����0������@ERROR = -1
; Author(s):        Wouter van Kesteren
;
;===============================================================================

Func _FTPPutFile($l_FTPSession, $s_LocalFile, $s_RemoteFile, $l_Flags = 0, $l_Context = 0)

	Local $ai_FTPPutFile = DllCall('wininet.dll', 'int', 'FtpPutFile', 'long', $l_FTPSession, 'str', $s_LocalFile, 'str', $s_RemoteFile, 'long', $l_Flags, 'long', $l_Context)
	If @error OR $ai_FTPPutFile[0] = 0 Then
		SetError(-1)
		Return 0
	EndIf
	
	Return $ai_FTPPutFile[0]
	
EndFunc ;==> _FTPPutFile()

;===============================================================================
;
; Function Name:    _FTPDelFile()
; Description:      ��FTP��������ɾ��һ���ļ�.
; Parameter(s):     $l_FTPSession	- ��_FTPConnect()���صĻỰ��ʶ��.
;                   $s_RemoteFile  	- Զ���ļ�.
; Requirement(s):   DllCall, wininet.dll
; Return Value(s):  �ɹ� - ����1
;                   ʧ�� - ����0������@ERROR = -1
; Author(s):        Wouter van Kesteren
;
;===============================================================================

Func _FTPDelFile($l_FTPSession, $s_RemoteFile)
	
	Local $ai_FTPPutFile = DllCall('wininet.dll', 'int', 'FtpDeleteFile', 'long', $l_FTPSession, 'str', $s_RemoteFile)
	If @error OR $ai_FTPPutFile[0] = 0 Then
		SetError(-1)
		Return 0
	EndIf
	
	Return $ai_FTPPutFile[0]
	
EndFunc ;==> _FTPDelFile()

;===============================================================================
;
; Function Name:    _FTPRenameFile()
; Description:      ������FTP�������ϵ��ļ�.
; Parameter(s):     $l_FTPSession	- ��_FTPConnect()���صĻỰ��ʶ��.
;                   $s_Existing 	- ԭ�ļ���.
;                   $s_New  		- ���ļ���.
; Requirement(s):   DllCall, wininet.dll
; Return Value(s):  �ɹ� - ����1
;                   ʧ�� - ����0������@ERROR = -1
; Author(s):        Wouter van Kesteren
;
;===============================================================================

Func _FTPRenameFile($l_FTPSession, $s_Existing, $s_New)
	
	Local $ai_FTPRenameFile = DllCall('wininet.dll', 'int', 'FtpRenameFile', 'long', $l_FTPSession, 'str', $s_Existing, 'str', $s_New)
	If @error OR $ai_FTPRenameFile[0] = 0 Then
		SetError(-1)
		Return 0
	EndIf
	
	Return $ai_FTPRenameFile[0]
	
EndFunc ;==> _FTPRenameFile()

;===============================================================================
;
; Function Name:    _FTPMakeDir()
; Description:      ��FTP���������½�һ��Ŀ¼.
; Parameter(s):     $l_FTPSession	- ��_FTPConnect()���صĻỰ��ʶ��.
;                   $s_Remote 		- Ҫ������Ŀ¼��.
; Requirement(s):   DllCall, wininet.dll
; Return Value(s):  �ɹ� - ����1
;                   ʧ�� - ����0������@ERROR = -1
; Author(s):        Wouter van Kesteren
;
;===============================================================================

Func _FTPMakeDir($l_FTPSession, $s_Remote)
	
	Local $ai_FTPMakeDir = DllCall('wininet.dll', 'int', 'FtpCreateDirectory', 'long', $l_FTPSession, 'str', $s_Remote)
	If @error OR $ai_FTPMakeDir[0] = 0 Then
		SetError(-1)
		Return 0
	EndIf
	
	Return $ai_FTPMakeDir[0]
	
EndFunc ;==> _FTPMakeDir()

;===============================================================================
;
; Function Name:    _FTPDelDir()
; Description:      ɾ��FTP�������ϵ�һ��Ŀ¼.
; Parameter(s):     $l_FTPSession	- ��_FTPConnect()���صĻỰ��ʶ��.
;                   $s_Remote 		- Ҫɾ����Ŀ¼��.
; Requirement(s):   DllCall, wininet.dll
; Return Value(s):  �ɹ� - ����1
;                   ʧ�� - ����0������@ERROR = -1
; Author(s):        Wouter van Kesteren
;
;===============================================================================

Func _FTPDelDir($l_FTPSession, $s_Remote)
	
	Local $ai_FTPDelDir = DllCall('wininet.dll', 'int', 'FtpRemoveDirectory', 'long', $l_FTPSession, 'str', $s_Remote)
	If @error OR $ai_FTPDelDir[0] = 0 Then
		SetError(-1)
		Return 0
	EndIf
		
	Return $ai_FTPDelDir[0]
	
EndFunc ;==> _FTPDelDir()

;===============================================================================
;
; Function Name:    _FTPClose()
; Description:      �ر�FTP�Ự.
; Parameter(s):     $l_InternetSession	- ��_FTPOpen()���صĻỰ��ʶ��.
; Requirement(s):   DllCall, wininet.dll
; Return Value(s):  �ɹ� - ����1
;                   ʧ�� - ����0������@ERROR = -1
; Author(s):        Wouter van Kesteren
;
;===============================================================================

Func _FTPClose($l_InternetSession)
	
	Local $ai_InternetCloseHandle = DllCall('wininet.dll', 'int', 'InternetCloseHandle', 'long', $l_InternetSession)
	If @error OR $ai_InternetCloseHandle[0] = 0 Then
		SetError(-1)
		Return 0
	EndIf
	
	Return $ai_InternetCloseHandle[0]
	
EndFunc ;==> _FTPClose()
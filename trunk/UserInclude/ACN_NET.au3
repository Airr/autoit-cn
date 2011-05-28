#include-once
#include <ACN_HASH.au3>
; #INDEX# =======================================================================================================================
; Title .........: ACN_NET
; AutoIt Version: 3.2.13++
; Language:       English
; Description:    Functions that assist with network.
; ===============================================================================================================================



; #VARIABLES# ===================================================================================================================
; ==============================================================================================================================
; #CURRENT# =====================================================================================================================
; _Thunder
; _Flashget
; _CMD_SetLocalIP
; _API_Get_NetworkAdapterMAC
; _NetworkGetInternetIP
; _InetIsOffline()
; _NetworkAdapterInfo
; _WMI_SetNetworkAdapterInfo


;==============================================================================================================================

; #INTERNAL_USE_ONLY#============================================================================================================
;==============================================================================================================================

; #FUNCTION# ====================================================================================================================
; Name...........: _Thunder
; Description ...: ����Ѹ������
; Syntax.........: _Thunder($url[, $Filename[, $Path[, $comment[, $ReferUrl[, $startmode[, $Orgin[, $OrginThread]]]]]]])
; Parameters ....: 	$url          - ���ص�ַ
; 					$Filename:	  - ������ļ���
; 					$Path:		  - �����·��
; 					$comment:	  - ��������ע��
; 					$ReferUrl:	  - ���õ�URL
; 					$startmode:	  - ��ʼģʽ,True(����)/False(�ֶ�)
; 					$Orgin:		  - ֻ��ԭʼ��ַ����(True/False)
; 					$OrginThread: - ��ԭʼ��ַ�����߳���
; Return values .: �ɹ�  - ����1
;                  ʧ��  - ����0
; Author ........: thesnoW(rundll32@126.com)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _Thunder($Url, $Filename = "", $Path = "", $comment = "", $ReferUrl = "", $startmode = True, $Orgin = False, $OrginThread = 10)
	Local $obj = ObjCreate("ThunderAgent.Agent")
	If IsObj($obj) = 0 Then Return 0
	$obj.AddTask($Url, $Filename, $Path, $comment, $ReferUrl, $startmode, $Orgin, $OrginThread);�����������
	$obj.CommitTasks() ;�ύ����.
	Return 1
EndFunc   ;==>_Thunder

; #FUNCTION# ====================================================================================================================
; Name...........: _Flashget
; Description ...: �������ʿ쳵����
; Syntax.........: _Flashget($url[, $Path[, $flashgetpath]])
; Parameters ....: 	$url          - ���ص�ַ
; 					$Path:		  - �����·��
; 					$flashgetpath:- ���ʿ쳵��·��
; Return values .: �ɹ�  - ����1
;                  ʧ��  - ����0,���ʿ쳵δ��װ
; Author ........: thesnoW(rundll32@126.com)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _Flashget($url, $Path = "", $flashgetpath = "")
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

; #FUNCTION# ====================================================================================================================
; Name...........: _CMD_SetLocalIP
; Description ...: ����IP��ַ.
; Syntax.........: _CMD_SetLocalIP("��������","IP��ַ",["��������"[, "Ĭ������"[, "DNS"]]])
; Parameters ....: 	$ConName          - ��������
; 					$IpADD:          IP��ַ
; 					$SubMask:        ��������
; 					$GateWay:        Ĭ������
; 					$ConDNS:         DNS(��������)
; Return values .: none
; Author ........: thesnoW(rundll32@126.com)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================

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

; #FUNCTION# ====================================================================================================================
; Name...........: _NetworkGetInternetIP
; Description ...: �õ�����IP��ַ.
; Syntax.........: _NetworkGetInternetIP()
; Parameters ....: 
; Return values .: 	�ɹ� - ���ع���IP
;					ʧ�� - ���� 0.0.0.0 ,�������޷�������������ȡ��IP�ĵ�ַ�ѹ�.
; Author ........: Sxd
; Modified.......:
; Remarks .......: �˺����ǲ���http://www.aamailsoft.com/getip.php������,����֤������Ч.
; Related .......:
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
Func _NetworkGetInternetIP()
	Local $ip
	 $ip=InetRead("http://www.aamailsoft.com/getip.php",1)
	 $ip=BinaryToString($ip)
	If	StringStripWS($ip,8) <> "" Then
		Return $ip
	Else
		Return "0.0.0.0"
	EndIf
EndFunc   ;==>_NetworkGetInternetIP

; #FUNCTION# ====================================================================================================================
; Name...........: _API_Get_NetworkAdapterMAC
; Description ...: ����API�õ�MAC.
; Syntax.........: _API_Get_NetworkAdapterMAC($sIP)
; Parameters ....: 	$sIP          - IP��ַ
; Return values .: 	�ɹ� - ����MAC��ַ
;					ʧ�� - ���� 00:00:00:00:00:00
; Author ........: jiexunpc
; Modified.......:
; Remarks .......: �˺����ǲ��÷���ARP��ʽ,����д����·�ɰ󶨻򽻻�����.���ܵõ������MAC.
; Related .......:
; Link ..........;
; Example .......; Yes
; ===============================================================================================================================
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



; #FUNCTION# ====================================================================================================================
; Name...........: _InetIsOffline
; Description ...: �������Ƿ�����
; Syntax.........: _InetIsOffline()
; Parameters ....: 
; Return values .: 	�ɹ� - ���� 1
;					ʧ�� - ���� 0
; Author ........: thesnoW(rundll32@126.com)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........; http://msdn.microsoft.com/en-us/library/bb776460(VS.85).aspx
; Example .......; Yes
; ===============================================================================================================================
Func _InetIsOffline()
		Return DllCall("url.dll","bool","InetIsOffline","DWORD",0)
EndFunc

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
	Local $colItem2 = $objWMIService.ExecQuery('SELECT * FROM Win32_NetworkAdapter WHERE NetConnectionStatus >0', "WQL", 0x10 + 0x20)
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
	Local $objWMIService = ObjGet("winmgmts:\\localhost\root\CIMV2")
	Local $colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled = TRUE", "WQL", 0x10 + 0x20)
	Local $colComputers = $objWMIService.ExecQuery("Select * from Win32_ComputerSystem")
	Local $objNetworkSettings = $objWMIService.Get("Win32_NetworkAdapterConfiguration")
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


Func ThunderLinkEnc($Url)
	Local $Encrypt = _Base64Encode("AA" & $Url & "ZZ")
	Return 'thunder://' & $Encrypt
EndFunc

Func ThunderLinkDec($Url)
	$Url = StringReplace($Url,'thunder://','')
	$Url = _Base64Decode($Url)
	$Url = BinaryToString($Url)
	$Url = StringTrimLeft($Url,2)
	$Url = StringTrimRight($Url,2)
	Return $Url
EndFunc

Func FlashGetLinkEnc($Url)
	Local $Encrypt = _Base64Encode("[FLASHGET]" & $Url & "[FLASHGET]")
	Return 'FlashGet://' & $Encrypt & '&'
EndFunc

Func FlashGetLinkDec($Url)
	$Url = StringReplace($Url,'FlashGet://','')
	$Url = StringTrimRight($Url,(StringLen($Url)-StringInStr($Url,'&',-1)))
	$Url = _Base64Decode($Url)
	$Url = BinaryToString($Url)
	$Url = StringTrimLeft($Url,10)
	$Url = StringTrimRight($Url,10)
	Return $Url
EndFunc

Func QQdlLinkEnc($Url)
	Local $Encrypt = _Base64Encode($Url)
	Return 'qqdl://' & $Encrypt
EndFunc

Func QQdlLinkDec($Url)
	$Url = StringReplace($Url,'qqdl://','')
	$Url = _Base64Decode($Url)
	$Url = BinaryToString($Url)
	Return $Url
EndFunc
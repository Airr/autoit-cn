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
	$obj.AddTask ($Url, $Filename, $Path, $comment, $ReferUrl, $startmode, $Orgin, $OrginThread);�����������
	$obj.CommitTasks (1) 	;�ύ����.
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
Func _CMD_SetLocalIP($ConName,$IpADD,$SubMask,$GateWay,$ConDNS)
        if $SubMask="" Then $SubMask="255.255.255.0"
        if $ConName="" And $IpADD <> "" Then
                RunWait(@ComSpec & ' /C netsh -c interface ip set address "��������" static ' & $IpADD & " " & $SubMask & " " & $GateWay,"",@SW_HIDE)
        EndIf
        if $ConName <> "" And $IpADD <> "" Then
                RunWait(@ComSpec & ' /C netsh -c interface ip set address '& '"' & $ConName & '"' & ' static ' & $IpADD & " " & $SubMask & " " & $GateWay,"",@SW_HIDE)
        EndIf
        if $ConDNS <> "" Then
                RunWait(@ComSpec & ' /C netsh -c interface ip set dns '& '"' & $ConName & '"' & ' static ' & $ConDNS & ' primary',"",@SW_HIDE)        
        EndIf
EndFunc ;=>_CMD_SetLocalIP


;======================================================
;
; ��������:		_API_Get_NetworkAdapterMAC ($sIP)
; ��ϸ��Ϣ:		����API�õ�MAC.
; thesnow��ע:	�˺����ǲ��÷���ARP��ʽ,����д����·�ɰ󶨻򽻻�����.���ܵõ������MAC.
; $sIP:         IP��ַ
; ����:         jiexunpc
;
;======================================================
Func _API_Get_NetworkAdapterMAC ($sIP)
  Local $MAC,$MACSize
  Local $i,$s,$r,$iIP

  $MAC = DllStructCreate("byte[6]")
  $MACSize = DllStructCreate("int")

  DllStructSetData($MACSize,1,6)
  $r = DllCall ("Ws2_32.dll", "int", "inet_addr", "str", $sIP)
  $iIP = $r[0]
  $r = DllCall ("iphlpapi.dll", "int", "SendARP","int", $iIP,"int", 0,"ptr", DllStructGetPtr($MAC),"ptr", DllStructGetPtr($MACSize))
  $s    = ""
  For $i = 0 To 5
      If $i Then $s = $s & ":"
      $s = $s & Hex(DllStructGetData($MAC,1,$i+1),2)
  Next
  Return $s
EndFunc ;=>_API_Get_NetworkAdapterMAC


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
        Return $ttext[0]
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
; $info[1][3]��һ��������NDS��������(��������)
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
	Local $colItems 				= 	""
	Local $objWMIService
	Local $NetworkAdapterID 		= 	0
	Local $NetworkAdapterName		= 	""
	Local $NetworkAdapterGateway 	= 	""
	Local $NetworkAdapterHostName 	= 	""
	Local $NetworkAdapterIPaddress 	= 	""
	Local $NetworkAdapterDNS1 		= 	""
	Local $NetworkAdapterDNS2 		= 	""
	Local $NetworkAdapterSubnet 	= 	""
	Local $NetworkAdapterMAC 		= 	""
	Local $NetworkAdapterNetConnectionID = ""
	Local $NetworkAdapterInfo[10][10]		;���10������.
	$NetworkAdapterInfo[0][0]		=	0				
	$objWMIService = ObjGet("winmgmts:\\localhost\root\CIMV2")
	$colItems = $objWMIService.ExecQuery("SELECT * FROM Win32_NetworkAdapterConfiguration WHERE IPEnabled != 0", "WQL", 0x10+0x20)
    $colItem2 = $objWMIService.ExecQuery('SELECT * FROM Win32_NetworkAdapter WHERE NetConnectionStatus >0', "WQL", 0x10+0x20)
	If IsObj($colItems) Then
		For $objItem In $colItems
			$NetworkAdapterName 		=	$objItem.Description
			$NetworkAdapterGateway 		= 	$objItem.DefaultIPGateway(0)
			$NetworkAdapterHostName 	= 	$objItem.DNSHostName
			$NetworkAdapterIPaddress	=	$objItem.IPAddress(0)
			$NetworkAdapterDNS1			=	$objItem.DNSServerSearchOrder(0)
			$NetworkAdapterDNS2			=	$objItem.DNSServerSearchOrder(1)
			$NetworkAdapterSubnet		=	$objItem.IPSubnet(0)
			$NetworkAdapterMAC			=	$objItem.MACAddress
			$NetworkAdapterID 			+=	1
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
	
	If IsObj($colItem2) then
		$NetworkAdapterID=0
		For $objItem2s In $colItem2
			$NetworkAdapterNetConnectionID = $objItem2s.NetConnectionID
			$NetworkAdapterID+=1
			$NetworkAdapterInfo[$NetworkAdapterID][9]	= $NetworkAdapterNetConnectionID
		Next
		Return $NetworkAdapterInfo
	Else
		Return $NetworkAdapterInfo
	Endif
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

Func _WMI_SetNetworkAdapterInfo($HostName, $IpAdd, $SubMask, $GateWay, $DNS1, $DNS2, $IPX)
	Dim $SetDns[2], $SetIPAddress[1], $SetSubnetmask[1], $SetGateway[1]
	$SetDns[0] = $DNS1
	$SetDns[1] = $DNS2
	$SetIPAddress[0] = $IpAdd
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
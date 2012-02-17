﻿#include <Array.au3>
#include <Inet.au3>

Global $aResult, $sResult, $sIP

; 示例 1

TCPStartup()
$sIP = TCPNameToIP("hiddensoft.com")
$sResult = _TCPIpToName($sIP)
If @error Then
	MsgBox(4096, "_TCPIpToName()", "@error = " & @error & @LF & "@extended = " & @extended)
Else
	MsgBox(4096, "hiddensoft.com really is:", $sResult)
EndIf

; 示例 2

TCPStartup()
$sIP = _GetIP()
$aResult = _TCPIpToName($sIP, 1)
If @error Then
	MsgBox(4096, "_TCPIpToName()", "@error = " & @error & @LF & "@extended = " & @extended)
Else
	_ArrayDisplay($aResult, "Local Hostname(s)")
EndIf

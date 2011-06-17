﻿; 示例 1

#include <inet.au3>

Local $sResult, $sIp
TCPStartup()
$sIp = TCPNameToIP("hiddensoft.com")
$sResult = _TCPIpToName($sIp)
If @error Then
	MsgBox(0, "_TCPIpToName()", "@error = " & @error & @LF & "@extended = " & @extended)
Else
	MsgBox(0, "hiddensoft.com realy is:", $sResult)
EndIf

; 示例 2

#include <array.au3>
#include <inet.au3>

Local $aResult
TCPStartup()
$sIp = _GetIP()
$aResult = _TCPIpToName($sIp, 1)
If @error Then
	MsgBox(0, "_TCPIpToName()", "@error = " & @error & @LF & "@extended = " & @extended)
Else
	_ArrayDisplay($aResult, "Local Hostname(s)")
EndIf

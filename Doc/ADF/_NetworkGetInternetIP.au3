;======================================================
;
; ��������:        _NetworkGetInternetIP
; ��ϸ��Ϣ:        �õ�����IP��ַ.
; ����:            Sxd
;
;======================================================
Func _NetworkGetInternetIP()
	Local $ip
	If InetGet("http://www.aamailsoft.com/getip.php", @TempDir & "\ip.txt") Then
		$ip = FileRead(@TempDir & "\ip.txt")
		FileDelete(@TempDir & "\ip.txt")
		Return $ip
	Else
		Return "0.0.0.0"
	EndIf
EndFunc   ;==>_NetworkGetInternetIP
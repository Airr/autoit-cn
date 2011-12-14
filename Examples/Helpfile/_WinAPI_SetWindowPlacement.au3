#include <WinAPI.au3>

Local $hWnd, $iRET, $pStruct, $sMsg, $stRET

; �������±���ʵ��������
Run("notepad.exe")
$hWnd = WinWait("[CLASS:Notepad]")
WinMove($hWnd, "", 256, 256, 400, 400)
Sleep(1000)

; ��С��Ȼ������ _WinAPI_GetWindowPlacement() ���صĲ���ֵ
WinSetState($hWnd, "", @SW_MINIMIZE)
$stRET = _WinAPI_GetWindowPlacement($hWnd)
If @error = 0 Then
	$sMsg = "$stWindowPlacement:" & @CRLF & @CRLF
	$sMsg &= @TAB & "length = " & DllStructGetData($stRET, "length") & @CRLF
	$sMsg &= @TAB & "flags = " & DllStructGetData($stRET, "flags") & @CRLF
	$sMsg &= @TAB & "showCmd = " & DllStructGetData($stRET, "showCmd") & @CRLF & @CRLF
	$sMsg &= "ptMinPosition:" & @CRLF
	$sMsg &= @TAB & "MinX = " & DllStructGetData($stRET, "ptMinPosition", 1) & @CRLF
	$sMsg &= @TAB & "MinY = " & DllStructGetData($stRET, "ptMinPosition", 2) & @CRLF & @CRLF
	$sMsg &= "ptMaxPosition:" & @CRLF
	$sMsg &= @TAB & "MaxX = " & DllStructGetData($stRET, "ptMaxPosition", 1) & @CRLF
	$sMsg &= @TAB & "MaxY = " & DllStructGetData($stRET, "ptMaxPosition", 2) & @CRLF & @CRLF
	$sMsg &= "rcNormalPosition:" & @CRLF
	$sMsg &= @TAB & "left = " & DllStructGetData($stRET, "rcNormalPosition", 1) & @CRLF
	$sMsg &= @TAB & "top = " & DllStructGetData($stRET, "rcNormalPosition", 2) & @CRLF
	$sMsg &= @TAB & "right = " & DllStructGetData($stRET, "rcNormalPosition", 3) & @CRLF
	$sMsg &= @TAB & "bottom = " & DllStructGetData($stRET, "rcNormalPosition", 4)
	MsgBox(64, "Success", $sMsg)

	; �� _WinAPI_SetWindowPlacement() �ı䳣̬ʱ�ľ���Ȼ��ָ�
	DllStructSetData($stRET, "rcNormalPosition", 128, 1); ��
	DllStructSetData($stRET, "rcNormalPosition", 128, 2); ��
	DllStructSetData($stRET, "rcNormalPosition", @DesktopWidth - 128, 3); ��
	DllStructSetData($stRET, "rcNormalPosition", @DesktopHeight - 128, 4); ��
	$pStruct = DllStructGetPtr($stRET); ��ȡ�����޸Ľṹ��ָ��
	$iRET = _WinAPI_SetWindowPlacement($hWnd, $pStruct)
	If @error = 0 Then
		WinSetState($hWnd, "", @SW_RESTORE)
		ControlSetText($hWnd, "", "Edit1", "_WinAPI_SetWindowPlacement() succeeded!")
	Else
		MsgBox(16, "Error", "_WinAPI_SetWindowPlacement() failed!" & @CRLF & _
				"$iRET = " & $iRET & @CRLF & _
				"@error = " & @error & @CRLF & _
				"@extended = " & @extended)
	EndIf
Else
	MsgBox(16, "Error", "_WinAPI_GetWindowPlacement() failed!" & @CRLF & _
			"$stRET = " & $stRET & @CRLF & _
			"@error = " & @error & @CRLF & _
			"@extended = " & @extended)
EndIf
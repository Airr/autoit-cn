#include-once
; _EnumScreenRes() ������Ҫ
#include <array.au3>
;======================================================
;
; ��������:		_Refreshicon
; ��ϸ��Ϣ:		ˢ�¹���ͼ��.
; ����ֵ :		�����Ƿ�ɹ�������1
; ����:			���ݾ�ʿ,MOD by thesnow(rundll32@126.com)
;
;======================================================
Func _Refreshicon()
	FileWriteLine(@TempDir & "\Refreshicon.inf","[version]" & @CRLF & "signature=$chicago$")
	RunWait ('Rundll32.exe setupapi,InstallHinfSection DefaultInstall 132 '& @TempDir & "\Refreshicon.inf",@TempDir,@SW_HIDE)
	FileDelete (@TempDir & "\Refreshicon.inf")
	Return 1
EndFunc ;=>ˢ��ϵͳͼ��

;======================================================
;
; ��������:		_RefreshIconMSG
; ��ϸ��Ϣ:		ˢ�¹���ͼ��.
; ����ֵ :		�����Ƿ�ɹ�������1
; ����:			thesnow(rundll32@126.com)
;
;======================================================
Func _RefreshIconMSG()
	DllCall("shell32.dll", "none", "SHChangeNotify", _
			"long", 0x8000000, _
			"uint", BitOR(0x0, 0x1000), _
			"ptr", 0, _
			"ptr", 0 _
			)
	Return 1
EndFunc ;=>ˢ��ϵͳͼ��

;===============================================================================
;
; ��������:		_ChangeScreenRes()
; ��ϸ��Ϣ:		�޸� ��Ļ�ֱ���,ˢ����.
; �汾:			1.0.0.1
; ����:     	$i_Width - ��Ļ���(��1024X768 �е� 1024)
; 				$i_Height - ��Ļ�߶�(��1024X768 �е� 768)
; 				$i_BitsPP -������ɫ���(�� 32BIT,32λ)
; 				$i_RefreshRate - ��Ļˢ����(�� 75 MHZ).
; ����     		AutoIt ���԰� > 3.1 ����
; ����ֵ:		�ɹ�,��Ļ����,@ERROR = 0
; 				ʧ��,��Ļ������, @ERROR = 1
; ��̳:			http://www.autoitscript.com/forum/index.php?showtopic=20121
; ����:			Original code - psandu.ro
;               Modifications - PartyPooper
; ����:			thesnow
;
;===============================================================================
Func _ChangeScreenRes($i_Width = @DesktopWidth, $i_Height = @DesktopHeight, $i_BitsPP = @DesktopDepth, $i_RefreshRate = @DesktopRefresh)
	Local Const $DM_PELSWIDTH = 0x00080000
	Local Const $DM_PELSHEIGHT = 0x00100000
	Local Const $DM_BITSPERPEL = 0x00040000
	Local Const $DM_DISPLAYFREQUENCY = 0x00400000
	Local Const $CDS_TEST = 0x00000002
	Local Const $CDS_UPDATEREGISTRY = 0x00000001
	Local Const $DISP_CHANGE_RESTART = 1
	Local Const $DISP_CHANGE_SUCCESSFUL = 0
	Local Const $HWND_BROADCAST = 0xffff
	Local Const $WM_DISPLAYCHANGE = 0x007E
	If $i_Width = "" Or $i_Width = -1 Then $i_Width = @DesktopWidth ; default to current setting
	If $i_Height = "" Or $i_Height = -1 Then $i_Height = @DesktopHeight ; default to current setting
	If $i_BitsPP = "" Or $i_BitsPP = -1 Then $i_BitsPP = @DesktopDepth ; default to current setting
	If $i_RefreshRate = "" Or $i_RefreshRate = -1 Then $i_RefreshRate = @DesktopRefresh ; default to current setting
	Local $DEVMODE = DllStructCreate("byte[32];int[10];byte[32];int[6]")
	Local $B = DllCall("user32.dll", "int", "EnumDisplaySettings", "ptr", 0, "long", 0, "ptr", DllStructGetPtr($DEVMODE))
	If @error Then
		$B = 0
		SetError(1)
		Return $B
	Else
		$B = $B[0]
	EndIf
	If $B <> 0 Then
		DllStructSetData($DEVMODE, 2, BitOR($DM_PELSWIDTH, $DM_PELSHEIGHT, $DM_BITSPERPEL, $DM_DISPLAYFREQUENCY), 5)
		DllStructSetData($DEVMODE, 4, $i_Width, 2)
		DllStructSetData($DEVMODE, 4, $i_Height, 3)
		DllStructSetData($DEVMODE, 4, $i_BitsPP, 1)
		DllStructSetData($DEVMODE, 4, $i_RefreshRate, 5)
		$B = DllCall("user32.dll", "int", "ChangeDisplaySettings", "ptr", DllStructGetPtr($DEVMODE), "int", $CDS_TEST)
		If @error Then
			$B = -1
		Else
			$B = $B[0]
		EndIf
		Select
			Case $B = $DISP_CHANGE_RESTART
				$DEVMODE = ""
				Return 2
			Case $B = $DISP_CHANGE_SUCCESSFUL
				DllCall("user32.dll", "int", "ChangeDisplaySettings", "ptr", DllStructGetPtr($DEVMODE), "int", $CDS_UPDATEREGISTRY)
				DllCall("user32.dll", "int", "SendMessage", "hwnd", $HWND_BROADCAST, "int", $WM_DISPLAYCHANGE, _
				"int", $i_BitsPP, "int", $i_Height * 2 ^ 16 + $i_Width)
				$DEVMODE = ""
				Return 1
			Case Else
				$DEVMODE = ""
				SetError(1)
				Return $B
		EndSelect
	EndIf
EndFunc ;==>_ChangeScreenRes

;===============================================================================
;
; ��������:		_EnumScreenRes()
; ��ϸ��Ϣ:		ö�ٱ���֧�ֵ���Ļ�ֱ���ˢ����.
; �汾:			1.0.0.1
; ����:     	
; ����     		AutoIt ���԰� > 3.3.5.0 ����
; ����ֵ:		����һ������,����Ԫ��0Ϊ���ص�Ԫ������.
; ��̳:			
; ����:			thesnoW
;
;===============================================================================
Func _EnumScreenRes()
	Local $aRet[1]
	Local $iModeNum=0
	While 1
		Local $DEVMODE = DllStructCreate("byte[32];int[10];byte[32];int[6]")
		Local $B = DllCall("user32.dll", "int", "EnumDisplaySettings", "ptr", 0, "long", $iModeNum, "ptr", DllStructGetPtr($DEVMODE))
		If @error Then
			$B = 0
			ExitLoop
		EndIf
		If $B[0] <> 0 Then
			_ArrayAdd($aRet,DllStructGetData($DEVMODE,4,2) & "X" &DllStructGetData($DEVMODE,4,3) & "X" &DllStructGetData($DEVMODE,4,1) & "@"&DllStructGetData($DEVMODE,4,5))
		Else
			ExitLoop
		EndIf
		$iModeNum+=1
	WEnd
	$aRet[0]=UBound($aRet)-1
	Return $aRet
EndFunc
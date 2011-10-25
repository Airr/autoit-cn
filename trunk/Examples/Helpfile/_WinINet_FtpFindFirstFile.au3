#include <GuiConstantsEx.au3>
#include <WindowsConstants.au3>
#Include <WinINet.au3>

Global $iMemo

_Main()

Func _Main()
	Local $hGUI

	; ��������
	$hGUI = GUICreate(" _WinINet_FtpFindFile ", 600, 400)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New ")
	GUISetState()

	; ��ʼ��WinINet
	_WinINet_Startup()

	; ���ñ���
	Global $sServerName = ""
	Global $iServerPort = 21
	Global $sUsername = Default
	Global $sPassword = Default

	Global $sDirectory = " / "
	Global $sFilenameFilter = " * "

	; �������
	Global $hInternetOpen = _WinINet_InternetOpen(" AutoIt/" & @AutoItVersion)
	Global $hInternetConnect = _WinINet_InternetConnect($hInternetOpen, $INTERNET_SERVICE_FTP, $sServerName, $iServerPort, 0, $sUsername, $sPassword)

	; ö��Ŀ¼�ļ�
	If _WinINet_FtpSetCurrentDirectory($hInternetConnect, $sDirectory) Then
		Global $avFtpFile = _WinINet_FtpFindFirstFile($hInternetConnect, $sFilenameFilter)
		While Not @error
			MemoWrite( DllStructGetData($avFtpFile[1], "FileName "))
			_WinINet_InternetFindNextFile($avFtpFile[0], DllStructGetPtr($avFtpFile[1]))
		WEnd
	EndIf

	; ���
	_WinINet_InternetCloseHandle($hInternetConnect)
	_WinINet_InternetCloseHandle($hInternetOpen)
	_WinINet_Shutdown()

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite


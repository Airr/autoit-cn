#include <FTPEx.au3>
#include <Misc.au3>
#include <ProgressConstants.au3>
#include <GUIConstantsEx.au3>

Global $sRemoteFile = "/pub/software/databases/rt/SRPMS/ucs-local-modperl-2.0.3-1.src.rpm"
Global $sLocalFile = @TempDir & "\temp.tmp"
FileDelete($sLocalFile)

Local $sServer = 'ftp.csx.cam.ac.uk'
Local $sUsername = ''
Local $sPass = ''

Local $hInternetSession = _FTP_Open('MyFTP Control')
; passive allows most protected FTPs to answer
Local $hFTPSession = _FTP_Connect($hInternetSession, $sServer, $sUsername, $sPass, 1)

Global $idProgressBarCtrl, $idBtn_Cancel
Example()

_FTP_Close($hInternetSession)

Func Example()
	; create GUI
	GUICreate("My GUI download Progressbar", 220, 100, 100, 200)
	GUICtrlCreateLabel($sRemoteFile, 10, 10)
	$idProgressBarCtrl = GUICtrlCreateProgress(10, 40, 200, 20, $PBS_SMOOTH)
	GUICtrlSetColor(-1, 32250); not working with Windows XP Style
	$idBtn_Cancel = GUICtrlCreateButton("Cancel", 75, 70, 70, 20)
	GUISetState()

	Local $sFunctionToCall = "_UpdateGUIProgressBar"
	_FTP_ProgressDownload($hFTPSession, $sLocalFile, $sRemoteFile, $sFunctionToCall)

EndFunc   ;==>Example

Func _UpdateGUIProgressBar($iPercent)
	GUICtrlSetData($idProgressBarCtrl, $iPercent)
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			Exit -1 ; _FTP_DownloadProgress Aborts with -1, so you can exit your app afterwards
		Case $idBtn_Cancel
			Exit -2 ; Just Cancel, without special Return value
	EndSwitch
	Return 1 ; Otherwise continue Download
EndFunc   ;==>_UpdateGUIProgressBar

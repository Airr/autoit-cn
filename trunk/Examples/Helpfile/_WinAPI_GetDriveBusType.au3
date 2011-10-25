#include <GuiConstantsEx.au3>
#include <WinApiEx.au3>
#include <WindowsConstants.au3>

Global $iMemo, $Bus, $Text

_Main()

Func _Main()
	Local $hGUI, $aDisk

	; ��������
	$hGUI = GUICreate("Disk SN", 400, 300)

	; ����memo�ؼ�
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ��ȡӲ����Ϣ
	$aDisk = DriveGetDrive("All")

	; ��ȡӲ��������Ϣ
	For $i = 1 To $aDisk[0]
		$Bus = _WinAPI_GetDriveBusType($aDisk[$i])
		Switch $Bus
			Case $DRIVE_BUS_TYPE_UNKNOWN
				$Text = ' UNKNOWN '
			Case $DRIVE_BUS_TYPE_SCSI
				$Text = ' SCSI '
			Case $DRIVE_BUS_TYPE_ATAPI
				$Text = ' ATAPI '
			Case $DRIVE_BUS_TYPE_ATA
				$Text = ' ATA '
			Case $DRIVE_BUS_TYPE_1394
				$Text = ' 1394 '
			Case $DRIVE_BUS_TYPE_SSA
				$Text = ' SSA '
			Case $DRIVE_BUS_TYPE_FIBRE
				$Text = ' FIBRE '
			Case $DRIVE_BUS_TYPE_USB
				$Text = ' USB '
			Case $DRIVE_BUS_TYPE_RAID
				$Text = ' RAID '
			Case $DRIVE_BUS_TYPE_ISCSI
				$Text = ' ISCSI '
			Case $DRIVE_BUS_TYPE_SAS
				$Text = ' SAS '
			Case $DRIVE_BUS_TYPE_SATA
				$Text = ' SATA '
			Case $DRIVE_BUS_TYPE_SD
				$Text = ' SD '
			Case $DRIVE_BUS_TYPE_MMC
				$Text = ' MMC '
		EndSwitch
		MemoWrite($aDisk[$i] & " ==>" & $Text)
	Next
	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; ��memo�ؼ�д����Ϣ
Func MemoWrite($sMessage = "")
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite


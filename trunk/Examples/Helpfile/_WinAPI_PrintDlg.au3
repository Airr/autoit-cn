#Include <WinAPIEx.au3>
#Include <Memory.au3>

Opt('MustDeclareVars ', 1)

Global $tPRINTDLG, $tDEVNAMES, $hDevNames, $pDevNames, $Result

;����PAGEDLG�ṹ����������, ��ʼҳ��ֹͣҳ�ĳ�ʼֵ
$tPRINTDLG = DllStructCreate($tagPRINTDLG)
DllStructSetData($tPRINTDLG, 'Size ', DllStructGetSize($tPRINTDLG))
DllStructSetData($tPRINTDLG, 'Flags ', $PD_PAGENUMS)
DllStructSetData($tPRINTDLG, 'FromPage ', 2)
DllStructSetData($tPRINTDLG, 'ToPage ', 3)
DllStructSetData($tPRINTDLG, 'MinPage ', 1)
DllStructSetData($tPRINTDLG, 'MaxPage ', 9)
DllStructSetData($tPRINTDLG, 'Copies ', 4)

; ������ӡ�Ի���
If Not _WinAPI_PrintDlg($tPRINTDLG) Then
	Exit
EndIf

; ��ʾ���
$hDevNames = DllStructGetData($tPRINTDLG, 'hDevNames')
$pDevNames = _MemGlobalLock($hDevNames)
$tDEVNAMES = DllStructCreate($tagDEVNAMES, $pDevNames)
$Result = ' Printer:' & _WinAPI_GetString($pDevNames + 2 * DllStructGetData($tDEVNAMES, 'DeviceOffset')) & @CR
If DllStructGetData($tDEVNAMES, 'Default') Then
	$Result &= ' (Default)' & @CR
Else
	$Result &= @CR
EndIf
$Result &= ' First page:' & DllStructGetData($tPRINTDLG, 'FromPage')
$Result &= ' Last page:' & DllStructGetData($tPRINTDLG, 'ToPage')
$Result &= ' Copies:' & DllStructGetData($tPRINTDLG, 'Copies')
msgbox(64, 'Print ', $Result)

; �ͷŰ���DEVMODE��DEVNAMES�ṹ��ȫ���ڴ����
_MemGlobalFree( DllStructGetData($tPRINTDLG, 'hDevMode'))
_MemGlobalFree($hDevNames))


#Include <WinAPIEx.au3>
#Include <Memory.au3>

Opt('MustDeclareVars ', 1)

Global $tPRINTDLGEX, $tPRINTPAGERANGE, $tDEVNAMES, $hDevNames, $pDevNames, $Result
Global $Page[2]

;����PRINTDLGEX�ṹ����������, ��ʼҳ��ֹͣҳ�ĳ�ʼֵ
$tPRINTPAGERANGE = DllStructCreate($tagPRINTPAGERANGE)
DllStructSetData($tPRINTPAGERANGE, 'FromPage ', 2)
DllStructSetData($tPRINTPAGERANGE, 'ToPage ', 3)
$tPRINTDLGEX = DllStructCreate($tagPRINTDLGEX)
DllStructSetData($tPRINTDLGEX, 'Size ', DllStructGetSize($tPRINTDLGEX))
DllStructSetData($tPRINTDLGEX, 'hOwner ', WinGetHandle( AutoItWinGetTitle()))
DllStructSetData($tPRINTDLGEX, 'Flags ', BitOR($PD_PAGENUMS, $PD_NOCURRENTPAGE, $PD_NOSELECTION))
DllStructSetData($tPRINTDLGEX, 'NumPageRanges ', 1)
DllStructSetData($tPRINTDLGEX, 'MaxPageRanges ', 1)
DllStructSetData($tPRINTDLGEX, 'PageRanges ', DllStructGetPtr($tPRINTDLGEX))
DllStructSetData($tPRINTDLGEX, 'MinPage ', 1)
DllStructSetData($tPRINTDLGEX, 'MaxPage ', 9)
DllStructSetData($tPRINTDLGEX, 'Copies ', 4)
DllStructSetData($tPRINTDLGEX, 'StartPage ', -1)

; ������ӡ�Ի���
If Not _WinAPI_PrintDlg($tPRINTDLGEX) Then
	Exit
EndIf

Switch @extended
	Case $PD_RESULT_PRINT
		; �û����"Print"(��ӡ)��ť
	Case $PD_RESULT_APPLY
		; �û����"Apply"(Ӧ��)��ť���Ժ���"Cancel"(ȡ��)��ť
	Case $PD_RESULT_CANCEL
		Exit
EndSwitch

; ��ʾ���
$hDevNames = DllStructGetData($tPRINTDLGEX, 'hDevNames')
$pDevNames = _MemGlobalLock($hDevNames)
$tDEVNAMES = DllStructCreate($tagDEVNAMES, $pDevNames)
$Result = ' Printer:' & _WinAPI_GetString($pDevNames + 2 * DllStructGetData($tDEVNAMES, 'DeviceOffset')) & @CR
If DllStructGetData($tDEVNAMES, 'Default') Then
	$Result &= ' (Default)' & @CR
Else
	$Result &= @CR
EndIf
If BitAND( DllStructGetData($tPRINTDLGEX, 'Flags'), $PD_PAGENUMS) Then
	$Page[0] = DllStructGetData($tPRINTPAGERANGE, 'FromPage')
	$Page[1] = DllStructGetData($tPRINTPAGERANGE, 'ToPage')
Else
	$Page[0] = DllStructGetData($tPRINTDLGEX, 'MinPage')
	$Page[1] = DllStructGetData($tPRINTDLGEX, 'MaxPage')
EndIf
$Result &= ' First page:' & $Page[0] & @CR
$Result &= ' Last page:' & $Page[0] & @CR
$Result &= ' Copies:' & DllStructGetData($tPRINTDLGEX, 'Copies')
msgbox(64, 'Print ', $Result)

; �ͷŰ���DEVMODE��DEVNAMES�ṹ��ȫ���ڴ����
_MemGlobalFree( DllStructGetData($tPRINTDLGEX, 'hDevMode'))
_MemGlobalFree($hDevNames))


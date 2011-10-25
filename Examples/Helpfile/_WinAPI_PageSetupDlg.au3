#Include <WinAPIEx.au3>
#Include <Memory.au3>

Opt('MustDeclareVars ', 1)

Global $tPAGESETUPDLG, $Result

;����PAGESETUPDLG�ṹ���������г�ʼ�߽�ֵΪ10.00 mm
$tPAGESETUPDLG = DllStructCreate($tagPAGESETUPDLG)
DllStructSetData($tPAGESETUPDLG, 'Size ', DllStructGetSize($tPAGESETUPDLG))
DllStructSetData($tPAGESETUPDLG, 'Flags ', BitOR($PSD_INHUNDREDTHSOFMILLIMETERS, $PSD_MARGINS))
DllStructSetData($tPAGESETUPDLG, 'MarginLeft ', 10 * 100)
DllStructSetData($tPAGESETUPDLG, 'MarginTop ', 10 * 100)
DllStructSetData($tPAGESETUPDLG, 'MarginRight ', 10 * 100)
DllStructSetData($tPAGESETUPDLG, 'MarginBottom ', 10 * 100)

; ����ҳ�����öԻ���
If Not _WinAPI_PageSetupDlg($tPAGESETUPDLG) Then
	Exit
EndIf

; ��ʾ���
$Result = ' Paper width:' & DllStructGetData($tPAGESETUPDLG, 'PaperWidth') / 100 & ' mm' & @CRLF
$Result &= ' Paper height:' & DllStructGetData($tPAGESETUPDLG, 'PaperHeight') / 100 & ' mm' & @CRLF
$Result &= ' Margin left:' & DllStructGetData($tPAGESETUPDLG, 'MarginLeft') / 100 & ' mm' & @CRLF
$Result &= ' Margin top:' & DllStructGetData($tPAGESETUPDLG, 'MarginTop') / 100 & ' mm' & @CRLF
$Result &= ' Margin right:' & DllStructGetData($tPAGESETUPDLG, 'MarginRight') / 100 & ' mm' & @CRLF
$Result &= ' Margin bottom:' & DllStructGetData($tPAGESETUPDLG, 'MarginBottom') / 100 & ' mm' & @CRLF
msgbox(16, 'Page Setup Info ', $Result)

; �ͷŰ���DEVMODE��DEVNAMES�ṹ��ȫ���ڴ����
_MemGlobalFree( DllStructGetData($tPAGESETUPDLG, 'hDevMode'))
_MemGlobalFree( DllStructGetData($tPAGESETUPDLG, 'hDevNames'))


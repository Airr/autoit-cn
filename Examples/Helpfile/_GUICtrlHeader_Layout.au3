
#include  <GuiConstantsEx.au3>
#include  <GuiHeader.au3>
#include  <WinAPI.au3>

Opt('MustDeclareVars', 1)

$Debug_HDR = False ; ��鴫�ݸ��ؼ�������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤��

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $hHeader, $tRect, $tPos

	; ��������
	$hGUI = GUICreate("Header", 400, 300)
	$hHeader = _GUICtrlHeader_Create($hGUI)
	$iMemo = GUICtrlCreateEdit("", 2, 24, 396, 274, 0)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")

	GUISetState()

	;
	�����
	_GUICtrlHeader_AddItem($hHeader, "Column 1", 100)
	_GUICtrlHeader_AddItem($hHeader, "Column 2", 100)
	_GUICtrlHeader_AddItem($hHeader, "Column 3", 100)
	_GUICtrlHeader_AddItem($hHeader, "Column 4", 100)

	;
	��ȡ�����
	$tRect = _WinAPI_GetClientRect($hGUI)
	$tPos = _GUICtrlHeader_Layout($hHeader, $tRect)

	;
	��ʾ�����
	MemoWrite("Window handle .....:" & DllStructGetData($tPos, "hWnd"))

	MemoWrite( "Z order handle ....:
	"  &  DllStructGetData ( $tPos ,  " InsertAfter" ))

	MemoWrite( "Horizontal
	position: "  &  DllStructGetData ( $tPos ,  " X" ))
	MemoWrite("Vertical position .:" & DllStructGetData($tPos, "Y"))

	MemoWrite( "Width .............:
	"  &  DllStructGetData ( $tPos ,  " CX" ))

	MemoWrite( "Height ............:
	"  &  DllStructGetData ( $tPos ,  " CY" ))

	MemoWrite( "Flags .............:
	"  &  DllStructGetData ( $tPos ,  " Flags" ))


	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; ��memo�ؼ�д��һ��
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite




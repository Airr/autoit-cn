
#include  <GuiConstantsEx.au3>
#include  <GDIPlus.au3>
#include  <WindowsConstants.au3>

Opt('MustDeclareVars', 1)

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $hBitmap

	; ��������
	$hGUI = GUICreate("GDI+", 600, 400)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ��ʼ��GDI+��
	_GDIPlus_Startup()

	; ��ʾ������/����������
	MemoWrite("Decoder count :" & _GDIPlus_DecodersGetCount()) ;
	MemoWrite("Decoder size .:" & _GDIPlus_DecodersGetSize()) ;
	MemoWrite("Encoder count :" & _GDIPlus_EncodersGetCount()) ;
	MemoWrite("Encoder size .:" & _GDIPlus_EncodersGetSize()) ;

	; �ر�GDI+��
	_GDIPlus_ShutDown()

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main

; д��memo�ؼ�
Func MemoWrite($sMessage = '')
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite


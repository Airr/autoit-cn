
#include  <GuiConstantsEx.au3>
#include  <GuiIPAddress.au3>
#include  <WindowsConstants.au3>

Opt("MustDeclareVars", 1)

$Debug_IP = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

_Main()

Func _Main()
	Local $hgui, $hIPAddress

	$hgui = GUICreate( "IP Address
	Destroy Control Example" ,  400 ,  300 )

	$hIPAddress = _GUICtrlIpAddress_Create($hgui, 10, 10, 125, 30, $WS_THICKFRAME)
	GUISetState(@SW_SHOW)

	;
	���IP��ַ
	MsgBox(4160, "Information", "Destroy IP Address Control")
	_GUICtrlIpAddress_Destroy($hIPAddress)

	;
	�ȴ��û��رս���
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
endfunc   ;==>_Main


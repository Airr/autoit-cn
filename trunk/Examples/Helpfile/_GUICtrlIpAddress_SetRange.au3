 #include <GuiConstantsEx.au3> 
 #include <GuiIPAddress.au3> 
 
 Opt ( " MustDeclareVars ", 1 ) 
 
 $Debug_IP = False ; ��鴫�ݸ�����������, ����Ϊ����ʹ����һ�ؼ��ľ���۲��乤�� 
 
 _Main() 
 
 Func _Main() 
   Local $hgui , $hIPAddress 
 
   $hgui = GUICreate ( " IP Address Control Set Range Example ", 300 , 150 ) 
   $hIPAddress = _GUICtrlIpAddress_Create ( $hgui , 10 , 10 ) 
   GUISetState ( @SW_SHOW ) 
 
   _GUICtrlIpAddress_Set ( $hIPAddress , " 24.168.2.128 " ) 
 
   ; ���õ�һ������ķ�Χ 
   _GUICtrlIpAddress_SetRange ( $hIPAddress , 0 , 198 , 200 ) 
 
   ; �ȴ��û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
 EndFunc ;==>_Main 

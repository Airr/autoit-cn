
#include  <GuiConstantsEx.au3> 
#include  <GuiIPAddress.au3> 

Opt ( "MustDeclareVars" ,  1 ) 

$Debug_IP  =  False  ; ��鴫�ݸ�����������, 
����Ϊ����ʹ����һ�ؼ��ľ���۲��乤�� 

_Main () 

Func _Main () 
    Local  $hgui ,  $hIPAddress 
    
    $hgui  =  GUICreate ( "IP Address 
Control Set Focus ʾ��" ,  400 ,  300 ) 
  
  $hIPAddress  =  _GUICtrlIpAddress_Create  ( $hgui ,  2 ,  4 ) 
  
  GUISetState ( @SW_SHOW ) 

  
  _GUICtrlIpAddress_Set  ( $hIPAddress ,  "24.168.2.128" ) 

    _GUICtrlIpAddress_SetFocus  ( $hIPAddress ,  1 ) 
    ; �ȴ��û��˳� 
    Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
EndFunc    ;==>_Main 



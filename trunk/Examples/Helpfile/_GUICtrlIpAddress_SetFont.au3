
#include  <GuiConstantsEx.au3> 
#include  <GuiIPAddress.au3> 

Opt ( "MustDeclareVars" ,  1 ) 

$Debug_IP  =  False  ; ��鴫�ݸ�����������, 
����Ϊ����ʹ����һ�ؼ��ľ���۲��乤�� 

_Main () 

Func _Main () 
    Local  $hgui ,  $hIPAddress ,  $hIPAddress2 
    
    $hgui  =  GUICreate ( "IP Address 
Control Set Font ʾ��" ,  300 ,  150 ) 
  
  $hIPAddress  =  _GUICtrlIpAddress_Create  ( $hgui ,  10 ,  10 ,  150 ,  30 ) 
  
  $hIPAddress2  =  _GUICtrlIpAddress_Create  ( $hgui ,  10 ,  50 ,  150 ,  30 ) 
  
  GUISetState ( @SW_SHOW ) 

  
  _GUICtrlIpAddress_Set  ( $hIPAddress ,  "24.168.2.128" ) 
  
  _GUICtrlIpAddress_SetFont  ( $hIPAddress ,  "Times New 
Roman" ,  14 ,  800 ,  True ) 
    _GUICtrlIpAddress_Set  ( $hIPAddress2 ,  "24.168.2.128" ) 
    _GUICtrlIpAddress_SetFont  ( $hIPAddress2 ,  "Arial" ,  10 ,  300 ) 
  
  
    ; 
�ȴ��û��˳� 
    Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
EndFunc    ;==>_Main 



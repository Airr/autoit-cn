
#include  <GuiConstantsEx.au3> 
#include  <GuiStatusBar.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

$Debug_SB  =  False  ; ��鴫�ݸ�����������, 
����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 

_Main () 

Func _Main () 

    Local  $hGUI ,  $HandleBefore ,  $hStatus 
    Local  $aParts [ 3 ]  =  [ 75 ,  150 ,  - 1 ] 
    
    ; �������� 
    $hGUI  =  GUICreate ( "StatusBar 
Destroy" ,  400 ,  300 ) 

    ;=============================================================================== 
    ; Ĭ�ϲ����ı���һ������ 
    $hStatus  =  _GUICtrlStatusBar_Create  ( $hGUI ) 
    ;=============================================================================== 
    _GUICtrlStatusBar_SetParts  ( $hStatus ,  $aParts ) 

    GUISetState () 

  
  $HandleBefore  =  $hStatus 
    MsgBox  ( 4160 ,  "Information" ,  "Destroying the Control 
for Handle: "  &  $hStatus ) 
    MsgBox  ( 4160 ,  "Information" ,  "Control Destroyed: 
"  &  _GUICtrlStatusBar_Destroy  ( $hStatus )  &  @LF  &  _ 
            "Handel 
Before Destroy: "  &  $HandleBefore  &  @LF  &  _ 
            "Handle After Destroy: "  &  $hStatus ) 

  
  ; ѭ�����û��˳� 
    Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
    GUIDelete () 
EndFunc    ;==>_Main 



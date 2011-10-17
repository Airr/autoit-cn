
#include  <GuiConstantsEx.au3> 
#include  <GuiStatusBar.au3> 
#include  <WindowsConstants.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

$Debug_SB  =  False  ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 

Global  $iMemo 

_Main () 

Func _Main () 

    Local  $hGUI ,  $hStatus 
    Local  $aParts [ 3 ]  =  [ 75 ,  150 ,  - 1 ] 
    
    ; �������� 
    $hGUI  =  GUICreate ( "StatusBar Get 
Count" ,  400 ,  300 ) 

    $hStatus  =  _GUICtrlStatusBar_Create  ( $hGUI ) 
    _GUICtrlStatusBar_SetParts  ( $hStatus ,  $aParts ) 
    
    ; ����memo�ؼ� 
    $iMemo  =  GUICtrlCreateEdit ( "" ,  2 ,  2 ,  396 ,  274 ,  $WS_VSCROLL ) 
    GUICtrlSetFont ( $iMemo ,  9 ,  400 ,  0 ,  "Courier New" ) 
    GUISetState () 

    ; 
��ȡ�ֲ������� 
    MemoWrite ( "Number of parts .: "  &  _GUICtrlStatusBar_GetCount  ( $hStatus )) 

    ; 
ѭ�����û��˳� 
    Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
    GUIDelete () 
EndFunc    ;==>_Main 

; 
��memo�ؼ�д��һ����Ϣ 
Func MemoWrite ( $sMessage  =  "" ) 
    GUICtrlSetData ( $iMemo ,  $sMessage  &  @CRLF ,  1 ) 
EndFunc    ;==>MemoWrite 



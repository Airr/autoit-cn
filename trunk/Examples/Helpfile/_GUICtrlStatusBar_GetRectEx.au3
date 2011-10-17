
#include  <GuiConstantsEx.au3> 
#include  <GuiStatusBar.au3> 
#include  <WindowsConstants.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

$Debug_SB  =  False  ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 

Global  $iMemo 

_Main () 

Func _Main () 

    Local  $hGUI ,  $tRect ,  $hStatus 
    Local  $aParts [ 3 ]  =  [ 75 ,  150 ,  - 1 ] 
    
    ; �������� 
    $hGUI  =  GUICreate ( "StatusBar Get 
RectEx" ,  400 ,  300 ) 
    $hStatus  =  _GUICtrlStatusBar_Create  ( $hGUI ) 
    
    ; ����memo�ؼ� 
    $iMemo  =  GUICtrlCreateEdit ( "" ,  2 ,  2 ,  396 ,  274 ,  $WS_VSCROLL ) 
    GUICtrlSetFont ( $iMemo ,  9 ,  400 ,  0 ,  "Courier New" ) 
    GUISetState () 

    ; 
����/��ȡ���� 
    _GUICtrlStatusBar_SetParts  ( $hStatus ,  $aParts ) 

    ; 
��ȡ����1�ľ��ο� 
    $tRect  =  _GUICtrlStatusBar_GetRectEx  ( $hStatus ,  0 ) 
    MemoWrite ( "Part 1 left ...: "  &  DllStructGetData ( $tRect ,  "Left" )) 
    
MemoWrite ( "Part 1 top ....: 
"  &  DllStructGetData ( $tRect ,  "Top" )) 
    
MemoWrite ( "Part 1 right ..: 
"  &  DllStructGetData ( $tRect ,  "Right" )) 
    
MemoWrite ( "Part 1 bottom .: 
"  &  DllStructGetData ( $tRect ,  "Bottom" )) 

  
  ; ѭ�����û��˳� 
    Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
    GUIDelete () 
EndFunc    ;==>_Main 

; ��memo�ؼ�д����Ϣ 
Func MemoWrite ( $sMessage  =  "" ) 
    GUICtrlSetData ( $iMemo ,  $sMessage  &  @CRLF ,  1 ) 
EndFunc    ;==>MemoWrite 




#include  <GuiConstantsEx.au3> 
#include  <GuiStatusBar.au3> 
#include  <ProgressConstants.au3> 
#include  <SendMessage.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

$Debug_SB  =  False  ; ��鴫�ݸ�����������, 
����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 

_Main () 

Func _Main () 

    Local  $hGUI ,  $hProgress ,  $hInput ,  $input ,  $progress ,  $hStatus 
    Local  $aParts [ 4 ]  =  [ 80 ,  160 ,  300 ,  - 1 ] 
    
    ; �������� 
    $hGUI  =  GUICreate ( "StatusBar Embed 
Control" ,  400 ,  300 ) 

    ;=============================================================================== 
    ; Ĭ��һ�������ı��Ĳ��� 
    $hStatus  =  _GUICtrlStatusBar_Create  ( $hGUI ) 
    _GUICtrlStatusBar_SetMinHeight  ( $hStatus ,  20 ) 

    ;=============================================================================== 
    GUISetState () 

    ; 
��ʼ���� 
    _GUICtrlStatusBar_SetParts  ( $hStatus ,  $aParts ) 
    _GUICtrlStatusBar_SetText  ( $hStatus ,  "Part 1" ) 
    _GUICtrlStatusBar_SetText  ( $hStatus ,  "Part 2" ,  1 ) 

    ; Ƕ��һ�������� 
    If  @OSTYPE  =  "WIN32_WINDOWS"  Then 
        $progress  =  GUICtrlCreateProgress ( 0 ,  0 ,  - 1 ,  - 1 ,  $PBS_SMOOTH ) 
  
      $hProgress  =  GUICtrlGetHandle ( $progress ) 
    
    _GUICtrlStatusBar_EmbedControl  ( $hStatus ,  2 ,  $hProgress ) 
    Else 
        $progress  =  GUICtrlCreateProgress ( 0 ,  0 ,  - 1 ,  - 1 ,  $PBS_MARQUEE )  ; ����ʽ��ҪWinXP����ϵͳ֧�� 
        $hProgress  =  GUICtrlGetHandle ( $progress ) 
    
    _GUICtrlStatusBar_EmbedControl  ( $hStatus ,  2 ,  $hProgress ) 
        _SendMessage ( $hProgress ,  $PBM_SETMARQUEE ,  True ,  200 )  ; ����ʽ��ҪWinXP����ϵͳ֧�� 
    EndIf 
    
    $input  =  GUICtrlCreateInput ( "This is 
Embeded" ,  0 ,  0 ) 
    $hInput  =  GUICtrlGetHandle ( $input ) 
    _GUICtrlStatusBar_EmbedControl  ( $hStatus ,  3 ,  $hInput ,  3 ) 

    ; 
ѭ�����û��˳� 
    Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
    GUIDelete () 
EndFunc    ;==>_Main 



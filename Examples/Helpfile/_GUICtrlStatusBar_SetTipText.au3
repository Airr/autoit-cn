
#include  <GuiConstantsEx.au3> 
#include  <GuiStatusBar.au3> 
#include  <WinAPI.au3> 
#include  <WindowsConstants.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

$Debug_SB  =  False  ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 

Global  $iMemo 

ʾ��1 () 
ʾ��2 () 

Func ʾ��1 () 

    Local  $hGUI ,  $hIcon ,  $hStatus 
    Local  $aParts [ 4 ]  =  [ 75 ,  150 ,  300 ,  400 ] 
  
  
    ; 
�������� 
    $hGUI  =  GUICreate ( "(ʾ�� 1) StatusBar Tip Text" ,  400 ,  300 ) 
  
  $hStatus  =  _GUICtrlStatusBar_Create  ( $hGUI ,  - 1 ,  "" ,  $SBARS_TOOLTIPS ) 
  
  
    ; 
����memo�ؼ� 
    $iMemo  =  GUICtrlCreateEdit ( "" ,  2 ,  2 ,  396 ,  274 ,  $WS_VSCROLL ) 
    GUICtrlSetFont ( $iMemo ,  9 ,  400 ,  0 ,  "Courier New" ) 
    GUISetState () 

    ; 
���ò��� 
    _GUICtrlStatusBar_SetParts  ( $hStatus ,  $aParts ) 
    _GUICtrlStatusBar_SetText  ( $hStatus ,  "Force tip to be shown when text is more than 
fits in the box" ,  1 ) 

    ; ����ͼ�� 
    $hIcon  =  _WinAPI_LoadShell32Icon  ( 23 ) 
    _GUICtrlStatusBar_SetIcon  ( $hStatus ,  0 ,  $hIcon ) 

    ; �����ı���ʾ 
    _GUICtrlStatusBar_SetTipText  ( $hStatus ,  0 ,  "Tip works when only icon in part or text exceeds 
part" ) 
    _GUICtrlStatusBar_SetTipText  ( $hStatus ,  1 ,  "Force tip to be shown when text is more than fits in the 
box" ) 

    
MemoWrite ( "Hold Mouse Cursor over 
part to see tip."  &  @CRLF ) 

    ; ��ʾ�ı���ʾ 
    MemoWrite ( "Text tip 1 .: "  &  _GUICtrlStatusBar_GetTipText  ( $hStatus ,  0 )  &  @CRLF ) 
    
MemoWrite ( "Text tip 2 .: 
"  &  _GUICtrlStatusBar_GetTipText  ( $hStatus ,  1 )) 

    ; 
ѭ�����û��˳� 
    Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
    ; Free icons 
    _WinAPI_DestroyIcon  ( $hIcon ) 
    GUIDelete () 
EndFunc    ;==>ʾ��1 

Func ʾ��2 () 

    Local  $hGUI ,  $hStatus 
    Local  $aParts [ 4 ]  =  [ 75 ,  150 ,  300 ,  400 ] 
    
    ; 
�������� 
    $hGUI  =  GUICreate ( "(ʾ�� 2) StatusBar Tip Text" ,  400 ,  300 ) 
  
  $hStatus  =  _GUICtrlStatusBar_Create  ( $hGUI ,  - 1 ,  "" ,  $SBARS_TOOLTIPS ) 
  
  
    ; 
����memo�ؼ� 
    $iMemo  =  GUICtrlCreateEdit ( "" ,  2 ,  2 ,  396 ,  274 ,  $WS_VSCROLL ) 
    GUICtrlSetFont ( $iMemo ,  9 ,  400 ,  0 ,  "Courier New" ) 
    GUISetState () 

    ; 
���ò��� 
    _GUICtrlStatusBar_SetParts  ( $hStatus ,  $aParts ) 
    _GUICtrlStatusBar_SetText  ( $hStatus ,  "Force tip to be shown when text is more than 
fits in the box" ,  1 ) 

    ; ����ͼ�� 
    _GUICtrlStatusBar_SetIcon  ( $hStatus ,  0 ,  23 ,  "shell32.dll" ) 

    ; �����ı���ʾ 
    _GUICtrlStatusBar_SetTipText  ( $hStatus ,  0 ,  "Tip works when only icon in part or text exceeds 
part" ) 
    _GUICtrlStatusBar_SetTipText  ( $hStatus ,  1 ,  "Force tip to be shown when text is more than fits in the 
box" ) 

    
MemoWrite ( "Hold Mouse Cursor over 
part to see tip."  &  @CRLF ) 

    ; ��ʾ�ı���ʾ 
    MemoWrite ( "Text tip 1 .: "  &  _GUICtrlStatusBar_GetTipText  ( $hStatus ,  0 )  &  @CRLF ) 
    
MemoWrite ( "Text tip 2 .: 
"  &  _GUICtrlStatusBar_GetTipText  ( $hStatus ,  1 )) 

    ; 
ѭ�����û��˳� 
    Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
    GUIDelete () 
EndFunc    ;==>ʾ��2 

; 
��memo�ؼ�д����Ϣ 
Func MemoWrite ( $sMessage  =  "" ) 
    GUICtrlSetData ( $iMemo ,  $sMessage  &  @CRLF ,  1 ) 
EndFunc    ;==>MemoWrite 



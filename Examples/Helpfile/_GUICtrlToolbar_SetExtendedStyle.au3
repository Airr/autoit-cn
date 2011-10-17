
#include  <GuiToolbar.au3> 
#include  <GuiMenu.au3> 
#include  <GuiConstantsEx.au3> 
#include  <WindowsConstants.au3> 
#include  <Constants.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

$Debug_TB  =  False  ; ��鴫�ݸ�����������, 
����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
Global  $hGUI ,  $iMemo 

_Main () 

Func _Main () 
    Local  $hToolbar 
    Local  Enum  $idNew  =  1000 ,  $idOpen ,  $idSave ,  $idHelp 

    ; �������� 
    $hGUI  =  GUICreate ( "Toolbar" ,  400 ,  300 ) 
    $hToolbar  =  _GUICtrlToolbar_Create ( $hGUI ) 
    _GUICtrlToolbar_SetExtendedStyle ( $hToolbar ,  $TBSTYLE_EX_DRAWDDARROWS ) 
    $iMemo  =  GUICtrlCreateEdit ( "" ,  2 ,  36 ,  396 ,  262 ,  $WS_VSCROLL ) 
    GUICtrlSetFont ( $iMemo ,  10 ,  400 ,  0 ,  "Courier New" ) 
    GUISetState () 

    ; 
��ӱ�׼ϵͳλͼ 
    Switch  _GUICtrlToolbar_GetBitmapFlags ( $hToolbar ) 
    
    Case  0 
            _GUICtrlToolbar_AddBitmap ( $hToolbar ,  1 ,  - 1 ,  $IDB_STD_SMALL_COLOR ) 
        Case  2 
      
      _GUICtrlToolbar_AddBitmap ( $hToolbar ,  1 ,  - 1 ,  $IDB_STD_LARGE_COLOR ) 
    EndSwitch 

    ; ��Ӱ�ť 
    _GUICtrlToolbar_AddButton ( $hToolbar ,  $idNew ,  $STD_FILENEW ,  0 ,  $BTNS_DROPDOWN ) 
  
  _GUICtrlToolbar_AddButton ( $hToolbar ,  $idOpen ,  $STD_FILEOPEN ) 
    _GUICtrlToolbar_AddButton ( $hToolbar ,  $idSave ,  $STD_FILESAVE ) 
  
  _GUICtrlToolbar_AddButtonSep ( $hToolbar ) 
    _GUICtrlToolbar_AddButton ( $hToolbar ,  $idHelp ,  $STD_HELP ) 

  
  ; ��ʾʹ�õ���չ��ʽ 
    
MemoWrite ( "Extended sytles: 
"  &  _GUICtrlToolbar_GetExtendedStyle ( $hToolbar )) 

    ; 
ѭ�����û��˳� 
    GUIRegisterMsg ( $WM_NOTIFY ,  "WM_NOTIFY" ) 

  
  ; ѭ�����û��˳� 
    Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 

EndFunc    ;==>_Main 

; ��memo�ؼ�д����Ϣ 
Func MemoWrite ( $sMessage  =  "" ) 
    GUICtrlSetData ( $iMemo ,  $sMessage  &  @CRLF ,  1 ) 
EndFunc    ;==>MemoWrite 

; TBN_DROPDOWN��Ϣ��� 
Func WM_NOTIFY ( $hWnd ,  $iMsg ,  $iwParam ,  $ilParam ) 
    Local  $tNMHDR ,  $iCode ,  $hMenu 

    $tNMHDR  =  DllStructCreate ( $tagNMHDR ,  $ilParam ) 
    $iCode  =  DllStructGetData ( $tNMHDR ,  "Code" ) 

  
  If  $iCode  =  $TBN_DROPDOWN  Then 
        $hMenu  =  _GUICtrlMenu_CreatePopup () 
        _GUICtrlMenu_AddMenuItem ( $hMenu ,  "Template 1" ,  2000 ) 
    
    _GUICtrlMenu_AddMenuItem ( $hMenu ,  "Template 2" ,  2001 ) 
        _GUICtrlMenu_AddMenuItem ( $hMenu ,  "Template 3" ,  2002 ) 
    
    _GUICtrlMenu_TrackPopupMenu ( $hMenu ,  $hGUI ) 
        _GUICtrlMenu_DestroyMenu ( $hMenu ) 
    EndIf 
    Return  $GUI_RUNDEFMSG 
EndFunc    ;==>WM_NOTIFY 


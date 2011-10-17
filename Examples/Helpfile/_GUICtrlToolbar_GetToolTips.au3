
#include  <GuiToolbar.au3> 
#include  <GuiToolTip.au3> 
#include  <GuiConstantsEx.au3> 
#include  <WindowsConstants.au3> 
#include  <Constants.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

$Debug_TB  =  False  ; ��鴫�ݸ�����������, 
����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
Global  Enum  $idNew  =  1000 ,  $idOpen ,  $idSave ,  $idHelp 

_Main () 

Func _Main () 
    Local  $hGUI ,  $hToolbar ,  $hToolTip 

    ; �������� 
    $hGUI  =  GUICreate ( "Toolbar" ,  400 ,  300 ) 
    $hToolbar  =  _GUICtrlToolbar_Create ( $hGUI ) 
    GUISetState () 

    ; ����������ʾ 
    $hToolTip  =  _GUIToolTip_Create ( $hToolbar ) 
    _GUICtrlToolbar_SetToolTips ( $hToolbar ,  $hToolTip ) 

    ; 
��ӱ�׼ϵͳλͼ 
    Switch  _GUICtrlToolbar_GetBitmapFlags ( $hToolbar ) 
    
    Case  0 
            _GUICtrlToolbar_AddBitmap ( $hToolbar ,  1 ,  - 1 ,  $IDB_STD_SMALL_COLOR ) 
        Case  2 
      
      _GUICtrlToolbar_AddBitmap ( $hToolbar ,  1 ,  - 1 ,  $IDB_STD_LARGE_COLOR ) 
    EndSwitch 

    ; ��Ӱ�ť 
    _GUICtrlToolbar_AddButton ( $hToolbar ,  $idNew ,  $STD_FILENEW ) 
  
  _GUICtrlToolbar_AddButton ( $hToolbar ,  $idOpen ,  $STD_FILEOPEN ) 
    _GUICtrlToolbar_AddButton ( $hToolbar ,  $idSave ,  $STD_FILESAVE ) 
  
  _GUICtrlToolbar_AddButtonSep ( $hToolbar ) 
    _GUICtrlToolbar_AddButton ( $hToolbar ,  $idHelp ,  $STD_HELP ) 

  
  ; ��ʾ��ʾ�ľ�� 
    MsgBox ( 4096 ,  "Information" ,  "ToolTip handle .: 0x"  &  Hex ( _GUICtrlToolbar_GetToolTips ( $hToolbar ))) 

    ; 
ѭ�����û��˳� 
    GUIRegisterMsg ( $WM_NOTIFY ,  "WM_NOTIFY" ) 

  
  ; ѭ�����û��˳� 
    Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 

EndFunc    ;==>_Main 

; 
WM_NOTIFY��Ϣ��� 
Func WM_NOTIFY ( $hWnd ,  $iMsg ,  $iwParam ,  $ilParam ) 
    Local  $tInfo ,  $iID ,  $iCode 

    $tInfo  =  DllStructCreate ( $tagNMTTDISPINFO ,  $ilParam ) 
    $iCode  =  DllStructGetData ( $tInfo ,  "Code" ) 
    If  $iCode  =  $TTN_GETDISPINFO  Then 
        $iID  =  DllStructGetData ( $tInfo ,  "IDFrom" ) 
        Switch  $iID 
    
        Case  $idNew 
      
          DllStructSetData ( $tInfo ,  "aText" ,  "New" ) 
    
        Case  $idOpen 
      
          DllStructSetData ( $tInfo ,  "aText" ,  "Open" ) 
    
        Case  $idSave 
      
          DllStructSetData ( $tInfo ,  "aText" ,  "Save" ) 
    
        Case  $idHelp 
      
          DllStructSetData ( $tInfo ,  "aText" ,  "Help" ) 
    
    EndSwitch 
  
  EndIf 
    Return  $GUI_RUNDEFMSG 
EndFunc    ;==>WM_NOTIFY 


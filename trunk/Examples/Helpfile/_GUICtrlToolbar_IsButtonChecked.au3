
#include  <GuiToolbar.au3> 
#include  <GuiConstantsEx.au3> 
#include  <WindowsConstants.au3> 
#include  <Constants.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

$Debug_TB  =  False  ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 

_Main () 

Func _Main () 
    Local  $hGUI ,  $hToolbar ,  $aStrings [ 4 ] 
    Local  Enum  $idNew  =  1000 ,  $idOpen ,  $idSave ,  $idHelp 

    ; �������� 
    $hGUI  =  GUICreate ( "Toolbar" ,  400 ,  300 ) 
    $hToolbar  =  _GUICtrlToolbar_Create ( $hGUI ) 
    GUISetState () 

    ; ��ӱ�׼ϵͳλͼ 
    Switch  _GUICtrlToolbar_GetBitmapFlags ( $hToolbar ) 
    
    Case  0 
            _GUICtrlToolbar_AddBitmap ( $hToolbar ,  1 ,  - 1 ,  $IDB_STD_SMALL_COLOR ) 
        Case  2 
      
      _GUICtrlToolbar_AddBitmap ( $hToolbar ,  1 ,  - 1 ,  $IDB_STD_LARGE_COLOR ) 
    EndSwitch 

    ; ����ַ��� 
    $aStrings [ 0 ]  =  _GUICtrlToolbar_AddString ( $hToolbar ,  "&New Button" ) 
    $aStrings [ 1 ]  =  _GUICtrlToolbar_AddString ( $hToolbar ,  "&Open Button" ) 
    $aStrings [ 2 ]  =  _GUICtrlToolbar_AddString ( $hToolbar ,  "&Save Button" ) 
    $aStrings [ 3 ]  =  _GUICtrlToolbar_AddString ( $hToolbar ,  "&Help Button" ) 

    ; 
��Ӱ�ť 
    _GUICtrlToolbar_AddButton ( $hToolbar ,  $idNew ,  $STD_FILENEW ,  $aStrings [ 0 ]) 
    _GUICtrlToolbar_AddButton ( $hToolbar ,  $idOpen ,  $STD_FILEOPEN ,  $aStrings [ 1 ]) 
    _GUICtrlToolbar_AddButton ( $hToolbar ,  $idSave ,  $STD_FILESAVE ,  $aStrings [ 2 ]) 
    _GUICtrlToolbar_AddButtonSep ( $hToolbar ) 
    _GUICtrlToolbar_AddButton ( $hToolbar ,  $idHelp ,  $STD_HELP ,  $aStrings [ 3 ]) 

    ; ѡ�б��水ť 
    MsgBox ( 4096 ,  "Information" ,  "Save button is checked: "  &  _GUICtrlToolbar_IsButtonChecked ( $hToolbar ,  $idSave )) 
    _GUICtrlToolbar_CheckButton ( $hToolbar ,  $idSave ) 
    MsgBox ( 4096 ,  "Information" ,  "Save button is checked: "  &  _GUICtrlToolbar_IsButtonChecked ( $hToolbar ,  $idSave )) 

  
  ; ѭ�����û��˳� 
    Do 
  
  Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 

EndFunc    ;==>_Main 


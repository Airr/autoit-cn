 
 #include  <GuiToolbar.au3> 
 #include  <GuiConstantsEx.au3> 
 #include  <WindowsConstants.au3> 
 #include  <Constants.au3> 
 
 Opt ( 'MustDeclareVars' ,  1 ) 
 
 $Debug_TB  =  False  ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 _Main () 
 
 Func _Main () 
     Local  $hGUI ,  $hToolbar ,  $fStyle 
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
 
     ; ��Ӱ�ť 
     _GUICtrlToolbar_AddButton ( $hToolbar ,  $idNew ,  $STD_FILENEW ) 
     _GUICtrlToolbar_AddButton ( $hToolbar ,  $idOpen ,  $STD_FILEOPEN ) 
     _GUICtrlToolbar_AddButton ( $hToolbar ,  $idSave ,  $STD_FILESAVE ) 
     _GUICtrlToolbar_AddButtonSep ( $hToolbar ) 
     _GUICtrlToolbar_AddButton ( $hToolbar ,  $idHelp ,  $STD_HELP ) 
 
     ; �ı�ؼ���� 
     $fStyle  =  _GUICtrlToolbar_GetStyleToolTips ( $hToolbar ) 
     MsgBox ( 4096 ,  "Information" ,  "Toolbar has tooltips style .: "  &  $fStyle ) 
     _GUICtrlToolbar_SetStyleToolTips ( $hToolbar ,  Not  $fStyle ) 
     MsgBox ( 4096 ,  "Information" ,  "Toolbar has tooltips style .: "  &  _GUICtrlToolbar_GetStyleToolTips ( $hToolbar )) 
 
     ; ѭ�����û��˳� 
     Do 
     Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
 
 EndFunc    ;==>_Main 


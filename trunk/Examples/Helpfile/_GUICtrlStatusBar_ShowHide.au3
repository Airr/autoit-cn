 
 #include  <GuiConstantsEx.au3> 
 #include  <GuiStatusBar.au3> 
 
 Opt ( 'MustDeclareVars' ,  1 ) 
 
 $Debug_SB  =  False  ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 _Main () 
 
 Func _Main () 
 
     Local  $hGUI ,  $hStatus 
     Local  $aParts [ 3 ]  =  [ 75 ,  150 ,  - 1 ] 
     
     ; �������� 
     $hGUI  =  GUICreate ( "StatusBar Show/Hide" ,  400 ,  300 ) 
 
     ;=============================================================================== 
     ; Ĭ��Ϊ 1 ����, ���ı� 
     $hStatus  =  _GUICtrlStatusBar_Create  ( $hGUI ) 
     ;=============================================================================== 
     _GUICtrlStatusBar_SetParts  ( $hStatus ,  $aParts ) 
 
     GUISetState () 
 
     MsgBox  ( 4160 ,  "Information" ,  "Hide StatusBar" ) 
     _GUICtrlStatusBar_ShowHide  ( $hStatus ,  @SW_HIDE ) 
     MsgBox  ( 4160 ,  "Information" ,  "Show StatusBar" ) 
     _GUICtrlStatusBar_ShowHide  ( $hStatus ,  @SW_SHOW ) 
 
     ; ѭ�����û��˳� 
     Do 
     Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
     GUIDelete () 
 EndFunc    ;==>_Main 
 


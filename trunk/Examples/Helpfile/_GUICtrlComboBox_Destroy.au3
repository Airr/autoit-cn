 #AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include <GUIComboBox.au3> 
 #include <GuiConstantsEx.au3> 
 #include <Constants.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 $Debug_CB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤�� 
 
 _Main() 
 
 Func _Main() 
   Local $hGUI , $hCombo 
 
   ; �������� 
   $hGUI = GUICreate ( " (UDF Created) ComboBox Destroy ", 400 , 296 ) 
   $hCombo = _GUICtrlComboBox_Create ( $hGUI , "", 2 , 2 , 396 , 296 ) 
   GUISetState () 
 
   ; Add files 
   _GUICtrlComboBox_BeginUpdate ( $hCombo ) 
   _GUICtrlComboBox_AddDir ( $hCombo , "", $DDL_DRIVES , False ) 
   _GUICtrlComboBox_EndUpdate ( $hCombo ) 
 
   ; ������Ͽ� 
   MsgBox ( 4160 , " Information ", " Destroy ComboBox " ) 
   MsgBox ( 4160 , " Information ", " Destroyed: ", & _GUICtrlComboBox_Destroy ( $hCombo)) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
   GUIDelete () 
 EndFunc ;==>_Main 

 #AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include <GUIComboBox.au3> 
 #include <GuiConstantsEx.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 $Debug_CB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤�� 
 
 _Main() 
 
 Func _Main() 
   Local $hCombo 
 
   ; �������� 
   GUICreate ( " ComboBox Replace Edit Sel ", 400 , 296 ) 
   $hCombo = GUICtrlCreateCombo ( Courier New " ) 
   GUISetState () 
 
   ; ���ñ༭����ѡ�е��ı� 
   _GUICtrlComboBox_SetEditText ( $hCombo , " Old Edit Text " ) 
 
   ; ����ļ� 
   _GUICtrlComboBox_BeginUpdate ( $hCombo ) 
   _GUICtrlComboBox_AddDir ( $hCombo , @WindowsDir & " \*.exe " ) 
   _GUICtrlComboBox_EndUpdate ( $hCombo ) 
 
   Sleep ( 500 ) 
 
   ; ���ñ༭����ѡ�е��ı� 
   _GUICtrlComboBox_SetEditSel ( $hCombo , 0 , -1 ) 
 
   Sleep ( 500 ) 
 
   ; ���Ʊ༭���ڵ��ı� 
   _GUICtrlComboBox_ReplaceEditSel ( $hCombo , " New Edit Text " ) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
   GUIDelete () 
 EndFunc ;==>_Main 
 

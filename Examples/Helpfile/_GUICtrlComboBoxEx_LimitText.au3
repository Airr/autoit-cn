 #include <GuiComboBoxEx.au3> 
 #include <GuiConstantsEx.au3> 
 #include <Constants.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 $Debug_CB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 _Main() 
 
 Func _Main() 
   Local $hGUI , $hCombo 
 
   ; �������� 
   $hGUI = GUICreate ( " ComboBoxEx Limit Text ", 400 , 300 ) 
   $hCombo = _GUICtrlComboBoxEx_Create ( $hGUI , "" , 2 , 2 , 394 , 100 ) 
   GUISetState () 
 
   ; ����ļ� 
   _GUICtrlComboBoxEx_BeginUpdate ( $hCombo ) 
   _GUICtrlComboBoxEx_AddDir ( $hCombo , "", $DDL_DRIVES , False ) 
   _GUICtrlComboBoxEx_AddDir ( $hCombo , "", $DDL_DRIVES ) 
   _GUICtrlComboBoxEx_BeginUpdate ( $hCombo ) 
   _GUICtrlComboBoxEx_AddDir ( $hCombo , @WindowsDir & " \*.exe " ) 
   _GUICtrlComboBoxEx_EndUpdate ( $hCombo ) 
   _GUICtrlComboBoxEx_EndUpdate ( $hCombo ) 
 
   ; ���Ʊ༭�ؼ��е��ı� 
   _GUICtrlComboBoxEx_LimitText ( $hCombo , 10 ) 
 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
 EndFunc ;==>_Main 
 

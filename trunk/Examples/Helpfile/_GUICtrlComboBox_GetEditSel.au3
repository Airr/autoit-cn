 #AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include <GUIComboBox.au3> 
 #include <GuiConstantsEx.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 $Debug_CB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤�� 
 
 Global $iMemo 
 
 _Main() 
 
 Func _Main() 
   Local $aSel , $hCombo 
 
   ; �������� 
   GUICreate ( " ComboBoxEx Edit Sel ", 400 , 296 ) 
   $hCombo = GUICtrlCreateCombo ( Courier New " ) 
   GUISetState () 
 
   ; ����ļ� 
   _GUICtrlComboBox_BeginUpdate ( $hCombo ) 
   _GUICtrlComboBox_AddDir ( $hCombo , @WindowsDir & " \*.exe " ) 
   _GUICtrlComboBox_EndUpdate ( $hCombo ) 
 
   ; ѡ����Ŀ 
   _GUICtrlComboBox_SetCurSel ( $hCombo , 2 ) 
 
   ; ���ñ༭ѡ�� 
   _GUICtrlComboBox_SetEditSel ( $hCombo , 0 , 4 ) 
 
   ; ��ȡ�༭ѡ�� 
   $aSel = _GUICtrlComboBox_GetEditSel ( $hCombo ) 
     MemoWrite( StringFormat ( " Edit Sel: %d - %d $aSel [ 0 ] , $aSel [ 1 ])) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
   GUIDelete () 
 EndFunc ;==>_Main 
 
 ; д��memo�ؼ� 
 Func MemoWrite( $sMessage ) 
   GUICtrlSetData ( $iMemo , $sMessage & @CRLF , 1 ) 
 EndFunc ;==>MemoWrite 
 

 #AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include <GUIComboBox.au3> 
 #include <GuiConstantsEx.au3> 
 #include <WindowsConstants.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 $Debug_CB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤�� 
 
 Global $iMemo 
 
 _Main() 
 
 Func _Main() 
   Local $aSel , $hCombo 
 
   ; �������� 
   GUICreate ( " ComboBox Item Height ", 400 , 296 ) 
   $hCombo = GUICtrlCreateCombo ( "", 2 , 2 , 396 , 296 ) 
   $iMemo = GUICtrlCreateEdit ( "", 10 , 50 , 396 , 266 , 0 ) 
   GUICtrlSetFont ( $iMemo , 9 , 400 , 0 , " Courier New " ) 
   GUISetState () 
 
   ; ����ļ� 
   _GUICtrlComboBox_BeginUpdate ( $hCombo ) 
   _GUICtrlComboBox_AddDir ( $hCombo , @WindowsDir & " \*.exe " ) 
   _GUICtrlComboBox_EndUpdate ( $hCombo ) 
 
   ; ��ȡ��Ŀ�߶�(ѡ���ֶ�) 
   MemoWrite( " Item Height (selection field): " & _GUICtrlComboBox_GetItemHeight ( $hCombo )) 
 
   ; ��ȡ��Ŀ�߶�(�б���) 
   MemoWrite( " Item Height (list items): " & _GUICtrlComboBox_GetItemHeight ( $hCombo , 0 )) 
 
   ; ������Ŀ�߶�(ѡ���ֶ�) 
   _GUICtrlComboBox_SetItemHeight ( $hCombo , 18 ) 
 
   ; ������Ŀ�߶�(ѡ���ֶ�) 
   _GUICtrlComboBox_SetItemHeight ( $hCombo , 20 , 0 ) 
 
   ; ��ȡ��Ŀ�߶�(ѡ���ֶ�) 
   MemoWrite( " Item Height (selection field): " & _GUICtrlComboBox_GetItemHeight ( $hCombo )) 
 
   ; ��ȡ��Ŀ�߶�(�б���) 
   MemoWrite( " Item Height (list items): " & _GUICtrlComboBox_GetItemHeight ( $hCombo , 0 )) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
   GUIDelete () 
 EndFunc ;==>_Main 
 
 ; д��memo�ؼ� 
 Func MemoWrite( $sMessage ) 
   GUICtrlSetData ( $iMemo , $sMessage & @CRLF , 1 ) 
 EndFunc ;==>MemoWrite 
 

63
 _GUICtrlComboBox_SetCueBanner     _GUICtrlComboBox_SetCueBanner   
������ʾ����Ͽ�༭�ؼ��е���ʾ��־  
#Include 
<GuiComboBox.au3> 
_GUICtrlComboBox_SetCueBanner($hWnd, $sText) 
 
   
����    
 $hWnd  �ؼ����  
 $sText  �����ı����ַ���  
   
����ֵ �ɹ�: �� 
ʧ��: �� 
   
��ע ��ʾ��־������ѡ��ʱ��ʾ����Ͽ�༭�ؼ��е��ı� 

���ϵͳҪ��: Windows Vista 

 
��� _GUICtrlComboBox_GetCueBanner  
   
 #AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include <GUIComboBox.au3> 
 #include <GuiConstantsEx.au3> 
 #include <WindowsConstants.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 $Debug_CB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤�� 
 
 Global $iMemo 
 
 _Main() 
 
 Func _Main() 
   Local $hCombo 
 
   ; �������� 
   GUICreate ( " ComboBox ", 400 , 296 ) 
   $hCombo = GUICtrlCreateCombo ( Select an Item " ) 
   $iMemo = GUICtrlCreateEdit ( "", 10 , 50 , 376 , 234 , $WS_VSCROLL ) 
   GUICtrlSetFont ( $iMemo , 9 , 400 , 0 , " Courier New " ) 
   GUISetState () 
 
   ; ����ļ� 
   _GUICtrlComboBox_BeginUpdate ( $hCombo ) 
   _GUICtrlComboBox_AddDir ( $hCombo , @WindowsDir & " \*.exe " ) 
   _GUICtrlComboBox_EndUpdate ( $hCombo ) 
 
   MemoWrite( " Cue Banner: " & _GUICtrlComboBox_GetCueBanner ( $hCombo )) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
   GUIDelete () 
 EndFunc ;==>_Main 
 
 ; д��memo�ؼ� 
 Func MemoWrite( $sMessage ) 
   GUICtrlSetData ( $iMemo , $sMessage & @CRLF , 1 ) 
 EndFunc ;==>MemoWrite 
 

 #AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include <GuiConstantsEx.au3> 
 #include <GuiDateTimePicker.au3> 
 
 Opt ( " MustDeclareVars ", 1 ) 
 
 $Debug_DTP = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 _Main() 
 
 Func _Main() 
   Local $hGUI , $HandleBefore , $hDTP 
 
   ; �������� 
   $hGUI = GUICreate ( " (UDF Created) DateTimePick Destroy ", 400 , 300 ) 
   $hDTP = _GUICtrlDTP_Create ( $hGUI , 2 , 6 , 190 ) 
   GUISetState () 
 
   MsgBox ( 4160 , " Information ", " Destroying the Control for Handle: " & $hDTP ) 
   $HandleBefore = $hDTP 
   MsgBox ( 4160 , " Information ", " Control Destroyed: " & _GUICtrlDTP_Destroy ( $hDTP ) & @LF & _ 
       " Handel Before Destroy: " & $HandleBefore & @LF & _ 
       " Handle After Destroy: " & $hDTP ) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
   GUIDelete () 
 EndFunc ;==>_Main 
 

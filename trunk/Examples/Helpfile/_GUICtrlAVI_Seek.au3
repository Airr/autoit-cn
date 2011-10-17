 #include <GuiConstantsEx.au3> 
 #include <GuiAVI.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 $Debug_AVI = False ; ��鴫�ݸ�AVI����������, ����Ϊ�沢������һ�ؼ�����۲��乤�� 
 
 Global $hAVI 
 
 _Example_Internal () 
 _Example_External () 
 
 Func _Example_Internal () 
   Local $hGUI 
 
   ; �������� 
   $hGUI = GUICreate ( " (Internal) AVI Seek ", 300 , 100 ) 
   $hAVI = GUICtrlCreateAvi ( @SystemDir & "\shell32.dll ", 160 , 10 , 10 ) 
   GUISetState () 
 
   ; ѭ�����û��˳� 
   Do 
     Sleep ( 100 ) 
     ; ���Ҽ����е����֡ 
     _GUICtrlAVI_Seek ( $hAVI , Random ( 1 , 30 , 1 )) 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
 
   ; �ر�ӰƬƬ�� 
   _GUICtrlAVI_Close ( $hAVI ) 
 
   GUIDelete () 
 EndFunc ;==>_Main 
 
 Func _Example_External () 
   Local $hGUI 
 
   ; �������� 
   $hGUI = GUICreate ( " (External) AVI Seek ", 300 , 100 ) 
   $hAVI = _GUICtrlAVI_Create ( $hGUI , @SystemDir & "\Shell32.dll ", 160 , 10 , 10 ) 
   GUISetState () 
 
   ; ѭ�����û��˳� 
   Do 
     Sleep ( 100 ) 
     ; ���Ҽ����е����֡ 
     _GUICtrlAVI_Seek ( $hAVI , Random ( 1 , 30 , 1 )) 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
 
   ; �ر�ӰƬƬ�� 
   _GUICtrlAVI_Close ( $hAVI ) 
 
   GUIDelete () 
 EndFunc ;==>_Main 
 

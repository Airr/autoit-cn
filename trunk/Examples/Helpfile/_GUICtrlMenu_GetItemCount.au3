 #include <GuiMenu.au3> 
 
 Opt ( 'MustDeclareVars' , 1 ) 
 
 _Main () 
 
 Func _Main () 
   Local $hWnd , $hMain , $hFile 
 
   ; �򿪼��±� 
   Run ( "Notepad.exe" ) 
   WinWaitActive ( "[CLASS:Notepad]" ) 
   $hWnd = WinGetHandle ( "[CLASS:Notepad]" ) 
   $hMain = _GUICtrlMenu_GetMenu ( $hWnd ) 
   $hFile = _GUICtrlMenu_GetItemSubMenu ( $hMain , 0 ) 
 
   ; ��ʾ���˵���Ŀ���� 
   Writeln ( "Main menu item count: " & _GUICtrlMenu_GetItemCount ( $hMain )) 
 
 EndFunc    ;==>_Main 
 
 ; ����±�д���ı� 
 Func Writeln ( $sText ) 
   ControlSend ( "[CLASS:Notepad]" , "" , "Edit1" , $sText & @CR ) 
 EndFunc    ;==>Writeln 
 

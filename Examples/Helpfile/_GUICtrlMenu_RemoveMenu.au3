 #include <GuiMenu.au3> 
 
 Opt ( 'MustDeclareVars' , 1 ) 
 
 _Main () 
 
 Func _Main () 
   Local $hWnd , $hMain 
 
   ; �򿪼��±� 
   Run ( "Notepad.exe" ) 
   WinWaitActive ( "[CLASS:Notepad]" ) 
   $hWnd = WinGetHandle ( "[CLASS:Notepad]" ) 
   $hMain = _GUICtrlMenu_GetMenu ( $hWnd ) 
 
   ; �Ƴ������˵� 
   _GUICtrlMenu_RemoveMenu ( $hMain , 4 ) 
 
 EndFunc    ;==>_Main 
 

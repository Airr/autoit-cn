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
 
   ; ��鷵��ֵ 
   Writeln ( "Is Menu: " & _GUICtrlMenu_IsMenu ( $hWnd )) 
   Writeln ( "Is Menu: " & _GUICtrlMenu_IsMenu ( $hMain )) 
 
 EndFunc    ;==>_Main 
 
 ; ����±�д��һ�� 
 Func Writeln ( $sText ) 
   ControlSend ( "[CLASS:Notepad]" , "" , "Edit1" , $sText & @CR ) 
 EndFunc    ;==>Writeln 
 

 #include <GuiMenu.au3> 
 
 Opt ( 'MustDeclareVars' , 1 ) 
 
 _Main () 
 
 Func _Main () 
   Local $hWnd , $hMain , $hFile , $tInfo 
 
   ; �򿪼��±� 
   Run ( "Notepad.exe" ) 
   WinWaitActive ( "[CLASS:Notepad]" ) 
   $hWnd = WinGetHandle ( "[CLASS:Notepad]" ) 
   $hMain = _GUICtrlMenu_GetMenu ( $hWnd ) 
   $hFile = _GUICtrlMenu_GetItemSubMenu ( $hMain , 0 ) 
 
   ; ��ȡ/����Open����ID 
   $tInfo = _GUICtrlMenu_GetItemInfo ( $hFile , 1 ) 
     Writeln ( "Open command ID: " & DllStructGetData ( $tInfo , "ID" )) 
   DllStructSetData ( $tInfo , "ID" , 0 ) 
   _GUICtrlMenu_SetItemInfo ( $hFile , 1 , $tInfo ) 
   $tInfo = _GUICtrlMenu_GetItemInfo ( $hFile , 1 ) 
     Writeln ( "Open command ID: " & DllStructGetData ( $tInfo , "ID" )) 
 
 EndFunc   ;==>_Main 
 
 ; ����±�д��һ���ı� 
 Func Writeln ( $sText ) 
   ControlSend ( "[CLASS:Notepad]" , "" , "Edit1" , $sText & @CR ) 
 EndFunc    ;==>Writeln 

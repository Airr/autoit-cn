
#include  <GuiMenu.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

_Main () 

Func _Main () 
    Local  $hWnd ,  $hMain ,  $hFile 

    ; �򿪼��±� 
    Run ( "Notepad.exe" ) 
  
  WinWaitActive ( "[CLASS:Notepad]" ) 
    $hWnd  =  WinGetHandle ( "[CLASS:Notepad]" ) 
    $hMain  =  _GUICtrlMenu_GetMenu ( $hWnd ) 
    $hFile  =  _GUICtrlMenu_GetItemSubMenu ( $hMain ,  0 ) 

    ; ��ȡ/�����ļ�Ĭ���� 
  
  Writeln ( "Open is default: 
"  &  _GUICtrlMenu_GetItemDefault ( $hFile ,  1 )) 
    _GUICtrlMenu_SetItemDefault ( $hFile ,  1 ) 
    
Writeln ( "Open is default: 
"  &  _GUICtrlMenu_GetItemDefault ( $hFile ,  1 )) 

EndFunc    ;==>_Main 

; 
����±�д���ı� 
Func Writeln ( $sText ) 
    ControlSend ( "[CLASS:Notepad]" ,  "" ,  "Edit1" ,  $sText  &  @CR ) 
EndFunc    ;==>Writeln 

  
   

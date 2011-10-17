
#include  <GuiMenu.au3> 
#include  <WinAPI.au3> 
#include  <WindowsConstants.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

_Main () 

Func _Main () 
    Local  $hWnd ,  $hMain ,  $hFile ,  $hBrush 

    ; �򿪼��±� 
    Run ( "Notepad.exe" ) 
  
  WinWaitActive ( "[CLASS:Notepad]" ) 
    $hWnd  =  WinGetHandle ( "[CLASS:Notepad]" ) 
    $hMain  =  _GUICtrlMenu_GetMenu ( $hWnd ) 
    $hFile  =  _GUICtrlMenu_GetItemSubMenu ( $hMain ,  0 ) 

    ; �ļ��˵����� 
    
Writeln ( "File menu background: 
0x"  &  Hex ( _GUICtrlMenu_GetMenuBackground ( $hFile ))) 
    $hBrush  =  _WinAPI_GetSysColorBrush ( $COLOR_INFOBK ) 
  
  _GUICtrlMenu_SetMenuBackground ( $hFile ,  $hBrush ) 
    Writeln ( "File 
menu background: 0x"  &  Hex ( _GUICtrlMenu_GetMenuBackground ( $hFile ))) 

EndFunc    ;==>_Main 

; 
����±�д���ı� 
Func Writeln ( $sText ) 
    ControlSend ( "[CLASS:Notepad]" ,  "" ,  "Edit1" ,  $sText  &  @CR ) 
EndFunc    ;==>Writeln 

  
   


#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 
6 
#include  <GuiEdit.au3> 
#include  <GuiConstantsEx.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

$Debug_Ed  =  False  ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 

_Main () 

Func _Main () 
    Local  $hEdit 

    ; �������� 
    GUICreate ( "Edit Get 
Password Char" ,  400 ,  300 ) 
    $hEdit  =  GUICtrlCreateInput ( "Test of 
build-in control" ,  2 ,  2 ,  394 ,  25 ,  $ES_PASSWORD ) 
  
  GUISetState () 

    MsgBox ( 4096 ,  "Information" ,  "Password Char: 
"  &  _GUICtrlEdit_GetPasswordChar ( $hEdit )) 

    _GUICtrlEdit_SetPasswordChar ( $hEdit ,  "$" )  ; �������ַ���Ϊ$ 
    
    MsgBox ( 4096 ,  "Information" ,  "Password Char: "  &  _GUICtrlEdit_GetPasswordChar ( $hEdit )) 

  
  _GUICtrlEdit_SetPasswordChar ( $hEdit )  ; ��ʾ�û�������ַ� 

    MsgBox ( 4096 ,  "Information" ,  "Password Char: 
"  &  _GUICtrlEdit_GetPasswordChar ( $hEdit )) 

    ; 
ѭ�����û��˳� 
    Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
    GUIDelete () 
EndFunc    ;==>_Main 


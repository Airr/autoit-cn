
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 
6 
#include  <GuiConstantsEx.au3> 
#include  <GuiListView.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

$Debug_LV  =  False  ; ��鴫�ݸ�����������, 
����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 

_Main () 

Func _Main () 
    Local  $aInfo ,  $hListView 
    
    GUICreate ( "ListView Justify Column" ,  400 ,  300 ) 
    $hListView  =  GUICtrlCreateListView ( "" ,  2 ,  2 ,  394 ,  268 ) 
  
  GUISetState () 

    ; 
����� 
    _GUICtrlListView_AddColumn ( $hListView ,  "Column 1" ,  100 ) 
    _GUICtrlListView_AddColumn ( $hListView ,  "Column 2" ,  100 ) 
    _GUICtrlListView_AddColumn ( $hListView ,  "Column 3" ,  100 ) 

    ; �ı��� 
    $aInfo  =  _GUICtrlListView_GetColumn ( $hListView ,  0 ) 
    MsgBox ( 4160 ,  "Information" ,  "Column 1 Justification: "  &  $aInfo [ 0 ]) 
    _GUICtrlListView_JustifyColumn ( $hListView ,  0 ,  2 ) 
    $aInfo  =  _GUICtrlListView_GetColumn ( $hListView ,  0 ) 
    MsgBox ( 4160 ,  "Information" ,  "Column 1 Justification: "  &  $aInfo [ 0 ]) 

    ; ѭ�����û��˳� 
    Do 
  
  Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
    GUIDelete () 
EndFunc    ;==>_Main 


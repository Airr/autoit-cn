
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 
6 
#include  <GuiConstantsEx.au3> 
#include  <GuiListView.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

$Debug_LV  =  False  ; ��鴫�ݸ�����������, 
����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 

_Main () 

Func _Main () 
    Local  $hListView 
    
    GUICreate ( "ListView Get String Width" ,  400 ,  300 ) 
    $hListView  =  GUICtrlCreateListView ( "" ,  2 ,  2 ,  394 ,  268 ,  BitOR ( $LVS_SHOWSELALWAYS ,  $LVS_REPORT )) 
    GUISetState () 

    ; 
����� 
    _GUICtrlListView_AddColumn ( $hListView ,  "Column 1" ,  100 ) 

    ; �����Ŀ 
    _GUICtrlListView_AddItem ( $hListView ,  "Item 1" ) 
    _GUICtrlListView_AddItem ( $hListView ,  "Item 2" ) 
    _GUICtrlListView_AddItem ( $hListView ,  "Item 3" ) 

  
  ; ��ȡ�ַ������ 
    MsgBox ( 4160 ,  "Information" ,  'Width of "Test": '  &  _GUICtrlListView_GetStringWidth ( $hListView ,  "Test" )) 

  
  ; ѭ�����û��˳� 
    Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
    GUIDelete () 
EndFunc    ;==>_Main 


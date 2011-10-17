
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 
6 
#include  <GuiConstantsEx.au3> 
#include  <GuiListView.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

$Debug_LV  =  False  ; ��鴫�ݸ�����������, 
����Ϊ�沢ʹ����һ�ؼ�����۲��乤�� 

_Main () 

Func _Main () 
    Local  $hListView 
    
    GUICreate ( "ListView Arrange" ,  400 ,  300 ) 
    $hListView  =  GUICtrlCreateListView ( "" ,  2 ,  2 ,  394 ,  268 ) 
  
  _GUICtrlListView_SetUnicodeFormat ( $hListView ,  False ) 
    GUISetState () 
    
    ; ����� 
    _GUICtrlListView_InsertColumn ( $hListView ,  0 ,  "Items" ,  100 ) 

    ; ����� 
    _GUICtrlListView_BeginUpdate ( $hListView ) 
    For  $iI  =  1  To  10 
        _GUICtrlListView_AddItem ( $hListView ,  "Item "  &  $iI ) 
    Next 
    _GUICtrlListView_EndUpdate ( $hListView ) 

  
  ; �ƶ���Ŀ 2 
  
  _GUICtrlListView_SetView ( $hListView ,  3 ) 
    _GUICtrlListView_SetItemPosition ( $hListView ,  1 ,  100 ,  100 ) 
    
    MsgBox ( 4160 ,  "Information" ,  "Arranging items" ) 
    _GUICtrlListView_Arrange ( $hListView ) 
  
  
    ; ѭ�����û��˳� 
    Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
    GUIDelete () 
EndFunc    ;==>_Main 


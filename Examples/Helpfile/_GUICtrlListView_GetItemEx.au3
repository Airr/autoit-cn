
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 
6 
#include  <GuiConstantsEx.au3> 
#include  <GuiListView.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

$Debug_LV  =  False  ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 

_Main () 

Func _Main () 
    Local  $tItem ,  $hListView 
    
    GUICreate ( "ListView Get ItemEX" ,  400 ,  300 ) 

    $hListView  =  GUICtrlCreateListView ( "Items" ,  2 ,  2 ,  394 ,  268 ) 
  
  GUISetState () 

    GUICtrlCreateListViewItem ( "Item 1" ,  $hListView ) 
  
  GUICtrlCreateListViewItem ( "Item 2" ,  $hListView ) 
    GUICtrlCreateListViewItem ( "Item 3" ,  $hListView ) 

  
  ; ��ʾ��Ŀ1����Ȼ״̬ 
    $tItem  =  DllStructCreate ( $tagLVITEM ) 
  
  DllStructSetData ( $tItem ,  "Mask" ,  $LVIF_STATE ) 
  
  DllStructSetData ( $tItem ,  "Item" ,  1 ) 
    DllStructSetData ( $tItem ,  "StateMask" ,  - 1 ) 
    _GUICtrlListView_GetItemEx ( $hListView ,  $tItem ) 
    MsgBox ( 4160 ,  "Information" ,  "Item 2 State: "  &  DllStructGetData ( $tItem ,  "State" )) 
    
    ; ѡ����Ŀ 
2 
    _GUICtrlListView_SetItemSelected ( $hListView ,  1 ) 
    
    ; ��ʾ��Ŀ1����Ȼ״̬ 
    _GUICtrlListView_GetItemEx ( $hListView ,  $tItem ) 
    MsgBox ( 4160 ,  "Information" ,  "Item 2 State: "  &  DllStructGetData ( $tItem ,  "State" )) 

  
  ; ѭ�����û��˳� 
    Do 
  
  Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
    GUIDelete () 
EndFunc    ;==>_Main 


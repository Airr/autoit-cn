
#include  <GuiConstantsEx.au3> 
#include  <GuiListView.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

$Debug_LV  =  False  ; ��鴫�ݸ�����������, 
����Ϊ�沢ʹ����һ�ؼ�����۲��乤�� 

; ���治Ҫ��GuiCtrlCreateListViewItem��������Ŀʹ�� 
SetItemParam 
; ��������Ŀ��controlId 

_Main () 

Func _Main () 
    Global  $GUI ,  $iI ,  $hListView 

    ; �������� 
    $GUI  =  GUICreate ( "(UDF Created) ListView Find Param" ,  400 ,  300 ) 
  
  $hListView  =  _GUICtrlListView_Create ( $GUI ,  "" ,  2 ,  2 ,  394 ,  268 ) 
    GUISetState () 

    ; ����� 
    _GUICtrlListView_AddColumn ( $hListView ,  "Items" ,  100 ) 

    ; �����Ŀ 
    _GUICtrlListView_BeginUpdate ( $hListView ) 
    For  $iI  =  1  To  100 
        _GUICtrlListView_AddItem ( $hListView ,  "Item "  &  $iI ) 
    Next 
    _GUICtrlListView_EndUpdate ( $hListView ) 

  
  ; ������Ŀ50�Ĳ���ֵ 
    _GUICtrlListView_SetItemParam ( $hListView ,  49 ,  1234 ) 

    ; ����Ŀ���� 
  
  $iI  =  _GUICtrlListView_FindParam ( $hListView ,  1234 ) 
    MsgBox ( 4160 ,  "Information" ,  "Target Item Index: "  &  $iI ) 
    _GUICtrlListView_EnsureVisible ( $hListView ,  $iI ) 

    ; ѭ�����û��˳� 
  
  Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
    GUIDelete () 
EndFunc    ;==>_Main 


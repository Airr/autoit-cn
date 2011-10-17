
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 
6 
#include  <GuiConstantsEx.au3> 
#include  <GuiListView.au3> 
#include  <Constants.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

$Debug_LV  =  False  ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 

_Main () 

Func _Main () 
    Local  $hListView 
    
    GUICreate ( "ListView Set Text Color" ,  400 ,  300 ) 
    $hListView  =  GUICtrlCreateListView ( "" ,  2 ,  2 ,  394 ,  268 ) 
  
  GUISetState () 

    ; 
������ɫ 
    _GUICtrlListView_SetBkColor ( $hListView ,  $CLR_MONEYGREEN ) 
  
  _GUICtrlListView_SetTextColor ( $hListView ,  $CLR_BLACK ) 
    _GUICtrlListView_SetTextBkColor ( $hListView ,  $CLR_MONEYGREEN ) 

    ; ����� 
    _GUICtrlListView_AddColumn ( $hListView ,  "Items" ,  100 ) 

    ; �����Ŀ 
    _GUICtrlListView_BeginUpdate ( $hListView ) 
  
  For  $iI  =  1  To  10 
        _GUICtrlListView_AddItem ( $hListView ,  "Item "  &  $iI ) 
    Next 
    _GUICtrlListView_EndUpdate ( $hListView ) 

  
  ; ��ʾ��ɫ 
    MsgBox ( 4160 ,  "Information" ,  "Back Color ....: "  &  _GUICtrlListView_GetBkColor ( $hListView )  &  @CRLF  &  _ 
            "Text Color ....: "  &  _GUICtrlListView_GetTextColor ( $hListView )  &  @CRLF  &  _ 
            "Text Back Color: "  &  _GUICtrlListView_GetTextBkColor ( $hListView )) 

  
  ; ѭ�����û��˳� 
    Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
    GUIDelete () 
EndFunc    ;==>_Main 



#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 
6 
#include  <GuiConstantsEx.au3> 
#include  <GuiListView.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

$Debug_LV  =  False  ; ��鴫�ݸ�����������, 
����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 

_Main () 

Func _Main () 
    Local  $iI ,  $iTimer ,  $hListView 

    ; �������� 
    GUICreate ( "ListView Add 
Array" ,  400 ,  300 ) 
    $hListView  =  GUICtrlCreateListView ( "" ,  2 ,  2 ,  394 ,  268 ) 
    _GUICtrlListView_SetUnicodeFormat ( $hListView ,  False ) 
    GUISetState () 

    ; 
����� 
    _GUICtrlListView_AddColumn ( $hListView ,  "Items" ,  100 ) 
    _GUICtrlListView_AddColumn ( $hListView ,  "SubItems 1" ,  100 ) 
    _GUICtrlListView_AddColumn ( $hListView ,  "SubItems 2" ,  100 ) 
    _GUICtrlListView_AddColumn ( $hListView ,  "SubItems 3" ,  100 ) 

    _GUICtrlListView_SetItemCount ( $hListView ,  5000 ) 
    
    ; ����һ�� 
    Dim  $aItems [ 5000 ][ 1 ] 
    For  $iI  =  0  To  UBound ( $aItems )  -  1 
        $aItems [ $iI ][ 0 ]  =  "Item "  &  $iI 
    Next 
    $iTimer  =  TimerInit () 
    _GUICtrlListView_AddArray ( $hListView ,  $aItems ) 
    MsgBox ( 4160 ,  "Information" ,  "Load time: "  &  TimerDiff ( $iTimer )  /  1000  &  " seconds" ) 

    _GUICtrlListView_DeleteAllItems ( GUICtrlGetHandle ( $hListView ))  ; ʹ��UDF�����������п�ʹ��UDF����ɾ�� 

    ; �������� 
    Dim  $aItems [ 5000 ][ 4 ] 
    For  $iI  =  0  To  UBound ( $aItems )  -  1 
        $aItems [ $iI ][ 0 ]  =  "Item 
"  &  $iI 
        $aItems [ $iI ][ 1 ]  =  "Item "  &  $iI  &  "-1" 
        $aItems [ $iI ][ 2 ]  =  "Item 
"  &  $iI  &  "-2" 
        $aItems [ $iI ][ 3 ]  =  "Item "  &  $iI  &  "-3" 
    Next 
    $iTimer  =  TimerInit () 
    _GUICtrlListView_AddArray ( $hListView ,  $aItems ) 
    MsgBox ( 4160 ,  "Information" ,  "Load time: "  &  TimerDiff ( $iTimer )  /  1000  &  " seconds" ) 

    ; 
ѭ�����û��˳� 
    Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
    GUIDelete () 
EndFunc    ;==>_Main  


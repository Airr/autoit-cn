
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 
6 
#include  <GUIListBox.au3> 
#include  <GuiConstantsEx.au3> 
#include  <WindowsConstants.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

$Debug_LB  =  False  ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 

_Main () 

Func _Main () 
    Local  $aTabs [ 4 ]  =  [ 3 ,  100 ,  200 ,  300 ],  $hListBox 

    ; �������� 
    GUICreate ( "List Box Update 
HScroll" ,  400 ,  296 ) 
    $hListBox  =  GUICtrlCreateList ( "" ,  2 ,  2 ,  396 ,  296 ,  BitOR ( $LBS_NOTIFY ,  $LBS_SORT ,  $WS_HSCROLL ,  $WS_VSCROLL )) 
  
  GUISetState () 

    ; 
��ӳ��ַ��� 
    _GUICtrlListBox_AddString ( $hListBox ,  "AutoIt v3 is a freeware BASIC-like scripting language designed for 
automating the Windows GUI." ) 

    ; ��ʾ��ǰˮƽ��չ 
    MsgBox ( 4160 ,  "Information" ,  "Horizontal Extent: "  &  _GUICtrlListBox_GetHorizontalExtent ( $hListBox )) 

  
  ; ����ˮƽ������ 
    _GUICtrlListBox_UpdateHScroll ( $hListBox ) 

    ; 
��ʾ��ǰˮƽ��չ 
    MsgBox ( 4160 ,  "Information" ,  "Horizontal Extent: 
"  &  _GUICtrlListBox_GetHorizontalExtent ( $hListBox )) 

    ; 
ѭ�����û��˳� 
    Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
    GUIDelete () 
EndFunc    ;==>_Main 

  
   

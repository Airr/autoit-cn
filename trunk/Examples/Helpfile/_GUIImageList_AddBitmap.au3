
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 
6 
#include  <GuiConstantsEx.au3> 
#include  <WinAPI.au3> 
#include  <GuiListView.au3> 
#include  <GuiImageList.au3> 
#include  <WindowsConstants.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

_Main () 

Func _Main () 
    Local  $listview ,  $hImage 
    Local  $sPath  =  RegRead ( "HKEY_LOCAL_MACHINE\SOFTWARE\AutoIt 
v3\AutoIt" ,  "InstallDir" )  &  "\ʾ��s\GUI\Advanced\Images" 
    
    GUICreate ( "ImageList 
AddBitmap" ,  400 ,  300 ) 
    $listview  =  GUICtrlCreateListView ( "" ,  2 ,  2 ,  394 ,  268 ,  BitOR ( $LVS_SHOWSELALWAYS ,  $LVS_NOSORTHEADER ,  $LVS_REPORT )) 
    _GUICtrlListView_SetExtendedListViewStyle ( $listview ,  BitOR ( $LVS_EX_FULLROWSELECT ,  $LVS_EX_GRIDLINES ,  $LVS_EX_DOUBLEBUFFER )) 
    GUISetState () 
  
  
    ; 
����ͼ�� 
    $hImage  =  _GUIImageList_Create ( 16 ,  32 ) 
  
  _GUIImageList_AddBitmap ( $hImage ,  $sPath  &  "\Red.bmp" ) 
  
  _GUIImageList_AddBitmap ( $hImage ,  $sPath  &  "\Green.bmp" ) 
  
  _GUIImageList_AddBitmap ( $hImage ,  $sPath  &  "\Blue.bmp" ) 
  
  _GUICtrlListView_SetImageList ( $listview ,  $hImage ,  1 ) 

    ; ����� 
    _GUICtrlListView_AddColumn ( $listview ,  "Items" ,  120 ) 

    ; �����Ŀ 
    _GUICtrlListView_AddItem ( $listview ,  "Item 1" ,  0 ) 
    _GUICtrlListView_AddItem ( $listview ,  "Item 2" ,  1 ) 
    _GUICtrlListView_AddItem ( $listview ,  "Item 3" ,  2 ) 

    ; ѭ�����û��˳� 
    Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
    GUIDelete () 
EndFunc    ;==>_Main 


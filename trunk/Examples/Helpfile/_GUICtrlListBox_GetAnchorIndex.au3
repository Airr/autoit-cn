
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 
6 
#include  <GUIListBox.au3> 
#include  <GuiConstantsEx.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

Opt ( 'MustDeclareVars' ,  1 ) 

_Main () 

Func _Main () 
    Local  $iIndex ,  $hListBox 

    ; �������� 
    GUICreate ( "List Box Get/Set 
Anchor Index" ,  400 ,  296 ) 
    $hListBox  =  GUICtrlCreateList ( "" ,  2 ,  2 ,  396 ,  296 ) 

    GUISetState () 

    ; ����ַ��� 
    _GUICtrlListBox_BeginUpdate ( $hListBox ) 
    For  $iI  =  1  To  9 
        _GUICtrlListBox_AddString ( $hListBox ,  StringFormat ( "%03d : Random 
string" ,  Random ( 1 ,  100 ,  1 ))) 
    Next 
    _GUICtrlListBox_EndUpdate ( $hListBox ) 

  
  ; ����ê���� 
    _GUICtrlListBox_SetAnchorIndex ( $hListBox ,  2 ) 

    ; ��ȡê���� 
    $iIndex  =  _GUICtrlListBox_GetAnchorIndex ( $hListBox ) 
    _GUICtrlListBox_SetCurSel ( $hListBox ,  $iIndex ) 

    ; 
ѭ�����û��˳� 
    Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
    GUIDelete () 
EndFunc    ;==>_Main 


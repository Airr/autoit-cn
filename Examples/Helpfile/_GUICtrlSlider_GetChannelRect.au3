
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 
6 
#include  <GuiConstantsEx.au3> 
#include  <GuiSlider.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

$Debug_S  =  False  ; ��鴫�ݸ�����������, 
����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 

_Main () 

Func _Main () 
    Local  $aRect ,  $hSlider 

    ; �������� 
    GUICreate ( "Slider Get 
Channel Rect" ,  400 ,  296 ) 
    $hSlider  =  GUICtrlCreateSlider ( 2 ,  2 ,  396 ,  20 ,  BitOR ( $TBS_TOOLTIPS ,  $TBS_AUTOTICKS ,  $TBS_ENABLESELRANGE )) 
    GUISetState () 

  
  ; ��ȡͨ������ 
    $aRect  =  _GUICtrlSlider_GetChannelRect ( $hSlider ) 
    
    MsgBox ( 4160 ,  "Information" ,  StringFormat ( "[%d][%d][%d][%d]" ,  $aRect [ 0 ],  $aRect [ 1 ],  $aRect [ 2 ],  $aRect [ 3 ])) 

    ; ѭ�����û��˳� 
    Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
    GUIDelete () 
EndFunc    ;==>_Main 


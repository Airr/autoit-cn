
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 
6 
#include  <GuiConstantsEx.au3> 
#include  <GuiMonthCal.au3> 
#include  <WindowsConstants.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

$Debug_MC  =  False  ; ��鴫�ݸ�MonthCal����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 

_Main () 

Func _Main () 
    Local  $hMonthCal 

    ; �������� 
    GUICreate ( "Month Calendar 
Set Day State" ,  400 ,  300 ) 
    $hMonthCal  =  GUICtrlCreateMonthCal ( "" ,  4 ,  4 ,  - 1 ,  - 1 ,  BitOR ( $WS_BORDER ,  $MCS_DAYSTATE ),  0x00000000 ) 

    ; 
��ȡ֧��������·ݵ�����. ͨ��, ������Ϊ3. 
    Local  $aMasks [ _GUICtrlMonthCal_GetMonthRangeSpan ( $hMonthCal ,  True )] 

    ; ���廯��ǰ�µ�1��, 8�ź�16��. �ý��ʹ��1000 0000 
1000 0001�Ķ����������ʮ�����Ƶ�0x8081. 
    $aMasks [ 1 ]  =  0x8081 
    _GUICtrlMonthCal_SetDayState ( $hMonthCal ,  $aMasks ) 

  
  GUISetState () 

    ; 
ѭ�����û���� 
    Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
    GUIDelete () 
EndFunc    ;==>_Main 


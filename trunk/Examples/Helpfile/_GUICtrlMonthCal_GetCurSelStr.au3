#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include <GuiConstantsEx.au3> 
 #include <GuiMonthCal.au3> 
 #include <WindowsConstants.au3> 
 
 Opt ( 'MustDeclareVars' , 1 ) 
 
 $Debug_MC = False ; ��鴫�ݸ�MonthCal����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 _Main () 
 
 Func _Main () 
   Local $hMonthCal , $msg 
 
   ; �������� 
   GUICreate ( "Month Calendar Get Cur Sel String" , 288 , 188 ) 
   $hMonthCal = GUICtrlCreateMonthCal ( "" , 4 , 4 , - 1 , - 1 , $WS_BORDER , 0x00000000 ) 
   GUISetState () 
 
   ; ��ȡ��ǰѡ�� 
   $msg = Msgbox ("", " Current selection: ", _GUICtrlMonthCal_GetCurSelStr ( $hMonthCal )) 
 
   ; ѭ�����û��˳� 
   Do 
   Until $msg = 1 
   GUIDelete () 
 EndFunc    ;==>_Main 


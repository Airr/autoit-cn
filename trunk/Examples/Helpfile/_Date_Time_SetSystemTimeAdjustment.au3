 
 #include  <GuiConstantsEx.au3> 
 #include  <Date.au3> 
 #include  <WindowsConstants.au3> 
 
 _Main () 
 
 Func _Main () 
     Local  $aInfo 
 
     ; ��ʱ���Ա�۲캯�� 
     Run ( "RunDll32.exe shell32.dll,Control_RunDLL timedate.cpl" ) 
     WinWaitActive ( "Date and Time Properties" ) 
 
     ; ������ǰʱ�� 
     $aInfo  =  _Date_Time_GetSystemTimeAdjustment () 
 
     ; ����ʱ�� 
     MsgBox ( 4096 ,  "Information" ,  "Slowing down system clock" ) 
     _Date_Time_SetSystemTimeAdjustment ( $aInfo [ 1 ]  /  10 ,  False ) 
     Sleep ( 5000 ) 
 
     ; ����ʱ�� 
     MsgBox ( 4096 ,  "Information" ,  "Speeding up system clock" ) 
     _Date_Time_SetSystemTimeAdjustment ( $aInfo [ 1 ]  *  10 ,  False ) 
     Sleep ( 5000 ) 
 
     ; ����ʱ��У�� 
     _Date_Time_SetSystemTimeAdjustment ( $aInfo [ 1 ],  True ) 
     MsgBox ( 4096 ,  "Information" ,  "System clock restored" ) 
 
 EndFunc    ;==>_Main 
 

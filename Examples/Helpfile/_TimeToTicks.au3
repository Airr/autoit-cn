 
 #include  <Date.au3> 
 Global  $Sec ,  $Min ,  $Hour ,  $Time 
 ; ��ʱ����� 
 $StartTicks  =  _TimeToTicks ( @HOUR , @MIN , @SEC ) 
 ; ����45�ֺ� 
 $EndTicks  =  $StartTicks  +  45  *  60  *  1000 
 _TicksToTime ( $EndTicks , $Hour , $Min , $Sec ) 
 MsgBox ( 262144 , ''  ,  'New Time:'  &   $Hour  &  ":"  &  $Min  &  ":"  &  $Sec )  
 


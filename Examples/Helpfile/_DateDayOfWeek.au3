 
 #include  <Date.au3> 
 
 ; ��ȡ������ 
 $sLongDayName  =  _DateDayOfWeek (  @WDAY  ) 
 
 ; ��ȡʡ������ 
 $sShortDayName  =  _DateDayOfWeek (  @WDAY ,  1  ) 
 
 MsgBox (  4096 ,  "Day of Week" ,  "Today is: "  &  $sLongDayName  &  " ("  &  $sShortDayName  &  ")"  ) 
 

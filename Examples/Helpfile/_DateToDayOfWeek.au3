 
 #include  <Date.au3> 
 
 ; �������ڵ��ܵ������ 
 $iWeekday  =  _DateToDayOfWeek  ( @YEAR ,  @MON ,  @MDAY ) 
 ; ��@Wday��ͬ 
 MsgBox ( 4096 ,  "" ,  "Todays WeekdayNumber is: "  &  $iWeekDay ) 
 MsgBox ( 4096 ,  "" ,  "Today is a : "  &  _DateDayOfWeek ( $iWeekDay )) 
 

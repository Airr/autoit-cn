 
 #include  <Date.au3> 
 
 ; ��ȡ������ 
 $sLongMonthName  =  _DateToMonth ( @MON ) 
 
 ; ��ȡ�������� 
 $sShortMonthName  =  _DateToMonth ( @MON ,  1 ) 
 
 MsgBox ( 4096 ,  "Month of Year" ,  "The month is: "  &  $sLongMonthName  &  " ("  &  $sShortMonthName  &  ")" )  


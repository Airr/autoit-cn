 
 #include  <Date.au3> 
 
 ; �����UNIXʱ���(1970/01/01 00:00:00)�������������� 
 $iDateCalc  =  _DateDiff (  's' , "1970/01/01 00:00:00" , _NowCalc ()) 
 MsgBox (  4096 ,  "" ,  "Number of seconds since EPOCH: "  &  $iDateCalc  ) 
 
 ; ��������Ծ�����Сʱ�� 
 $iDateCalc  =  _DateDiff (  'h' , @YEAR  &  "/01/01 00:00:00" , _NowCalc ()) 
 MsgBox (  4096 ,  "" ,  "Number of Hours this year: "  &  $iDateCalc  )  


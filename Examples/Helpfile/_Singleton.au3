 $iFlag  ����ѡ�� 
0 - ��������һʵ��ʱ��-1��Ϊ�˳������˳��ű� 
1 - ���˳��ű��ɺ������� 
2 - ����ϵͳ�е������û���ȡ����. �ڶ��û�������ָ��һ��"Global\"����ǳ�����.    
   
����ֵ �ɹ�: ����ͬ���Ķ���ľ��(a mutex). 
ʧ��: 0 
   
��ע �ɷ��ö�����һ����"Global\"��"Local\"Ϊǰ׺�������ռ���. ���б��2��"Global\"�����ڶ��û������зǳ�����. 
   
ʾ��  
 
 #include  <Misc.au3> 
 if  _Singleton ( "test" , 1 )  =  0  Then 
     Msgbox ( 0 , "Warning" , "An occurence of test is already running" ) 
     Exit 
 EndIf 
 Msgbox ( 0 , "OK" , "the first occurence of test is running" ) 
 


 
 #include  <SQLite.au3> 
 #include  <SQLite.dll.au3> 
 
 Local  $hQuery ,  $aRow ,  $aNames 
 _SQLite_Startup  () 
 _SQLite_Open  ()  ; �� :�ڴ�: ���ݿ� 
 _SQLite_Exec  (- 1 ,  "CREATE table aTest (a,b,c);" ) 
 _SQLite_Exec  (- 1 ,  "INSERT INTO aTest(a,b,c) VALUES ('c','2','World');" ) 
 _SQLite_Exec  (- 1 ,  "INSERT INTO aTest(a,b,c) VALUES ('b','3',' ');" ) 
 _SQLite_Exec  (- 1 ,  "INSERT INTO aTest(a,b,c) VALUES ('a','1','Hello');" ) 
 _SQlite_Query  (- 1 ,  "SELECT ROWID,* FROM aTest ORDER BY a;" ,  $hQuery ) 
 _SQLite_FetchNames  ( $hQuery ,  $aNames )  ; ��ȡ���� 
 MsgBox ( 0 , "SQLite " & _SQLite_LibVersion (), "Row ID is : "  &  StringFormat ( " %-10s  %-10s  %-10s  %-10s " ,  $aNames [ 0 ],  $aNames [ 1 ],  $aNames [ 2 ],  $aNames [ 3 ])  &  @CR ) 
 While  _SQLite_FetchData  ( $hQuery ,  $aRow )  =  $SQLITE_OK  ; һ�λ�ȡһ�� 
     MsgBox ( 0 , "SQLite " & _SQLite_LibVersion (), "Get Data using FetchData : "  &   StringFormat ( " %-10s  %-10s  %-10s  %-10s " ,  $aRow [ 0 ],  $aRow [ 1 ],  $aRow [ 2 ],  $aRow [ 3 ])  &  @CR ) 
     _SQLite_QueryFinalize  ( $hQuery )  ; �⽫ֹͣ��ѯ����ø������ 
 WEnd 
 _SQLite_Exec  (- 1 ,  "DROP table aTest;" ) 
 _SQLite_Close  () 
 _SQLite_Shutdown  () 
 
 ;~ ���: 
 ;~   
 ;~  rowid       a           b           c           
 ;~  3           a           1           Hello      
 


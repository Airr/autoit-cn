 
 #include  <SQLite.au3> 
 #include  <SQLite.dll.au3> 
 
 Local  $aRow 
 _SQLite_Startup  () 
 _SQLite_Open  ()  ; open :memory: Database 
 _SQLite_Exec (- 1 , "CREATE TEMP table settings (key,value);" ) 
 _SQLite_Exec (- 1 , "INSERT INTO settings (key,value) VALUES ('1','setting one');" ) 
 _SQLite_Exec (- 1 , "INSERT INTO settings (key,value) VALUES ('2','setting two');" ) 
 _SQLite_Exec (- 1 , "INSERT INTO settings (key,value) VALUES ('3','setting Three');" ) 
 _SQLite_Exec (- 1 , "INSERT INTO settings (key,value) VALUES ('4','setting Four');" ) 
 _SQLite_QuerySingleRow (- 1 , "SELECT value FROM settings WHERE key = '2' LIMIT 1;" , $aRow )  ; ѡȡ��һ�к͵�һ�ֶ�! 
 MsgBox ( 0 , "setting two - sqlite " & _SQLite_LibVersion () , $aRow [ 0 ]) 
 _SQLite_Close  () 
 _SQLite_Shutdown  () 
 

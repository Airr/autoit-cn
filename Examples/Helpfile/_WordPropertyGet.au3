 ; ******************************************************* 
 ; ����һ��word����, ��һ���ĵ�, ���״̬���Ƿ�ɼ�, 
 ; ����ɼ���ر�, ������ɼ����. 
 ; ******************************************************* 
 
 #include  <Word.au3> 
 $oWordApp  =  _WordCreate  ( @ScriptDir  &  "\Test.doc" ) 
 If  _WordPropertyGet  ( $oWordApp ,  "statusbar" )  Then 
     MsgBox ( 0 ,  "StatusBar Status" ,  "StatusBar Visible, turning it off." ) 
     _WordPropertySet  ( $oWordApp ,  "statusbar" ,  False ) 
 Else 
     MsgBox ( 0 ,  "StatusBar Status" ,  "StatusBar Invisible, turning it on." ) 
     _WordPropertySet  ( $oWordApp ,  "statusbar" ,  True ) 
 EndIf 
 

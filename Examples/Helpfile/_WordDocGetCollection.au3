 ; ******************************************************* 
 ; ʾ�� 1 - �����հ��ĵ���word����, ����ȡ�ĵ��ļ���. 
 ; ******************************************************* 
 #include  <Word.au3> 
 $oWordApp = _WordCreate () 
 _WordDocAdd ( $oWordApp ) 
 $oDocuments = _WordDocGetCollection ( $oWordApp ) 
 MsgBox ( 0 , " Document Count ", @extended ) 
 _WordQuit ( $oWordApp ) 
 

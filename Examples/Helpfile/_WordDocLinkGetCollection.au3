 ; ******************************************************* 
 ; ʾ�� - �����հ��ĵ�����, ���һ�����ӣ�Ȼ���ȡ���Ӽ��� 
 ; ******************************************************* 
 ; 
 #include  <Word.au3> 
 $oWordApp = _WordCreate () 
 $oDoc = _WordDocGetCollection ( $oWordApp , 0 ) 
 _WordDocAddLink ( $oDoc , "", " www.AutoIt3.com ", "", " AutoIt " & @CRLF , " Link to AutoIt " ) 
 $oLinks = _WordDocLinkGetCollection ( $oDoc ) 
 MsgBox ( 0 , " Link Count ", @extended ) 
 

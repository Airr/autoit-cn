 ;******************************************************* 
 ; ʾ�� 1 - ����word����, ���ĵ�, �����ı�, Ĭ��ֵ��ӡ���������˳� 
 ;******************************************************* 
 ; 
 #include  <Word.au3> 
 $oWordApp = _WordCreate ( @ScriptDir & " \Test.doc " ) 
 $oDoc = _WordDocGetCollection ( $oWordApp , 0 ) 
 $oDoc .Range.Text = " This is some text to print. " 
 _WordDocPrint ( $oDoc ) 
 _WordQuit ( $oWordApp , 0 ) 
 
 ;******************************************************* 
 ; ʾ�� 2 - ����word����, ���ĵ�, �����ı�, ��ٴ�ӡ���������˳� 
 ;******************************************************* 
 ; 
 #include  <Word.au3> 
 $oWordApp = _WordCreate ( @ScriptDir & " \Test.doc " ) 
 $oDoc = _WordDocGetCollection ( $oWordApp , 0 ) 
 $oDoc .Range.Text = " This is some text to print. " 
 _WordDocPrint ( $oDoc , 0 , 1 , 1 ) 
 _WordQuit ( $oWordApp , 0 ) 
 
 ;******************************************************* 
 ; ʾ�� 3 - ����word����, ���ĵ�, �����ı�, ��ӡ����Ϊ"My Printer" 
 ;          �Ĵ�ӡ�����������˳�. 
 ;******************************************************* 
 ; 
 #include  <Word.au3> 
 $oWordApp = _WordCreate ( @ScriptDir & " \Test.doc " ) 
 $oDoc = _WordDocGetCollection ( $oWordApp , 0 ) 
 $oDoc .Range.Text = " This is some text to print. " 
 _WordDocPrint ( $oDoc , 0 , 1 , 0 , 1 , " My Printer " ) 
 _WordQuit ( $oWordApp , 0 ) 
 

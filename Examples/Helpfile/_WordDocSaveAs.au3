 ; ******************************************************* 
 ; ʾ�� - ��word�����½��հ��ĵ�, ����ı�, ִ����������Ȼ���˳�. 
 ; ******************************************************* 
 #include  <Word.au3> 
 $oWordApp = _WordCreate () 
 $oDoc = _WordDocGetCollection ( $oWordApp , 0 ) 
 $oDoc.Range.Text = " This is some text to insert. " 
 _WordDocSaveAs ( $oDoc , @ScriptDir & " \Test.doc " ) 
 _WordQuit ( $oWordApp ) 
 

 ; ******************************************************* 
 ; ʾ�� 1 - ����һ��Microsoft Word window ����һ���ĵ� 
 ; ******************************************************* 
 #include <Word.au3> 
 $oWordApp = _WordCreate ( @ScriptDir & " \Test.doc " ) 
 
 ; ******************************************************* 
 ; ʾ�� 2 - ���Խ�һ�����ڵ�word�������ӵ�һ���򿪵�ָ���ļ�. 
 ;         ����������򴴽��´��ڴ��ļ�. 
 ; ******************************************************* 
 #include <Word.au3> 
 $oWordApp = _WordCreate ( @ScriptDir & " \Test.doc ", 1 ) 
 ; ���@extended����ֵ�Բ鿴�����Ƿ�ɹ� 
 If @extended Then 
     MsgBox ( 0 , "", " Attached to Existing Window " ) 
 Else 
     MsgBox ( 0 , "", " Created New Window " ) 
 EndIf 
 
 ; ******************************************************* 
 ; ʾ�� 3 - ����һ�����հ��ĵ���word���� 
 ; ******************************************************* 
 #include <Word.au3> 
 $oWordApp = _WordCreate () 
 
 ; ******************************************************* 
 ; ʾ�� 4 - ����һ�����ص�word���岢��һ���ļ�, 
 ;         ���һЩ�ı��󱣴��˳�. 
 ; ******************************************************* 
 #include <Word.au3> 
 $oWordApp = _WordCreate ( @ScriptDir & " \Test.doc " , 0 , 0 ) 
 $oDoc = _WordDocGetCollection ( $oWordApp , 0 ) 
 $oDoc.Range.insertAfter ( " This is some text to insert. " ) 
 _WordQuit ( $oWordApp , -1 ) 
 

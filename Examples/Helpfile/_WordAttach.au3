 ; **************************************************************** 
 ; ʾ�� 1 - ��word�������ӵ���Ϊ"Test.doc"�Ĵ��ļ�, Ȼ����ʾ�ļ�������·�� 
 ; **************************************************************** 
 #include <Word.au3> 
 $oWordApp = _WordAttach ( "Test.doc" , "FileName" ) 
 If Not @error Then 
   $oDoc = _WordDocGetCollection ( $oWordApp , 0 ) 
   MsgBox ( 64 , "Document FileName" , $oDoc.FullName ) 
 EndIf 
 
 ; **************************************************************** 
 ; ʾ�� 2 - ��word�������ӵ�����"The quick brown fox"�ı����ĵ� 
 ; **************************************************************** 
 #include <Word.au3> 
 $oWordApp = _WordAttach ( "The quick brown fox" , "Text" ) 
 

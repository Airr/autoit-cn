 ; ******************************************************* 
 ; ʾ�� - ����һ��word����, ��һ���ĵ�, ������"Text"����һ�� 
 ;        ��Ϊ"My Macro"�ĺ�, Ȼ�󲻱����˳�. 
 ; ******************************************************* 
 #include <Word.au3> 
 $oWordApp = _WordCreate ( @ScriptDir & , " \Test.doc " ) 
 _WordMacroRun ( $oWordApp , " My Macro ", " Test " ) 
 _WordQuit ( $oWordApp , 0 ) 
 
 

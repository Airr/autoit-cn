 ; ******************************************************* 
 ; ʾ��1 - �򿪴��б�ʾ���������, ��ȡ��ҳ��(����0)�ϵڶ��ű�����ò��������ݶ���2-D���� 
 ; ******************************************************* 
 ; 
 #include  <IE.au3> 
 $oIE = _IE_Example ( " table " ) 
 $otable = _IEtableGetCollection ( $oIE , 0 ) 
 $atableData = _IEtableWriteToArray ( $otable ) 
 
 ; ******************************************************* 
 ; ʾ��2 - �򿪴��б�ʾ���������, ��ȡ�Ա��ϵ����ò���ʾҳ�б������ 
 ; ******************************************************* 
 #include  <IE.au3> 
 $oIE = _IE_Example ( " table " ) 
 $otable = _IEtableGetCollection ( $oIE ) 
 $iNumtables = @extended 
 MsgBox ( 0 , " table Info ", " There are " & $iNumtables & " tables on the page " ) 
 

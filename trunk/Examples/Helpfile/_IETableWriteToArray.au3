 ; ******************************************************* 
 ; ʾ��1 - ��һ�����б�ʾ���������, ��ȡ��ҳ��(����1)�ϵڶ��ű�����ò��������ݶ���2-D���� 
 ; ******************************************************* 
 #include  <IE.au3> 
 $oIE = _IE_Example ( " table " ) 
 $otable = _IEtableGetCollection ( $oIE , 1 ) 
 $atableData = _IEtableWriteToArray ( $otable ) 
 
 ; ******************************************************* 
 ; ʾ��2 - ��ʾ��1��ͬ, ��������ʾ���ʱ��_ArrayDisplay()���������������� 
 ; ******************************************************* 
 #include  <IE.au3> 
 #include  <Array.au3> 
 $oIE = _IE_Example ( " table " ) 
 $otable = _IEtableGetCollection ( $oIE , 1 ) 
 $atableData = _IEtableWriteToArray ( $otable , True ) 
 _ArrayDisplay ( $atableData ) 
 

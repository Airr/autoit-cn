 ; ******************************************************* 
 ; ʾ�� - �򿪻���ʾ���������, ��ȡIDΪ"line1"��DIVԪ�صĶ��������. 
 ;        ������Ԫ�ص�innerText��ʾ������̨. 
 ; ******************************************************* 
 #include <IE.au3> 
 $oIE = _IE_Example ( " basic " ) 
 $oDiv = _IEGetObjById ( $oIE , " line1 " ) 
 MsgBox ( '', ' _IEGetObjById ', _IEPropertyGet ( $oDiv , " innertext " )) 
 

 ; ******************************************************* 
 ; ʾ�� - �򿪴��б�ʾ���������, ��������������ΪĬ��ֵ 
 ; ******************************************************* 
 #include  <IE.au3> 
 $oIE = _IE_Example ( " form " ) 
 $oForm = _IEFormGetObjByName ( $oIE , " Example Form " ) 
 $oText = _IEFormElementGetObjByName ( $oForm , " textExample " ) 
 _IEFormElementSetValue $oText , " Hey! It works! " ) 
 _IEFormReset $oForm ) 
 

ͬ�� , ĳЩ������������Ԫ�ش��ݵ��ύ��ťֵ(���������ڲ�ֹһ���ύ��ť���������ύ��ͬ�Ľ��).
��������޷����,�������������һ����_IEAction()�е�"click"����. 
�������ʹ���Զ���_IELoadWait���������ʱ�� , ������"�ȴ�"����Ϊ0 , ���Ҵӽű��������_IELoadWait , ���ݵ�IE����. 

 
   
��� _IEFormReset , _IEFormGetObjByName , _IEFormGetCollection , _IEFormElementGetObjByName , _IEFormElementGetCollection , _IELoadWait  
   
ʾ��  
 ; ******************************************************* 
 ; ʾ�� 1 - �򿪴���ʾ���������, ��д���ֶβ��ύ 
 ; ******************************************************* 
 ; 
 #include  <IE.au3> 
 $oIE = _IE_Example ( " form " ) 
 $oForm = _IEFormGetObjByName ( $oIE , " Example Form " ) 
 $oText = _IEFormElementGetObjByName ( $oForm , " text Example " ) 
 _IEFormElementSetValue ( $oText , " Hey! It works! " ) 
 _IEFormSubmit ( $oForm ) 
 
 ; ******************************************************* 
 ; ʾ�� 2 - ��ȡָ���������ò�����ֵ. ������, ��Google���������ύ���� 
 ; ******************************************************* 
 ; 
 #include  <IE.au3> 
 $oIE = _IECreate ( " http://www.google.com " ) 
 $oForm = _IEFormGetObjByName ( $oIE , " f " ) 
 $oQuery = _IEFormElementGetObjByName ( $oForm , " q " ) 
 _IEFormElementSetValue ( $oQuery , " AutoIt IE.au3 " ) 
 _IEFormSubmit ( $oForm ) 
 
 ; ******************************************************* 
 ; ʾ�� 3 - ��ȡָ���������ò�����ֵ. ��������ʱ�ֹ�����_IELoadWait. 
 ; ******************************************************* 
 ; 
 #include  <IE.au3> 
 $oIE  = _IECreate ( " http://www.google.com " ) 
 $oForm = _IEFormGetObjByName ( $oIE , " f " ) 
 $oQuery = _IEFormElementGetObjByName ( $oForm , " q " ) 
 _IEFormElementSetValue ( $oQuery , " AutoIt IE.au3 " ) 
 _IEFormSubmit ( $oForm , 0 ) 
 _IELoadWait ( $oIE ) 
 

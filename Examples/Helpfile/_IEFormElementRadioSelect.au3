 ; ******************************************************* 
 ; ʾ��1 - �򿪴��б�ʾ���������, ��ȡ��������, ͨ��ֵѡ��ÿ����ѡ��, Ȼ��ѡ���һ�����δѡ��. 
 ;    ע��: Ϊ�鿴�仯�������Ҫ���¹���ҳ�� 
 ; ******************************************************* 
 #include  <IE.au3> 
 $oIE = _IE_Example ( " form " ) 
 $oForm = _IEFormGetObjByName ( $oIE , " Example Form " ) 
 For $i = 1  To  5 
   _IEFormElementRadioSelect ( $oForm , " vehicleAirplane ", " radio Example ", 1 , " byValue " ) 
   Sleep ( 1000 ) 
   _IEFormElementRadioSelect ( $oForm , " vehicleTrain ", " radio Example ", 1 , " byValue " ) 
   Sleep ( 1000 ) 
   _IEFormElementRadioSelect ( $oForm , " vehicleBoat ", " radio Example ", 1 , " byValue " ) 
   Sleep ( 1000 ) 
   _IEFormElementRadioSelect ( $oForm , " vehicleCar ", " radio Example ", 1 , " byValue " ) 
   Sleep ( 1000 ) 
   _IEFormElementRadioSelect ( $oForm , " vehicleCar ", " radio Example ", 0 , " byValue " ) 
   Sleep ( 1000 ) 
 Next 
 
 ; ******************************************************* 
 ; ʾ��2 - �򿪴��б�ʾ���������, ��ȡ��������, ͨ������ѡ��ÿ����ѡ��, Ȼ��ѡ���һ�����δѡ��. 
 ;    ע��: Ϊ�鿴�仯�������Ҫ���¹���ҳ�� 
 ; ******************************************************* 
 #include  <IE.au3> 
 $oIE = _IE_Example ( " form " ) 
 $oForm = _IEFormGetObjByName ( $oIE , " Example Form " ) 
 For $i = 1 To  5 
   _IEFormElementRadioSelect ( $oForm , 3 , " radio Example ", 1 , " byIndex " ) 
   Sleep ( 1000 ) 
   _IEFormElementRadioSelect ( $oForm , 2 , " radio Example ", 1 , " byIndex " ) 
   Sleep ( 1000 ) 
   _IEFormElementRadioSelect ( $oForm , 1 , " radio Example ", 1 , " byIndex " ) 
   Sleep ( 1000 ) 
   _IEFormElementRadioSelect ( $oForm , 0 , " radio Example ", 1 , " byIndex " ) 
   Sleep ( 1000 ) 
   _IEFormElementRadioSelect ( $oForm , 0 , " radio Example ", 0 , " byIndex " ) 
   Sleep ( 1000 ) 
 Next 
 

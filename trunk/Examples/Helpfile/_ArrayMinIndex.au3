32
 _ArrayMinIndex     _ArrayMinIndex   
������������Сֵ������. 
 
" #Include <Array.au3> 
_ArrayMinIndex(Const ByRef $avArray[, $iCompNumeric = 0[, $iStart = 0[, $iEnd = 0]]]) 
 
   
����    
 $avArray  Ҫ����������  
 $iCompNumeric  [��ѡ] �Ƚϵķ���: 
0 - ����ĸ 
1 - ������  
 $iStart  [��ѡ] ��ʼ����������  
 $iEnd  [��ѡ] ��������������  
   
����ֵ �ɹ�: ���������ֵ������ 
ʧ��: ����-1����@errorΪ: 
    1 - $avArray �������� 
    2 - $iStart ���� $iEnd 
    3 - $avArray ����һά���� 
 
   
���  _ArrayMax , _ArrayMaxIndex , _ArrayMin  
   
 #include <Array.au3> 
 
 Local $avArray = StringSplit ( " 4 , 2 , 06 , 8 , 12 , 5 ", " , " ) 
 
 MsgBox ( 0 , ' Min Index String value ', _ArrayMinIndex ( $avArray , 0 , 1 )) 
 MsgBox ( 0 , ' Min Index Numeric value ', _ArrayMinIndex ( $avArray , 1 , 1 )) 
 

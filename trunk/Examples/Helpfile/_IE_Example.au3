 
#include <IE.au3> 
_IE_Example ( [$s_module = 
"basic"] ) 
 
   
����    
 $s_module  ��ѡ: ָ����������ģ�� 
basic = (Ĭ��)��������, ���Ӻ�ͼƬ�ļ�HTMLҳ 
form = ���ж����Ԫ��(form)�ļ�HTMLҳ 
frameset = ���ж���(frames)�ļ�HTMLҳ 
iframe = ������Ƕ�������(iframes)�ļ�HTMLҳ 
table = ���б�(tables)�ļ�HTMLҳ  
   
����ֵ    
 �ɹ�:  ����ָ��InternetExplorer.Application����Ķ������  
 ʧ��:  ����0 �������� @ERROR  
 @Error:  0 ($_IEStatus_Success) = �޴���  
  5 ($_IEStatus_InvalidValue) = ��Чֵ  
 @Extended:  ������Ч��������  
   
��ע ���������ʾ����HTML��HTMLԪ�ص���ҳ,�������������ļ���IE.au3��ʾ����.��������ڲ���IE.au3��ʱ��Ҳʹ���������. 

 
   
��� _IE_Introduction  
   
ʾ��  
 ; ******************************************************* 
 ; ʾ�� - ��������Ҫ��ʾ��ʾ��ҳ�����������. 
 ;       ���صĶ����������������_IECreate��_IEAttach�����Ķ������ 
 ; ******************************************************* 
 #include <IE.au3> 
 $oIE_basic = _IE_Example ( "basic" ) 
 $oIE_form = _IE_Example ( "form" ) 
 $oIE_table = _IE_Example ( "table" ) 
 $oIE_frameset = _IE_Example ( "frameset" ) 
 $oIE_iframe = _IE_Example ( "iframe" ) 
 

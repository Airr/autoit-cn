#include <IE.au3> 
_IEAttach ( $s_string [, $s_mode = "Title" [, $i_instance = 1]] ) 
 
   
����    
 $s_string  �������ַ��� (���� "embedded" �� "dialogbox", ʹ�ñ����Ӵ����ߴ��ھ��)  
 $s_mode  ��ѡ: ָ������ģʽ 
Title = (Ĭ��t) �����ĵ�������Ӵ� 
WindowTitle = ���ڱ�����Ӵ�(�����ĵ�����) 
URL =��ǰ��ҳ��url����url�Ӵ� 
Text 
      =��ǰ��ҳbody��ǩ�ڵ����ֻ����Ӵ� 
HTML =��ǰ��ҳbody��ǩ�ڵ�HTML�����Ӵ� 
HWND =��������ھ�� 
Embedded =Ƕ����ƴ��ڵľ�����߱����Ӵ� 
DialogBox =ģ̬/��ģ̬�ĶԻ���ľ�����߱����Ӵ� 
Instance = $s_string ������, ������ο�(ͨ��ƥ�������Ӻ���)���з��صĿ��������ʵ�� 
 
 $i_instance  ��ѡ: ��$s_string��$s_modeƥ���1������������������Ƕ�����. 
  ����ע.  
   
����ֵ �ɹ�: ���ط���ָ��InternetExplorer.Application����Ķ������ 
ʧ��: ����0������@ERRORΪ: 
    0 ($_IEStatus_Success) = �޴��� 
    5 ($_IEStatus_InvalidValue) = ��Чֵ 
    7 ($_IEStatus_NoMatch) = ��ƥ�� 
    @Extended: ������Ч�������� 
   
��ע _IEAttach�ṩ�� " dialogbox " �������ӵ������������ģ̬�ͷ�ģ̬�Ի���. Ҫָ������ , ��������ͨ����������������ĶԻ��� , ���������ַ�ʽ���ӺͿ���. �����Щ�Ի�ʵ�����Ǳ�׼�Ĵ��� , ���ҿ���ͨ����ͳAutoIt���ں�������. 
һ�ֿɿ��ķ�ʽ������Щ���͵Ĵ�����ʹ�� " AutoIt������Ϣ " ��������� , ������ڰ���һ����Ϊ " Internet Explorer Server " �Ŀؼ�Ȼ����Ϳ���ʹ�øú������ӵ���,���û�б�׼�����ұ����ô�ͳAutoIt���ں�����������. 
HyperTextApplication(.hta)���ڿ���ʹ�� " embedded " ѡ��. 
 
����ڱ�׼Win*�����Ŀ��õĸ߼����ڱ���ѡ���﷨�������滻 " dialogbox " �� " embedded " ģʽ�ı����Ӵ�. 
 
" embedded " ģʽ�� " $i_instance " ��ʹ��: ���ڷ���WebBrowser��ָ��ʵ���������ر��Ƕ������ض������к��ж��ʵ��ʱ. ���ʹ����Ƕģʽ��$s_string���ݵ����ڱ��� , ����׸�����ƥ�����. ��������WebBrowser����һ����������봫�ݴ����������Ǳ��� , ��ʹ������ڱ�׼Win*�����Ŀ��õĸ߼����ڱ���ѡ���﷨. 
 
�� " embedded " ģʽ����� " $i_instance " ��ʹ��: ���ڷ�����$s_string��$s_modeƥ������д������е�һ�������������. Instance order for DialogBoxģʽͨ����ƥ������WinList()���ص�˳�����. ��������ģʽ��ʵ��˳����Shell.Windows������. 
 
��ʹ�� " hwnd " ģʽ���� " DialogBox " ģʽ��ʹ����$s_string����HWndʱ , ��� " $i_instance " >1�򽫱�����Ϊ1����ʾ������Ϣ. 
 
DialogBox��Embeddedģʽ�����ڻ�ȡ��׼��������� , �����صĶ�����that������еĶ��㴰�ڶ�����InternetExplorer����. 
Window���󲻾���InternetExplorer�������������(��״̬�ı� , ��ַ����). 
���� , ����IE7��ʹ�ñ�ǩҳ�����һ��������ʹ����_IENavigate�ĺ��������յ�COM����. 
�÷������ڲ��������ʵ�������� , ���Ƽ��Բ�ͬģʽ����InternetExplorer��������Ĵ���������Ϣʹ��_IEAttach. 
 
   
���  _IECreate , _IECreateEmbedded , _IEQuit  
   
ʾ��  
 ; ******************************************************* 
 ; ʾ��1 - �򿪱���Ϊ"AutoIt"�����������ʾ��ַ 
 ; ******************************************************* 
 #include  <IE.au3> 
 $oIE = _IEAttach ( " AutoIt " ) 
 MsgBox ( 0 , " The URL ", _IEPropertyGet ( $oIE , " locationurl " )) 
 
 ; ******************************************************* 
 ; ʾ��2 - �򿪶����ĵ��а���"The quick brown fox"�ı�������� 
 ; ******************************************************* 
 #include  <IE.au3> 
 $oIE = _IEAttach ( " The quick brown fox ", " text " ) 
 
 ; ******************************************************* 
 ; ʾ��3 - ����Ƕ����һ�����е�������ؼ� 
 ; ******************************************************* 
 ; 
 #include  <IE.au3> 
 $oIE = _IEAttach ( " A Window Title ", " embedded " ) 
 
 ; ******************************************************* 
 ; ʾ��4 - �򿪵�������Ƕ����һ�����е�������ؼ� 
 ;        ʹ�ø߼����ڱ����﷨��ʹ�õڶ��������д���'ICQ'�ַ����Ĵ��� 
 ; ******************************************************* 
 #include  <IE.au3> 
 $oIE = _IEAttach ( " [REGEXPTITLE:ICQ; INSTANCE:2] ", " embedded ", 3 ) 
 
 ; ******************************************************* 
 ; ʾ��5 - ������ǰ������������õ�ʵ�����������. �����׸�Ԫ��Ϊʵ������ 
 ; ******************************************************* 
 ; 
 #include  <IE.au3> 
 
 Dim $aIE [ 1 ] 
 $aIE [ 0 ] = 0 
 
 $i = 1 
 While 1 
   $oIE = _IEAttach ( " ", " instance ", $i ) 
   If @error = $_IEStatus_NoMatch Then ExitLoop 
   ReDim $aIE [ $i + 1 ] 
   $aIE [ $i ] = $oIE 
   $aIE [ 0 ] = $i 
   $i += 1 
 WEnd 
 
 MsgBox ( 0 , " Browsers Found ", " Number of browser instances in the array:  " & $aIE [ 0 ]) 
 

�ú���֧��������Ч��VISA������ , ����GPIB , TCP , VXI�ʹ���װ��(ASRL). 
VISA����������ϸ���Ϳɲο���ע����. 
��Ϊ��ݷ�ʽҲ��ʹ�ð���GPIB�豸��ַ�ŵ��ַ���(��"20")�����������������(�� , "GPIB::20::0") 
* INTEGER -> VISA�Ự�������_viOpen���ص�����ֵ. 
����ƻ��ظ���ϵ�豸��װ�ý���ʹ��_viOpen��VISA�Ự�������������, 
�����ε���ϵ�豸�ᵼ�´򿪺͹ر���ϵ���ӵĶ��⿪��. 
һ���豸ʹ����ϼ�סʹ��_viClose�ر�����.   
 $s_command  ִ�е�����/��ѯ(��"*IDN?"��"SOURCE:POWER -20 dBM") 
��ѯ�������һ���ʺ�QUESTION���(?) 
������Ϊ��ѯʱ�����Զ��ȴ��豸Ӧ��(�������ʱ)   
 $i_timeout_ms  ��ѡ: �����ĺ��볬ʱ. 
ֻ���ڲ�ѯ����Ҫ. 
��Ϊ��ѡ����. 
���δָ����ʹ��������õĳ�ʱ. �����δ���ù���ʹ��Ĭ��ֵ(������VISA����). 
��ʱҲ����_viSetTimeout������������. 
������������(GPIB , TCP , ��)��ʱ�����޷�����ΪҪ��ľ�ȷֵ. ȡ����֮ʹ�ñ���Ҫ��ĳ�ʱֵ�Դ����ӽ�����Чֵ.    
   
����ֵ ����ֵ�����������Ƿ���һ����ѯ�������Ƿ�ɹ�. 
* ����, �޲�ѯ: 
  
 �ɹ�:  ����0   
 ʧ��:  ����޷���VISA DLL����-1   
  ���ʾVISA�������ķ�0ֵ   
  (�μ�VISA����Ա��)   * ��ѯ: 
  
 �ɹ�:  �����豸�Բ�ѯ��Ӧ��   
 ʧ��:  ����޷���VISA DLL����-1   
  ��VISA DLL�������������Ľ��ʱ����-3   
  ���ʾVISA�������ķ�0ֵ   
  (�μ�VISA����Ա��)   �ú���ͨ���ڳ���ʱ����@errorΪ1. 
 
   
��ע * VISA��ѯֻ�����豸Ӧ�������. ����������ⲻ������ , ��Ϊ�����豸��Ӧ��ֻ��һ��. 
 
* �����ǳ���VISA������������ 
ע�⻹�и�������. ������Ϣ��ο�VISA����Ա��(��www.ni.com��) 
��ѡ�����÷����ű�ʶ([]). 
�������Ĳ����Լ����ű��(<>). 
 
  
 �ӿ�  �﷨   ------------------------------------------------------------------------------- 
  
 GPIB INSTR  GPIB[board]::primary address[::secondary address][::INSTR]   
 GPIB INTFC  GPIB[board]::INTFC   
 TCPIP SOCKET  TCPIP[board]::host address::port::SOCKET   
 Serial INSTR  ASRL[board][::INSTR]   
 PXI INSTR  PXI[board]::device[::function][::INSTR]   
 VXI INSTR  VXI[board]::VXI logical address[::INSTR]   
 GPIB-VXI INSTR  GPIB-VXI[board]::VXI logical address[::INSTR]   
 TCPIP INSTR  TCPIP[board]::host address[::LAN device name][::INSTR]   GPIB�ؼ�������GPIB���� 
TCPIP�ؼ�������TCP/IP��ϵ. 
ASRL�ؼ������ڴ�������. 
PXI�ؼ�������PXI����. 
VXI�ؼ���ͨ�����û�MXI���߿���������VXI����. 
GPIB-VXI�ؼ���ͨ��GPIB-VXI����������VXI����. 
 
��������ʾ��Ϊ��ѡ������Ĭ��ֵ. 
 
��ѡ����                  Ĭ��ֵ 
--------------------------------------- 
board                     0 
secondary address         none 
LAN device name           inst0 
 
��Դ�ַ���ʾ��: 
----------------------------------------------------------------------- 
  
 GPIB::1::0::INSTR  ��ַ1����GPIB�豸��GPIB�ӿ�0�еĴ�Ҫ��ַ0   
 GPIB2::INTFC  GPIB�ӿ�2�Ľӿڻ�ԭʼ��Դ   
 TCPIP0::1.2.3.4::999::SOCKET  ָ��ָ��IP��ַ�϶˿�999��ԭʼTCP/IP   
 ASRL1::INSTR  ���ӵ��ӿ�ASRL1�Ĵ����豸. VXI::MEMACCָ��VXI�ӿڵİ弶�Ĵ���.   
 PXI::15::INSTR  ����0�ϵ�PXI�豸��15   
 VXI0::1::INSTR  VXI�ӿ�VXI0���߼���λ1����VXI�豸   
 GPIB-VXI::9::INSTR  GPIB-VXI�ܿ�ϵͳ���߼���ַ9����VXI�豸    
   
���  _viFindGpib , _viOpen , _viClose , _viSetTimeout , _viGTL , _viGpibBusReset , _viSetAttribute  
   
ʾ��  
 
 ;-���轫�������õ�GPIB��ַ3 
 ; ���һ���豸�в�ͬ��ַʱ��"GPIB::3::0"�ı�Ϊ��Ӧ��������. 
 ; �͵���_viOpen��ͬ 
 ; �ֱ���ʾ�ڶ���ģʽ�¼���_viOpen��_viClose��ϵ�ģʽ�����ʹ��_viExecCommand����. 
 ; Ҳ����ʾ_viGTL���� 
 
 #include  <Visa.au3> 
 
 Dim  $h_session  =  0 
 
 ; ��ѯGPIB��ַ3����������� 
 MsgBox ( 0 ,  "Step 1" ,  "Simple GPIB query using a VISA Descriptor" ) 
 Dim  $s_answer  =  _viExecCommand ( "GPIB::3::0" ,  "*IDN?" ,  10000 )  ; 10�볬ʱ 
 MsgBox ( 0 ,  "GPIB QUERY result" ,  $s_answer )  ; ��ʾӦ�� 
 
 MsgBox ( 0 ,  "Step 2" ,  "Go to LOCAL using VISA Descriptor" ) 
 _viGTL ( "GPIB::1::0" )  ; ת������(�˳�Զ�̿���ģʽ) 
 
 MsgBox ( 0 ,  "Step 3" ,  "Simple GPIB query using a VISA address shortcut" ) 
 $s_answer  =  _viExecCommand ( "1" ,  "*IDN?" )  ; ��ַ�������ַ��� 
 MsgBox ( 0 ,  "GPIB QUERY result" ,  $s_answer )  ; ��ʾӦ�� 
 MsgBox ( 0 ,  "Info" ,  "Now let's use _viOpen and _viClose" ) 
 
 MsgBox ( 0 ,  "Step 4" ,  "Open the instrument connection with _viOpen" ) 
 Dim  $h_instr  =  _viOpen ( 3 ) 
 MsgBox ( 0 ,  "Instrument Handle obtained" ,   "$h_instr = "  &  $h_instr )  ; ��ʾ�Ự��� 
 ; ��ѯ���� 
 
 MsgBox ( 0 ,  "Step 5" ,  "Query the instrument using the VISA instrument handle" ) 
 $s_answer  =  _viExecCommand ( $h_instr ,  "*IDN?" )  ; $h_instr��ǰ�����ַ���! 
 MsgBox ( 0 ,  "GPIB QUERY result" ,  $s_answer )  ; ��ʾӦ�� 
 ; ���²�ѯ. �����ٴδ����� 
 
 MsgBox ( 0 ,  "Step 6" ,  "Query again. There is no need to OPEN the link again" ) 
 $s_answer  =  _viExecCommand ( $h_instr ,  "*IDN?" ) 
 MsgBox ( 0 ,  "GPIB QUERY result" ,  $s_answer )  ; ��ʾӦ�� 
 
 MsgBox ( 0 ,  "Step 7" ,  "Go to LOCAL using VISA instrument handle" ) 
 _viGTL ( $h_instr ) ; ת������(��ѡ) 
 
 MsgBox ( 0 ,  "Step 8" ,  "Close the Instrument connection using _viClose" ) 
 _viClose ( $h_instr )  ; �ر��������� 
 

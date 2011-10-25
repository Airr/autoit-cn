;-���轫�������õ�GPIB��ַ3
; ���һ���豸�в�ͬ��ַʱ��"GPIB::3::0"�ı�Ϊ��Ӧ��������.
; �͵���_viOpen��ͬ
; �ֱ���ʾ�ڶ���ģʽ�¼���_viOpen��_viClose��ϵ�ģʽ�����ʹ��_viExecCommand����.
; Ҳ����ʾ_viGTL����

#include  <Visa.au3>

Dim $h_session = 0

; ��ѯGPIB��ַ3�����������
msgbox(0, "Step 1", "Simple GPIB query using a VISA Descriptor")
Dim $s_answer = _viExecCommand("GPIB::3::0", "*IDN?", 10000) ; 10�볬ʱ
msgbox(0, "GPIB QUERY result", $s_answer) ; ��ʾӦ��

msgbox(0, "Step 2", "Go to LOCAL using VISA Descriptor")
_viGTL("GPIB::1::0") ; ת������(�˳�Զ�̿���ģʽ)

msgbox(0, "Step 3", "Simple GPIB query using a VISA address shortcut")
$s_answer = _viExecCommand("1", "*IDN?") ; ��ַ�������ַ���
msgbox(0, "GPIB QUERY result", $s_answer) ; ��ʾӦ��
msgbox(0, "Info", "Now let's use _viOpen and _viClose")

msgbox(0, "Step 4", "Open the instrument connection with _viOpen")
Dim $h_instr = _viOpen(3)
msgbox(0, "Instrument Handle obtained", "$h_instr =" & $h_instr) ; ��ʾ�Ự���
; ��ѯ����

msgbox(0, "Step 5", "Query the instrument using the VISA instrument handle")
$s_answer = _viExecCommand($h_instr, "*IDN?") ; $h_instr��ǰ�����ַ���!
msgbox(0, "GPIB QUERY result", $s_answer) ; ��ʾӦ��
; ���²�ѯ. �����ٴδ�����

msgbox(0, "Step 6", "Query again. There is no need to OPEN the link again")
$s_answer = _viExecCommand($h_instr, "*IDN?")
msgbox(0, "GPIB QUERY result", $s_answer) ; ��ʾӦ��

msgbox(0, "Step 7", "Go to LOCAL using VISA instrument handle")
_viGTL($h_instr) ; ת������(��ѡ)

msgbox(0, "Step 8", "Close the Instrument connection using _viClose")
_viClose($h_instr) ; �ر���������


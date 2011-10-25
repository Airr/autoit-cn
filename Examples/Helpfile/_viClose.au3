
;-���轫�������õ�GPIB��ַ1
; �ֱ���ʾ�ڶ���ģʽ�¼���_viOpen��_viClose��ϵ�ģʽ�����ʹ��_viExecCommand����.
; Ҳ����ʾ_viGTL����

#include  <Visa.au3>

Dim $h_session = 0

; ��ѯGPIB��ַ3�����������
msgbox(0, "Step 1", "Open the instrument connection with _viOpen")
Dim $h_instr = _viOpen("GPIB::3::0")
msgbox(0, "Instrument Handle obtained", "$h_instr =" & $h_instr) ; ��ʾ�Ự���
; ��ѯ����

msgbox(0, "Step 2", "Query the instrument using the VISA instrument handle")
$s_answer = _viExecCommand($h_instr, "*IDN?") ; $h_instr��ǰ�����ַ���!
msgbox(0, "GPIB QUERY result", $s_answer) ; ��ʾӦ��
; ���²�ѯ. �����ٴδ�����

msgbox(0, "Step 3", "Query again. There is no need to OPEN the link again")
$s_answer = _viExecCommand($h_instr, "*IDN?")
msgbox(0, "GPIB QUERY result", $s_answer) ; ��ʾӦ��

msgbox(0, "Step 4", "Close the instrument connection using _viClose")
_viClose($h_instr) ; �ر���������


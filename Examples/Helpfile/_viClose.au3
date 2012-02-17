;- �����������װ�������� GPIB ��ַ 1
; ��������ʾ���ʹ�� _viExecCommand ����, �ڵ���ģʽ����
; _viOpen �� _viClose �����.
; ������Ҳչʾ�� _viGTL ����

#include <Visa.au3>

Local $h_session = 0

; ��ѯ�� GPIB ��ַ 3 ������ ID
MsgBox(4096, "Step 1", "Open the instrument connection with _viOpen")
Local $h_instr = _viOpen("GPIB::3::0")
MsgBox(4096, "Instrument Handle obtained", "$h_instr = " & $h_instr) ; ��ʾ�Ự���
; ��ѯ����

MsgBox(4096, "Step 2", "Query the instrument using the VISA instrument handle")
Local $s_answer = _viExecCommand($h_instr, "*IDN?") ; $h_instr ���ڲ����ַ���!
MsgBox(4096, "GPIB QUERY result", $s_answer) ; ��ʾӦ��
; �ٴβ�ѯ. ����Ҫ�ٴδ�����

MsgBox(4096, "Step 3", "Query again. There is no need to OPEN the link again")
$s_answer = _viExecCommand($h_instr, "*IDN?")
MsgBox(4096, "GPIB QUERY result", $s_answer) ; ��ʾӦ��

MsgBox(4096, "Step 4", "Close the instrument connection using _viClose")
_viClose($h_instr) ; �ر���������

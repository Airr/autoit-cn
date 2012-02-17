;- �����������װ�������� GPIB ��ַ 3.
; �������������װ���˲�ͬ�ĵ�ַ, ��ı� "GPIB::3::0" Ϊ
; ��Ӧ������. ���ж� _viOpen ����ͬ����
; ��������ʾ�����ʹ�ú���ʱ�� _viExecCommand ���������
; ���� _viSetTimeout ����.

#include <Visa.au3>

Local $h_session = 0

; ��ѯ�� GPIB ��ַ 3 ������ ID
MsgBox(4096, "Step 1", "Simple GPIB query with explicit TIMEOUT set")
Local $s_answer = _viExecCommand("GPIB::3::0", "*IDN?", 10000) ; ��ʱΪ 10 ��
MsgBox(4096, "GPIB QUERY result", $s_answer) ; ��ʾӦ��

; �����൱������ʹ�� _viSetTimeout ����:
MsgBox(4096, "Step 2", "_vOpen + timeout using _viSetTimeout + GPIB query")
Local $h_instr = _viOpen(3)
_viSetTimeout($h_instr, 10000) ; 10000 ���� = 10 ��
$s_answer = _viExecCommand($h_instr, "*IDN?") ; ���ڲ���Ҫ���ó�ʱ
MsgBox(4096, "GPIB QUERY result", $s_answer) ; ��ʾӦ��

MsgBox(4096, "Step 3", "Close the Instrument connection using _viClose")
_viClose($h_instr) ; �ر���������

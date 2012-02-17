;- �����������װ�������� GPIB ��ַ 3
; �������������װ���˲�ͬ�ĵ�ַ, ��ı� "GPIB::3::0" Ϊ
; ��Ӧ������. ���ж� _viOpen ����ͬ����
; ��������ʾ���ʹ�� _viExecCommand ����, �ڵ���ģʽ����
; _viOpen �� _viClose �����.
; ������Ҳչʾ�� _viGTL ����

#include <Visa.au3>

Local $h_session = 0

; ��ѯ�� GPIB ��ַ 3 ������ ID
MsgBox(4096, "Step 1", "Simple GPIB query using a VISA Descriptor")
Local $s_answer = _viExecCommand("GPIB::3::0", "*IDN?", 10000) ; ��ʱΪ 10 ��
MsgBox(4096, "GPIB QUERY result", $s_answer) ; ��ʾӦ��

MsgBox(4096, "Step 2", "Go to LOCAL using VISA Descriptor")
_viGTL("GPIB::1::0") ; ������ (�˳�Զ�̿���ģʽ)

MsgBox(4096, "Step 3", "Simple GPIB query using a VISA address shortcut")
$s_answer = _viExecCommand("1", "*IDN?") ; �˵�ַ�������ַ���
MsgBox(4096, "GPIB QUERY result", $s_answer) ; ��ʾӦ��
MsgBox(4096, "Info", "Now let's use _viOpen and _viClose")

MsgBox(4096, "Step 4", "Open the instrument connection with _viOpen")
Local $h_instr = _viOpen(3)
MsgBox(4096, "Instrument Handle obtained", "$h_instr = " & $h_instr) ; ��ʾ�Ự���
; ��ѯ����

MsgBox(4096, "Step 5", "Query the instrument using the VISA instrument handle")
$s_answer = _viExecCommand($h_instr, "*IDN?") ; $h_instr ���ڲ����ַ���!
MsgBox(4096, "GPIB QUERY result", $s_answer) ; ��ʾӦ��
; �ٴβ�ѯ. ����Ҫ�ٴδ�����

MsgBox(4096, "Step 6", "Query again. There is no need to OPEN the link again")
$s_answer = _viExecCommand($h_instr, "*IDN?")
MsgBox(4096, "GPIB QUERY result", $s_answer) ; ��ʾӦ��

MsgBox(4096, "Step 7", "Go to LOCAL using VISA instrument handle")
_viGTL($h_instr); ������ (���ǿ�ѡ��)

MsgBox(4096, "Step 8", "Close the Instrument connection using _viClose")
_viClose($h_instr) ; �ر���������

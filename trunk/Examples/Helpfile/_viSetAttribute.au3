
;-���轫�������õ�GPIB��ַ3
; ���һ���豸�в�ͬ��ַʱ��"GPIB::3::0"�ı�Ϊ��Ӧ��������.
; �͵���_viOpen��ͬ
; ������ʾ���ʹ��_viSetAttribute. ������ʹ��_viSetAttribute����_viSetTimeout����һ��_viExecCommand������GPIB��ʱ.

#include  <Visa.au3>

Dim $h_session = 0

; ��ѯGPIB��ַ3�����������
msgbox(0, "Step 1", "Simple GPIB query with explicit TIMEOUT set")
Dim $s_answer = _viExecCommand("GPIB::3::0", "*IDN?", 10000) ; 10����ʱ
msgbox(0, "GPIB QUERY result", $s_answer) ; ��ʾӦ��

; ������ʹ��_viSetAttribute������ͬ:
msgbox(0, "Step 2", "_vOpen + timeout using _viSetAttribute + GPIB query")
Dim $h_instr = _viOpen(3)
; ע - ��_viSetTimeout($h_instr ,  10000)��ͬ
_viSetAttribute($h_instr, $VI_ATTR_TMO_VALUE, 10000) ; 10000 ms = 10 secs

$s_answer = _viExecCommand($h_instr, "*IDN?") ; Ŀǰ����������ʱ
msgbox(0, "GPIB QUERY result", $s_answer) ; ��ʾӦ��

msgbox(0, "Step 3", "Close the Instrument connection using _viClose")
_viClose($h_instr) ; �ر���������


; *******************************************************
; ʾ�� 1 - �򿪺���ʾ���������, ��ȡ��
;				ҳ�����׸�������� (���� 0) ����ȡ�����������ݵ�һ����ά����
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("table")
Local $oTable = _IETableGetCollection($oIE, 0)
Local $aTableData = _IETableWriteToArray($oTable)

; *******************************************************
; ʾ�� 2 - �򿪺���ʾ���������, ��ȡ��
;				���ϵ����ò���ʾҳ���ϱ����Ŀ
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("table")
$oTable = _IETableGetCollection($oIE)
Local $iNumTables = @extended
MsgBox(4096, "Table Info", "There are " & $iNumTables & " tables on the page")

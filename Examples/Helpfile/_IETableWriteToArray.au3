; *******************************************************
; ʾ��1 - ��һ�����б�ʾ���������, 
;				��ȡ��ҳ��(����1)�ϵڶ��ű�����ò��������ݶ���2-D����
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("table")
Local $oTable = _IETableGetCollection($oIE, 1)
Local $aTableData = _IETableWriteToArray($oTable)

; *******************************************************
; ʾ��2 - ��ʾ��1��ͬ, ��������ʾ���ʱ��
;				_ArrayDisplay()����������������
; *******************************************************

#include <IE.au3>
#include <Array.au3>

$oIE = _IE_Example("table")
$oTable = _IETableGetCollection($oIE, 1)
$aTableData = _IETableWriteToArray($oTable, True)
_ArrayDisplay($aTableData)

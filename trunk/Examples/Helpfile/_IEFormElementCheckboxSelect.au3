; *******************************************************
; ʾ��1 - �򿪴��б�ʾ���������, ��ȡ��������. ͨ��ֵѡ����ѡ����ѡ��. ����δָ��$s_Name,
;    �Ա������е�<input type=checkbox>Ԫ�ؼ��Ͻ��в���
;    ע��: Ϊ�鿴�仯�������Ҫ���¹���ҳ��
; *******************************************************
#include  <IE.au3>
$oIE = _IE_Example(" form ")
$oForm = _IEFormGetObjByName($oIE, "Example Form ")
For $i = 1 To 5
	_IEFormElementCheckboxSelect($oForm, "gameBasketball ", "", 1, "byValue ")
	Sleep(1000)
	_IEFormElementCheckboxSelect($oForm, "gameFootball ", "", 1, "byValue ")
	Sleep(1000)
	_IEFormElementCheckboxSelect($oForm, "gameTennis ", "", 1, "byValue ")
	Sleep(1000)
	_IEFormElementCheckboxSelect($oForm, "gameBaseball ", "", 1, "byValue ")
	Sleep(1000)
	_IEFormElementCheckboxSelect($oForm, "gameBasketball ", "", 0, "byValue ")
	Sleep(1000)
	_IEFormElementCheckboxSelect($oForm, "gameFootball ", "", 0, "byValue ")
	Sleep(1000)
	_IEFormElementCheckboxSelect($oForm, "gameTennis ", "", 0, "byValue ")
	Sleep(1000)
	_IEFormElementCheckboxSelect($oForm, "gameBaseball ", "", 0, "byValue ")
	Sleep(1000)
Next

; *******************************************************
; ʾ��2 - �򿪴��б�ʾ���������, ��ȡ��������. ͨ������ѡ����ѡ����ѡ��. ����δָ��$s_Name
;    �Ա������е�<input type=checkbox>Ԫ�ؼ��Ͻ��в���
;    ע��: Ϊ�鿴�仯�������Ҫ���¹���ҳ��
; *******************************************************
#include  <IE.au3>
$oIE = _IE_Example(" form ")
$oForm = _IEFormGetObjByName($oIE, "Example Form ")
For $i = 1 To 5
	_IEFormElementCheckboxSelect($oForm, 3, "", 1, "byIndex ")
	Sleep(1000)
	_IEFormElementCheckboxSelect($oForm, 2, "", 1, "byIndex ")
	Sleep(1000)
	_IEFormElementCheckboxSelect($oForm, 1, "", 1, "byIndex ")
	Sleep(1000)
	_IEFormElementCheckboxSelect($oForm, 0, "", 1, "byIndex ")
	Sleep(1000)
	_IEFormElementCheckboxSelect($oForm, 3, "", 0, "byIndex ")
	Sleep(1000)
	_IEFormElementCheckboxSelect($oForm, 2, "", 0, "byIndex ")
	Sleep(1000)
	_IEFormElementCheckboxSelect($oForm, 1, "", 0, "byIndex ")
	Sleep(1000)
	_IEFormElementCheckboxSelect($oForm, 0, "", 0, "byIndex ")
	Sleep(1000)
Next

; *******************************************************
; ʾ��3 - �򿪴��б�ʾ���������, ��ȡ��������. ͨ��checkboxG2Example���е�����ѡ����ѡ����ѡ��.
;    ע��: Ϊ�鿴�仯�������Ҫ���¹���ҳ��
; *******************************************************
;
#include  <IE.au3>
$oIE = _IE_Example("form ")
$oForm = _IEFormGetObjByName($oIE, "Example Form ")
For $i = 1 To 5
	_IEFormElementCheckboxSelect($oForm, 0, "checkboxG2Example ", 1, "byIndex ")
	Sleep(1000)
	_IEFormElementCheckboxSelect($oForm, 1, "checkboxG2Example ", 1, "byIndex ")
	Sleep(1000)
	_IEFormElementCheckboxSelect($oForm, 0, "checkboxG2Example ", 0, "byIndex ")
	Sleep(1000)
	_IEFormElementCheckboxSelect($oForm, 1, "checkboxG2Example ", 0, "byIndex ")
	Sleep(1000)
Next


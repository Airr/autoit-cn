; *******************************************************
; ʾ��1 - �򿪴��б�ʾ���������, ��ȡ��������, ͨ��ֵѡ��ÿ����ѡ��,
;				Ȼ��ѡ���һ�����δѡ��.
;				ע��: Ϊ�鿴�仯�������Ҫ���¹���ҳ��
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("form")
Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
For $i = 1 To 5
	_IEFormElementRadioSelect($oForm, "vehicleAirplane", "radioExample", 1, "byValue")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, "vehicleTrain", "radioExample", 1, "byValue")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, "vehicleBoat", "radioExample", 1, "byValue")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, "vehicleCar", "radioExample", 1, "byValue")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, "vehicleCar", "radioExample", 0, "byValue")
	Sleep(1000)
Next

; *******************************************************
; ʾ��2 - �򿪴��б�ʾ���������, ��ȡ��������, 
;				ͨ������ѡ��ÿ����ѡ��, Ȼ��ѡ���һ�����δѡ��.
;				ע��: Ϊ�鿴�仯�������Ҫ���¹���ҳ��
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("form")
$oForm = _IEFormGetObjByName($oIE, "ExampleForm")
For $i = 1 To 5
	_IEFormElementRadioSelect($oForm, 3, "radioExample", 1, "byIndex")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, 2, "radioExample", 1, "byIndex")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, 1, "radioExample", 1, "byIndex")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, 0, "radioExample", 1, "byIndex")
	Sleep(1000)
	_IEFormElementRadioSelect($oForm, 0, "radioExample", 0, "byIndex")
	Sleep(1000)
Next

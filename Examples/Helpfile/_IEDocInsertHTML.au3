; *******************************************************
; ʾ��1 - ���ĵ������͵ײ�����HTML
; *******************************************************

#include <IE.au3>

Local $oIE = _IECreate("http://www.autoitscript.com")
Local $oBody = _IETagNameGetCollection($oIE, "body", 0)
_IEDocInsertHTML($oBody, "<h2>This HTML is inserted After Begin</h2>", "afterbegin")
_IEDocInsertHTML($oBody, "<h2>This HTML is inserted Before End</h2>", "beforeend")

; *******************************************************
; ʾ��2 - �򿪴��л���ʾ��ҳ�������, 
; ��������Ϊ"IEAu3Data"��DIV�����Χ����HTML����ʾ
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("basic")
Local $oDiv = _IEGetObjByName($oIE, "IEAu3Data")

_IEDocInsertHTML($oDiv, "<b>(HTML beforebegin)</b>", "beforebegin")
_IEDocInsertHTML($oDiv, "<i>(HTML afterbegin)</i>", "afterbegin")
_IEDocInsertHTML($oDiv, "<b>(HTML beforeend)</b>", "beforeend")
_IEDocInsertHTML($oDiv, "<i>(HTML afterend)</i>", "afterend")

ConsoleWrite(_IEBodyReadHTML($oIE) & @CRLF)

; *******************************************************
; ʾ��3 - �߼�ʾ��:������µ�ַʱ��ÿҳ��������һ��ʱ�Ӽ�һ�������ַ���,
; ʹ��_IEDocInsertText, _IEDocInsertHTML��_IEPropertySet����"innerhtml"��"referrer "
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("http://www.autoitscript.com")

AdlibRegister(" UpdateClock ", 1000) ; ÿ�����ʱ��

; ��������ڴ���ʱ����
While WinExists(_IEPropertyGet($oIE, "hwnd"))
	Sleep(10000)
WEnd

Exit

Func UpdateClock()
	Local $curTime = "<b>Current Time is: </b>" & @HOUR & ":" & @MIN & ":" & @SEC
	; �������_IEGetObjByNameԤ�ڷ���NoMatch����(����DIVǰ), �����ʱ�ر�֪ͨ
	_IEErrorNotify(False)
	Local $oAutoItClock = _IEGetObjByName($oIE, "AutoItClock")
	If Not IsObj($oAutoItClock) Then ; ���δ�ҵ�DIVԪ�������
		;
		; ���BODY������, ����DIV, ���DIV����, ����ʱ��
		Local $oBody = _IETagNameGetCollection($oIE, "body", 0)
		_IEDocInsertHTML($oBody, "<div id='AutoItClock'></div>", "afterbegin")
		$oAutoItClock = _IEGetObjByName($oIE, "AutoItClock")
		_IEPropertySet($oAutoItClock, "innerhtml", $curTime)
		;
		; ��������ַ���, ����ǿղ��뵽ʱ���
		_IELoadWait($oIE)
		Local $sReferrer = _IEPropertyGet($oIE, "referrer")
		If $sReferrer Then _IEDocInsertText($oAutoItClock, _
				"  Referred by: " & $sReferrer, "afterend")
	Else
		_IEPropertySet($oAutoItClock, "innerhtml ", $curTime) ; ����ʱ��
	EndIf
	_IEErrorNotify(True)
EndFunc   ;==>UpdateClock

; *******************************************************
; Example 1 - Open a browser with the basic example page, insert text
;		in and around the first Paragraph tag and display Body HTML
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
Local $oP = _IETagNameGetCollection($oIE, "p", 0)

_IEDocInsertText($oP, "(Text beforebegin)", "beforebegin")
_IEDocInsertText($oP, "(Text afterbegin)", "afterbegin")
_IEDocInsertText($oP, "(Text beforeend)", "beforeend")
_IEDocInsertText($oP, "(Text afterend)", "afterend")

ConsoleWrite(_IEBodyReadHTML($oIE) & @CRLF)

; *******************************************************
; ʾ��2 - ���ĵ������͵ײ�����HTML
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("basic")
Local $oBody = _IETagNameGetCollection($oIE, "body", 0)
_IEDocInsertText($oBody, "This Text is inserted After Begin", "afterbegin")
_IEDocInsertText($oBody, "Notice that <b>Tags</b> are <encoded> before display", "beforeend")


; *******************************************************
; ʾ��3 - �߼�ʾ��
;		������µ�ַʱ��ÿҳ��������һ��ʱ�Ӽ�һ�������ַ���,
;		ʹ��_IEDocInsertText, _IEDocInsertHTML��
;		_IEPropertySet����"innerhtml"��"referrer"
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

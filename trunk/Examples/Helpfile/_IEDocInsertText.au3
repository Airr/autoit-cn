; *******************************************************
$oIE = _IE_Example(" basic ")
$oP = _IETagNameGetCollection($oIE, "p ", 0)

_IEDocInsertText($oP, "(Text beforebegin) ", "beforebegin ")
_IEDocInsertText($oP, "(Text afterbegin) ", "afterbegin ")
_IEDocInsertText($oP, "(Text beforeend) ", "beforeend ")
_IEDocInsertText($oP, "(Text afterend) ", "afterend ")

MsgBox('', 'Html Code ', _IEBodyReadHTML($oIE))

; *******************************************************
; ʾ��2 - ���ĵ������͵ײ�����HTML
; *******************************************************
#include <IE.au3>
$oIE = _IE_Example(" basic ")
$oBody = _IETagNameGetCollection($oIE, "body ", 0)
_IEDocInsertText($oBody, "This HTML is inserted After Begin ", "afterbegin ")
_IEDocInsertText($oBody, "Notice that <b>Tags</b> are <encoded> before display ", "beforeend ")

; *******************************************************
; ʾ��3 - �߼�ʾ��:������µ�ַʱ��ÿҳ��������һ��ʱ�Ӽ�һ�������ַ���,
; ʹ��_IEDocInsertText, _IEDocInsertHTML��_IEPropertySet����"innerhtml"��"referrer "
; *******************************************************
#include <IE.au3>
$oIE = _IECreate(" http://www.autoitscript.com ")

AdlibRegister(" UpdateClock ", 1000) ; ÿ�����ʱ��

; ��������ڴ���ʱ����
While WinExists( _IEPropertyGet($oIE, "hwnd "))
	Sleep(10000)
WEnd

Exit

Func UpdateClock()
	Local $curTime = " <b>Current Time is: </b>" & @HOUR & " :" & @MIN & " :" & @SEC
	; �������_IEGetObjByNameԤ�ڷ���NoMatch����(����DIVǰ), �����ʱ�ر�֪ͨ
	_IEErrorNotify(False)
	Local $oAutoItClock = _IEGetObjByName($oIE, "AutoItClock ")
	If Not IsObj($oAutoItClock) Then ; ���δ�ҵ�DIVԪ�������

		; ���BODY������, ����DIV, ���DIV����, ����ʱ��
		$oBody = _IETagNameGetCollection($oIE, "body ", 0)
		_IEDocInsertHTML($oBody, "<div id='AutoItClock'></div> ", "afterbegin ")
		$oAutoItClock = _IEGetObjByName($oIE, "AutoItClock ")
		_IEPropertySet($oAutoItClock, "innerhtml ", $curTime)

		; ��������ַ���, ����ǿղ��뵽ʱ���
		_IELoadWait($oIE)
		$sReferrer = _IEPropertyGet($oIE, "referrer ")
		If $sReferrer Then _IEDocInsertText($oAutoItClock, "Referred by:" & $sReferrer, "afterend ")
	Else
		_IEPropertySet($oAutoItClock, "innerhtml ", $curTime) ; ����ʱ��
	EndIf
	_IEErrorNotify(True)
endfunc   ;==>UpdateClock


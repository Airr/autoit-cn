; *******************************************************
; ʾ��1 - �򿪴��л���ʾ��ҳ�������, ���¼��ű����뵽�ĵ�ͷ��, 
; ʹ���ڵ���ĵ�ʱ����JavaScript����
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
_IEHeadInsertEventScript($oIE, "document", "onclick", "alert('Someone clicked the document!');")

; *******************************************************
; ʾ��2 - �򿪴��л���ʾ��ҳ�������, ���¼��ű����뵽�ĵ�ͷ��, 
; ʹ�����һ��ĵ�ʱ����JavaScript����,
; Ȼ���¼��ű�����"false"����ֹ�һ����ֵ������Ĳ˵�
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("basic")
_IEHeadInsertEventScript($oIE, "document", "oncontextmenu", "alert('No Context Menu');return false")

; *******************************************************
; ʾ��3 - �򿪴��л���ʾ��ҳ�������, 
; ���뿪���ҳʱ���¼��ű����뵽�ĵ�ͷ�����ṩȡ��������ѡ��.
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("basic")
_IEHeadInsertEventScript($oIE, "window", "onbeforeunload", _
		"alert('Example warning follows...');return 'Pending changes may be lost';")
_IENavigate($oIE, "www.autoitscript.com")

; *******************************************************
; ʾ��4 - �򿪴��л���ʾ��ҳ�������, 
; ���¼��ű����뵽�ĵ�ͷ������ֹ���ĵ���ѡȡ�ı�
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example()
_IEHeadInsertEventScript($oIE, "document", "ondrag", "return false;")
_IEHeadInsertEventScript($oIE, "document", "onselectstart", "return false;")

; *******************************************************
; ʾ��5 - ��AutoIt��ҳ�������, 
; ���¼��ű����뵽�ĵ�ͷ������ֹ�����һ���ӵĵ��������������ӵ�ַ��¼������̨
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("http://www.autoitscript.com")
Local $oLinks = _IELinkGetCollection($oIE)
For $oLink In $oLinks
	Local $sLinkId = _IEPropertyGet($oLink, "uniqueid")
	_IEHeadInsertEventScript($oIE, $sLinkId, "onclick", "return false;")
	ObjEvent($oLink, "_Evt_")
Next

While 1
	Sleep(100)
WEnd

Func _Evt_onClick()
	Local $o_link = @COM_EventObj
	ConsoleWrite($o_link.href & @CRLF)
EndFunc   ;==>_Evt_onClick

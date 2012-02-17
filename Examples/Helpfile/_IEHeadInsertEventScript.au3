; *******************************************************
; ʾ�� 1 - �򿪺�����ʾ��ҳ��������, ����
;				�¼��ű����ĵ�ͷ, ���д�����
;				��ĳ���˵���ĵ�ʱ�ᵯ���� JavaScript ����
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
_IEHeadInsertEventScript($oIE, "document", "onclick", "alert('Someone clicked the document!');")

; *******************************************************
; ʾ�� 2 - �򿪺�����ʾ��ҳ��������, ����
;				�¼��ű����ĵ�ͷ, ���д�����
;				��ĳ�����һ��ĵ�ʱ�ᵯ���� JavaScript ����
;				Ȼ���¼��ű����� "false" ����ֹ
;				�Ҽ������Ĳ˵�����
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("basic")
_IEHeadInsertEventScript($oIE, "document", "oncontextmenu", "alert('No Context Menu');return false")

; *******************************************************
; ʾ�� 3 - �򿪺�����ʾ��ҳ��������, ����
;				�¼��ű����ĵ�ͷ, ���д�����
;				�����Ǽ�����ҳ�浼���뿪ʱ�� JavaScript ����
;				�ҳ���ȡ��������ѡ��.
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example("basic")
_IEHeadInsertEventScript($oIE, "window", "onbeforeunload", _
		"alert('Example warning follows...');return 'Pending changes may be lost';")
_IENavigate($oIE, "www.autoitscript.com")

; *******************************************************
; ʾ�� 4 - �򿪺�����ʾ��ҳ��������, ����
;				�¼��ű����ĵ�ͷ, ���г�����
;				�ĵ���ѡ����ı�
; *******************************************************

#include <IE.au3>

$oIE = _IE_Example()
_IEHeadInsertEventScript($oIE, "document", "ondrag", "return false;")
_IEHeadInsertEventScript($oIE, "document", "onselectstart", "return false;")

; *******************************************************
; ʾ�� 5 - ��������д� AutoIt ��ҳ, ����
;				�¼��ű����ĵ�ͷ, ���г�����
;				����κ�����ʱ�ĵ�������¼��������ӵ� URL
;               ������̨
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

; *******************************************************
; ʾ�� - �򿪴��л���ʵ���������, ׼��HTML, 
;				�����µ�HTML��ԭʼ�Ĳ�д�������
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("basic")
Local $sHTML = _IEBodyReadHTML($oIE)
$sHTML = $sHTML & "<p><font color=red size=+5>Big RED text!</font>"
_IEBodyWriteHTML($oIE, $sHTML)

; *******************************************************
; ʾ�� - �򿪴��л���ʵ���������, ׼��HTML, �����µ�HTML��ԭʼ�Ĳ�д�������
; *******************************************************
#include <IE.au3>
$oIE = _IE_Example("basic")
$sHTML = _IEBodyReadHTML($oIE)
$sHTML = $sHTML & "<p><font color=red size=+5>Big RED text!</font>"
_IEBodyWriteHTML($oIE, $sHTML)


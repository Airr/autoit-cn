#include <IE.au3>

; *******************************************************
; ʾ�� 1 - ������������ڲ�������ĳ��վ��
; *******************************************************

Local $oIE = _IECreate("www.autoitscript.com")

; *******************************************************
; ʾ�� 2 - ����ָ�� 3 ����ͬ URL �������������
;				���ĳ���������� ($f_tryAttach = 1)
;				���ȴ���ҳ������� ($f_wait = 0)
; *******************************************************

_IECreate("www.autoitscript.com", 1, 1, 0)
_IECreate("my.yahoo.com", 1, 1, 0)
_IECreate("www.google.com", 1, 1, 0)

; *******************************************************
; ʾ�� 3 - ���Ը��ӵ���ʾ������վ URL �����е������
;				���������, �򴴽������������������վ��
; *******************************************************

$oIE = _IECreate("www.autoitscript.com", 1)
; ��� @extended ����ֵ���жϸ����Ƿ�ɹ�
If @extended Then
	MsgBox(4096, "", "Attached to Existing Browser")
Else
	MsgBox(4096, "", "Created New Browser")
EndIf

; *******************************************************
; ʾ�� 4 - �����յ���������ڲ������Զ���� HTML
; *******************************************************

$oIE = _IECreate()
Local $sHTML = "<h1>Hello World!</h1>"
_IEBodyWriteHTML($oIE, $sHTML)

; *******************************************************
; ʾ�� 5 - �������ӵ� iexplore.exe ��ʵ�������������
;				Ҫ��ȡ�»Ự cookie ����ʱ������Ҫ������
;				(�Ự cookies �ڹ�����ͬ�� iexplore.exe �����������ʵ���й���)
; *******************************************************

ShellExecute("iexplore.exe", "about:blank")
WinWait("Blank Page")
$oIE = _IEAttach("about:blank", "url")
_IELoadWait($oIE)
_IENavigate($oIE, "www.autoitscript.com")

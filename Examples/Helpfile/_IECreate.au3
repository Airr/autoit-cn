; *******************************************************
; ʾ��1 - ������������岢�����ַ
; *******************************************************
#include  <IE.au3>
$oIE = _IECreate(" www.autoitscript.com ")

; *******************************************************
; ʾ��2 - �����ֱ�ָ��3����ͬ��ַ�����������
;    ���һ���Ѳ�����($f_tryAttach = 1)���ȴ�ҳ�����($f_wait = 0)
; *******************************************************
#include  <IE.au3>
_IECreate(" www.autoitscript.com ", 1, 1, 0)
_IECreate(" my.yahoo.com ", 1, 1, 0)
_IECreate(" www.google.com ", 1, 1, 0)

; *******************************************************
; ʾ��3 - ���Ի�ȡ�Ѵ��ڵ���ʾָ����ַ�������
;    ������������½������������õ�ַ
; *******************************************************
#include  <IE.au3>
$oIE = _IECreate(" www.autoitscript.com ", 1)
; ���@extended����ֵ�鿴��ȡ�Ƿ�ɹ�
If @extended Then
	msgbox(0, "", "Attached to Existing Browser ")
Else
	msgbox(0, "", "Created New Browser ")
EndIf

; *******************************************************
; ʾ��4 - �����հ׵���������ڲ����Զ���HTML���
;*******************************************************
#include  <IE.au3>
$oIE = _IECreate()
$sHTML = " <h1>Hello World!</h1> "
_IEBodyWriteHTML($oIE, $sHTML)

; *******************************************************
; ʾ��5 - �������ص����������, �����ַ, ��ȡ��Ϣ���˳�
; *******************************************************
#include  <IE.au3>
$oIE = _IECreate(" http://sourceforge.net ", 0, 0)
; ��ʾҳ��������Ϊ"sfmarquee"Ԫ�ص�innerText
$oMarquee = _IEGetObjByName($oIE, "sfmarquee ")
msgbox(0, "SourceForge Information ", $oMarquee .innerText)
_IEQuit($oIE)

; *******************************************************
; ʾ��6 - �½���ȡiexplore.exeʵ�������������. �����ڻ�ȡ�»Ự�����������.
;    (�Ự�����ı�������ͬ��iexplore.exe����������ʵ������)
; *******************************************************
#include  <IE.au3>
ShellExecute(" iexplore.exe ", "about:blank ")
WinWait(" Blank Page ")
$oIE = _IEAttach(" about:blank ", "url ")
_IELoadWait($oIE)
_IENavigate($oIE, "www.autoitscript.com ")


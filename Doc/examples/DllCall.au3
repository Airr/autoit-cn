; *******************************************************
; ʾ�� 1 - ֱ�ӵ��� MessageBox API
; *******************************************************

$result = DllCall("user32.dll", "int", "MessageBox", "hwnd", 0, "str", "��������", "str", "���ɱ���", "int", 0)


; *******************************************************
; ʾ�� 2 - ����һ�������޸Ĳ���
; *******************************************************

$hwnd = WinGetHandle("[CLASS:Notepad]")
$result = DllCall("user32.dll", "int", "GetWindowText", "hwnd", $hwnd, "str", "", "int", 32768)
msgbox(0, "", $result[0])	; ���ص��ַ���
msgbox(0, "", $result[2])	; �ڲ��� 2 ���ص��ı�


; *******************************************************
; ʾ�� 3 - ��ʾϵͳ����ͼ�괰��
; *******************************************************

$sFileName  = @SystemDir & '\shell32.dll'

; ����һ�����ݽṹ����ͼ������
$stIcon     =  DllStructCreate("int")
$stString       = DLLStructCreate("wchar[260]")
$structsize = DllStructGetSize($stString)/2
DllStructSetData($stString, 1, $sFileName)

; ���и���ͼ�괰�� - '62' �����������˳��ֵ
DllCall("shell32.dll", "none", 62, "hwnd", 0, "ptr", DllStructGetPtr($stString), "int", $structsize, "ptr", DllStructGetPtr($stIcon))

$sFileName  = DllStructGetData($stString, 1)
$nIconIndex = DllStructGetData($stIcon, 1)

; ��ʾ�ļ�����ͼ������
Msgbox(0, "��Ϣ", "���ѡ����ļ�: " & $sFileName & @LF & "ͼ������: " & $nIconIndex)

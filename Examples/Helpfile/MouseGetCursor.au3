Sleep(2000) ;����һ���ӳ�ʱ�䣬�����ȡָ����ID.

;����һ��������ָ���� ID ��ź��������.
Local $IDs = StringSplit("AppStarting|Arrow|Cross|Help|IBeam|Icon|No|" & _
        "Size|SizeAll|SizeNESW|SizeNS|SizeNWSE|SizeWE|UpArrow|Wait|Hand", "|")
$IDs[0] = "Unknown"

;���ص�ǰ���ָ�����ID.
Local $cursor = MouseGetCursor()
MsgBox(4096, "ID = " & $cursor, "Which means " & $IDs[$cursor])
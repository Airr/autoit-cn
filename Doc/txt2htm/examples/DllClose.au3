Local $dll = DllOpen("user32.dll")
Local $result = DllCall($dll, "int", "MessageBox", "hwnd", 0, "str", "�����ı�", "str", "���ɱ���", "int", 0)
DllClose($dll)

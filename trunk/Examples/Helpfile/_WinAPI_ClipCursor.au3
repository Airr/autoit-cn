#Include <WinAPIEx.au3>

Opt('MustDeclareVars ', 1)

; ������ͷ�ķ�Χ���������Ͻ�400x400�ķ�Χ��
_WinAPI_ClipCursor( _WinAPI_CreateRectEx(0, 0, 400, 400))
Sleep(5000)
; ȡ������
_WinAPI_ClipCursor(0)


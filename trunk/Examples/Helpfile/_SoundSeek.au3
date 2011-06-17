#include <Sound.au3>

;�������ļ�: �� Vista ������ʱ�����·�������޸�
Local $sound = _SoundOpen(@WindowsDir & "\media\Windows XP Startup.wav")
If @error = 2 Then
	MsgBox(0, "Error", "The file does not exist")
	Exit
ElseIf @extended <> 0 Then
	Local $extended = @extended ;��ֵ, ��Ϊ @extended ���ܻ��� DllCall �����ó���������ֵ
	Local $stText = DllStructCreate("char[128]")
	Local $errorstring = DllCall("winmm.dll", "short", "mciGetErrorStringA", "str", $extended, "ptr", DllStructGetPtr($stText), "int", 128)
	MsgBox(0, "Error", "The open failed." & @CRLF & "Error Number: " & $extended & @CRLF & "Error Description: " & DllStructGetData($stText, 1) & @CRLF & "Please Note: The sound may still play correctly.")
Else
	MsgBox(0, "Success", "The file opened successfully")
EndIf
_SoundPlay($sound, 0)

;��������һ��
Sleep(1000)

;��Ѱ��λ�������� 2 �봦
_SoundSeek($sound, 0, 0, 2)
ConsoleWrite("After _SoundSeek: " & _SoundPos($sound, 2) & " _SoundStatus: " & _SoundStatus($sound) & @CRLF)
_SoundSeek($sound, 0, 0, 1)
ConsoleWrite("After _SoundSeek1: " & _SoundPos($sound, 2) & " _SoundStatus: " & _SoundStatus($sound) & @CRLF)

_SoundPlay($sound, 0)
While 1
	Sleep(100)
	If _SoundPos($sound, 2) >= _SoundLength($sound, 2) Then ExitLoop
WEnd

_SoundClose($sound)

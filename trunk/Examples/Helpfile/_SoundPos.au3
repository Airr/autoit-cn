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
Local $splashtext = SplashTextOn("Current Position", _SoundPos($sound, 1), 300, 90, Default, Default, 18, Default, 55)
While 1
	Sleep(100)
	ControlSetText("Current Position", "", "Static1", _SoundPos($sound, 1))
	If _SoundPos($sound, 2) >= _SoundLength($sound, 2) Then ExitLoop
WEnd
_SoundClose($sound)

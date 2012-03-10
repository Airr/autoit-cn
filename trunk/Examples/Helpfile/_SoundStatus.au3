#include <Sound.au3>

Local $aSound = _SoundOpen(@WindowsDir & "\media\tada.wav")
If @error = 2 Then
	MsgBox(4096, "����", "�ļ�������")
	Exit
ElseIf @extended <> 0 Then
	Local $iExtended = @extended ;��ֵ, ��Ϊ @extended ���ܻ��� DllCall �����ó���������ֵ
	Local $tText = DllStructCreate("char[128]")
	DllCall("winmm.dll", "short", "mciGetErrorStringA", "str", $iExtended, "ptr", DllStructGetPtr($tText), "int", 128)
	MsgBox(4096, "����", "The open failed." & @CRLF & "Error Number: " & $iExtended & @CRLF & "Error Description: " & DllStructGetData($tText, 1) & @CRLF & "Please Note: The sound may still play correctly.")
Else
	MsgBox(4096, "Success", "The file opened successfully")
EndIf

ConsoleWrite("After _SoundOpen: " & _SoundStatus($aSound) & @CRLF)

_SoundPlay($aSound)
ConsoleWrite("After _SoundPlay: " & _SoundStatus($aSound) & @CRLF)

Sleep(1000)

_SoundPause($aSound)
ConsoleWrite("After _SoundPause: " & _SoundStatus($aSound) & @CRLF)

Sleep(1000)
_SoundResume($aSound)

While 1
	Sleep(100)
	If _SoundPos($aSound, 2) = _SoundLength($aSound, 2) Then ExitLoop
WEnd

_SoundClose($aSound)

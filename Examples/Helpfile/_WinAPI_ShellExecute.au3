#Include <WinAPIEx.au3>

Opt('MustDeclareVars ', 1)

Local $File

; InputBox('����', '�������, �ļ���, �ĵ���������Դ�����Դ�'....
$File = InputBox('Run ', 'Type the name of a program , folder , document , or Internet resource to open it ', '', '', 368, 152)
If $File Then
	_WinAPI_ShellExecute($File, '', '', 'open')
	If @error Then
		msgbox(16, 'Error ', 'Unable to open "'& $File & ' ".' & @CR & @CR & @extended)
	EndIf
EndIf


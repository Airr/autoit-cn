#include <WinApiEx.au3>

Opt('MustDeclareVars ', 1)

Run(@SystemDir & ' \taskmgr.exe')

msgbox(64 + 262144, '', 'Look at the memory used by the "'& StringRegExpReplace( FileGetLongName(@AutoItExe), '^.*\\ ', '') & ' " process.')

; �����ڴ洴������
Dim $Data[1000000]
For $i = 0 To UBound($Data) - 1
	$Data[$i] = ' AutoIt v3 is a freeware BASIC-like scripting language designed for automating the Windows GUI and general scripting. It uses a combination of simulated keystrokes , mouse movement and window/control manipulation in order to automate tasks in a way not possible or reliable with other languages (e.g. VBScript and SendKeys). AutoIt is also very small , self-contained and will run on all versions of Windows out-of-the-box with no annoying " runtimes " required! '
Next

msgbox(64 + 262144, '', 'Step 1')

; ��չ�����
_WinAPI_EmptyWorkingSet()

msgbox(64 + 262144, '', 'Step 2')

; �������ȡ����
For $i = 0 To UBound($Data) - 1
	If $Data[$i] Then
		; Something
	EndIf
Next

msgbox(64 + 262144, '', 'Step 3')

; ��չ�����
_WinAPI_EmptyWorkingSet()

msgbox(64 + 262144, '', 'Step 4')


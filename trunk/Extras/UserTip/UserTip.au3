#cs ----------------------------------------------------------------------------

 AutoIt �汾: 3.2.3.6(���İ�)
 �ű�����: thesnow
	Email: rundll32@126.com
	QQ/TM: 133333542
 �ű��汾: 0.1
 �ű�����: Autoit��ؼ���.

#ce ----------------------------------------------------------------------------

; �ű���ʼ - �������������Ĵ���.
If FileExists(@ScriptDir & "\TIP.TXT") <> 1 Then
	MsgBox(32,"���ִ���!","TIP.TXT ��ʧ,�����°�װ������. T_T")
	Exit
EndIf
$win = "Autoit TIP"
If WinExists($win) Then Exit
AutoItWinSetTitle($win)	
#compiler_allow_decompile=no
#include <GUIConstants.au3>
#NoTrayIcon
$OnRead=IniRead(@ScriptDir & "\TIP.TXT","TIP","OnRead","1")
$ALLTIP=IniRead(@ScriptDir & "\TIP.TXT","TIP","ALLTIP","1")

#Region ����GUI
$gui = GUICreate("Autoit ���� V0.1", 628, 226, 203, 168)
GUISetIcon("shell32.dll",Random(1,200,1),$gui)
$MonthCal1 = GUICtrlCreateMonthCal(@YEAR & "/" & @MON & "/" & @MDAY, 0, 0, 283, 185)
$Group = GUICtrlCreateGroup("Autoit ����", 288, 0, 329, 185)
$TIP = GUICtrlCreateInput("Autoit ���� V0.1" & @CRLF & @CR & "��Ȩ����(C) 2007 thesnow", 296, 16, 313, 160, 0x50200104,0x00000200)
GUICtrlSetFont(-1, 9, 400, 0, "����")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$UP = GUICtrlCreateButton("��һ��", 392, 192, 81, 25, 0)
$NEXT = GUICtrlCreateButton("��һ��", 488, 192, 81, 25, 0)
$About = GUICtrlCreateLabel("CopyRight(C)2007 thesnow ", 8, 200, 272, 17)
GUISetState(@SW_SHOW)
#EndRegion GUI�������
_TIP_TEXT($OnRead)
While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
	Case $GUI_EVENT_CLOSE
		IniWrite(@ScriptDir & "\TIP.TXT","TIP","OnRead",$OnRead)
		Exit
	Case $UP
		if $OnRead = 1 Then 
			MsgBox(32,"û������!","ǰ���Ѿ�û������!",2)
		Else
			$OnRead=$OnRead-1
			_TIP_TEXT($OnRead)
		EndIf
	Case $NEXT
		if $OnRead = $ALLTIP Then 
			MsgBox(32,"û������!","�����Ѿ�û������!",2)
		Else
			$OnRead=$OnRead+1
			_TIP_TEXT($OnRead)
		EndIf		
	EndSwitch
WEnd

Func _TIP_TEXT($TIPNO)
	$TIPTEXT=IniRead(@ScriptDir & "\TIP.TXT","TIP",$TIPNO,"ò�ƶ�ȡ�����˴���!")
	$TIPTEXT=StringReplace($TIPTEXT,"{����}",@crlf)
	GUICtrlSetData($TIP,$TIPTEXT)
	Return $TIPTEXT
EndFunc
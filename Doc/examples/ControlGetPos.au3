Run("notepad.exe")
$pos = ControlGetPos("[CLASS:Notepad]", "", "Edit1")
MsgBox(0, "����״̬:", "λ��: " & $pos[0] & "," & $pos[1] & " ��С: " & $pos[2] & "," & $pos[3] )
;��ע���ű����ܳ�����ʾ��Ϣ�����桰������������ʾ����
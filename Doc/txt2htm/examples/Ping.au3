Local $var = Ping("www.AutoItScript.com", 250)
If $var Then; ������:  If @error = 0 Then ...
    MsgBox(0,"״̬-�ɹ�","�շ�ʱ����:" & $var & "����")
Else
    MsgBox(0,"״̬-ʧ��","�������:" & @error)
EndIf
WinMove("[active]","",default, default, 200,300)	; �����������������С (û�ж���)

MyFunc2(Default,Default)

Func MyFunc2($Param1 = Default, $Param2 = '����', $Param3 = Default)
    If $Param1 = Default Then $Param1 = '�κ���'
    If $Param3 = Default Then $Param3 = '��'

    MsgBox(0, '����', '1 = ' & $Param1 & @LF & _
        '2 = ' & $Param2 & @LF & _
        '3 = ' & $Param3)
EndFunc

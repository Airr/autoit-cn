Local $bak = ClipGet()
MsgBox(0, "����������:", $bak)

ClipPut($bak & "�����ı�")
MsgBox(0, "����������:", ClipGet())
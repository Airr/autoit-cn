; Register Example1 and Example2 to be called when AutoIt starts.
#OnAutoItStartRegister "Example1"
#OnAutoItStartRegister "Example2"

Sleep(1000)

Func Example1()
	MsgBox(4096, "", '���ȵ����� Example1() ����')
EndFunc   ;==>Example1

Func Example2()
	MsgBox(4096, "", 'Ȼ������� Example2() ����')
EndFunc   ;==>Example2

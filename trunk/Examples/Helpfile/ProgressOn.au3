ProgressOn("������", "ÿ�����", "0 %")
For $i = 10 To 100 Step 10
	Sleep(1000)
	ProgressSet( $i, $i & " %")
Next
ProgressSet(100 , "���", "ȫ�����")
Sleep(500)
ProgressOff()

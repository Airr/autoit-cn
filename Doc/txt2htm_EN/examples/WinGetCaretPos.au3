$a = WinGetCaretPos()
If Not @error Then 
	ToolTip("��һ�����������", $a[0], $a[1])
	MouseMove($a[0],$a[1])
EndIf
sleep(2000)

$b = _CaretPos()
If Not @error Then 
	ToolTip("�ڶ������������", $b[0], $b[1])
	MouseMove($b[0],$b[1])
EndIf

sleep(2000)

; �õ� MDI �ı��༭����һЩ�ɿ�����.
Func _CaretPos()
	Local $x_adjust =  5
	Local $y_adjust = 40

	Opt("CaretCoordMode", 0)              ;���ģʽ
	Local $c = WinGetCaretPos()           ;��Բ��������
	Local $w = WinGetPos("")              ;��������
	Local $f = ControlGetFocus("","")     ;�ı����� "���"
	Local $e = ControlGetPos("", "", $f)  ;�ı���������

	Local $t[2]
	If IsArray($c) and IsArray($w) and IsArray($e) Then
		$t[0] = $c[0] + $w[0] + $e[0] + $x_adjust
		$t[1] = $c[1] + $w[1] + $e[1] + $y_adjust
		Return $t     ;absolute screen coords of caret cursor
	Else
		SetError(1)
	EndIf
EndFunc

;ʾ��1
;��ȡ���ھ����ʹ�� WinGetPos��ȡ���ھ���
$hwnd	= WinGetHandle("")
$coor	= WinGetPos($hwnd)

;���� struct
$rect	= DllStructCreate("int;int;int;int")

;���� DllCall
DLLCall("user32.dll","int","GetWindowRect", _
		"hwnd",$hwnd, _
		"ptr",DllStructGetPtr($rect)) ; ��ʹ�� DllStructGetPtr ���� DllCall ʱ

;��ȡ�ͻصľ���
$l = DllStructGetData($rect,1)
$t = DllStructGetData($rect,2)
$r = DllStructGetData($rect,3)
$b = DllStructGetData($rect,4)

;�ͷ� struct
$rect = 0

;��ʾ WinGetPos �Ľ���ͱ��ͻصľ���
MsgBox(0,"Larry ���� :)","WinGetPos(): (" & $coor[0] & "," & $coor[1] & _
		") (" & $coor[2] + $coor[0] & "," & $coor[3] + $coor[1] & ")" & @CRLF & _
		"GetWindowRect(): (" & $l & "," & $t & ") (" & $r & "," & $b & ")")

;ʾ��2
; DllStructGetPtr �ο���һ����Ŀ
$a			= DllStructCreate("int")
if @error Then
	MsgBox(0,"","DllStructCreate ����" & @error);
	exit
endif

$b	= DllStructCreate("uint",DllStructGetPtr($a,1))
if @error Then
	MsgBox(0,"","DllStructCreate ���� " & @error);
	exit
endif

$c	= DllStructCreate("float",DllStructGetPtr($a,1))
if @error Then
	MsgBox(0,"","DllStructCreate ���� " & @error);
	exit
endif

;�趨����
DllStructSetData($a,1,-1)

;=========================================================
;	��ʾ��ͬ���ݵĲ�ͬ����
;=========================================================
MsgBox(0,"DllStruct", _
		"int: " & DllStructGetData($a,1) & @CRLF & _
		"uint: " & DllStructGetData($b,1) & @CRLF & _
		"float: " & DllStructGetData($c,1) & @CRLF & _
		"")

; �ͷ��ڴ����
$a = 0

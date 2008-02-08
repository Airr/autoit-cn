#include-once

;======================================================
;
; ��������:		SendX("string",flag)
; ��ϸ��Ϣ:		���ͺ���.
; $string:		$string Ϊ��������ĺ���.
; $flag:		0���߷�1Ϊ���а�ģʽ,1Ϊ����ASCģʽ
; ����ֵ :		û��
; ����:			thesnow(rundll32@126.com)
;
;======================================================
Func SendX($string, $flag)
	Local $char
	Local $code
	Local $clup
	If $flag <> 1 Then $flag = 0
	Switch $flag
		Case 0
			$clup = ClipGet()
			ClipPut($string)
			Send("+{ins}")
			ClipPut($clup)
		Case 1
			If @Unicode Then
				$clup = ClipGet()
				ClipPut($string)
				Send("+{ins}")
				ClipPut($clup)
			Else
				For $i = 1 To StringLen($string)
					$char = StringMid($string, $i, 1)
					$code = Asc($char)
					If $code > 127 Then
						$code = $code * 256
						$i = $i + 1
						$char = StringMid($string, $i, 1)
						$code = $code + Asc($char)
					EndIf
					Send("{ASC " & $code & "}")
				Next
			EndIf
	EndSwitch
EndFunc   ;==>SendX


;======================================================
;
; ��������:		_UnicodeHex("string",$space)
; ��ϸ��Ϣ:		ת���ַ���ΪUNICODE�����HEXֵ
; $string:		$string Ϊ��������ĺ���.
; $space:		$space Ϊ����,0,1,2,
;				[0,�޿ո�]
;				[1,ÿ�����ֽں�һ���ո�]
;				[2,ÿһ���ֽں�һ���ո�]
; ����ֵ :		����HEXֵ.
; ����:			thesnow(rundll32@126.com)
;
;======================================================
Func _UnicodeHex($string,$space)
	Local $char
	Local $code
	Local $all=""
	Switch $space
		Case 0
		For $i = 1 to StringLen($string)
			$char = StringMid($string, $i, 1)
			if AscW($char) =0  Then 
			$char = StringMid($string, $i, 2)	
				$i=$i+1				
			EndIf				
			$code = Hex(AscW($char),4)
			$code =StringRight($code,2) & StringLeft($code,2) 
				$all=$all & $code
		Next
		Case 1
		For $i = 1 to StringLen($string)
			$char = StringMid($string, $i, 1)
			if AscW($char) = 0 Then 
			$char = StringMid($string, $i, 2)	
				$i=$i+1				
			EndIf	
			$code = Hex(AscW($char),4)
			$code =StringRight($code,2) & StringLeft($code,2) 
			$all=$all & " " & $code
		Next
		Case 2
		For $i = 1 to StringLen($string)
			$char = StringMid($string, $i, 1)
			if AscW($char) = 0 Then 
			$char = StringMid($string, $i, 2)	
				$i=$i+1				
			EndIf
			$code = Hex(AscW($char),4)
			$code =StringRight($code,2) & " " &StringLeft($code,2) 
			$all=$all & " " & $code
		Next
		case Else
		$all=-1
	EndSwitch
	Return $all
EndFunc
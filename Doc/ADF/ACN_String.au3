#include-once

;======================================================
;
; ��������:		SendX("string",flag)
; ��ϸ��Ϣ:		���ͺ���.
; $string:		$string Ϊ��������ĺ���.
; $flag:		0���߷�1Ϊ���а�ģʽ,1Ϊ����ASCģʽ
; ����ֵ :		û��
; ����:			thesnow(rundll32@126.com)
; �޸�:			make2855
; ע��:			������ʹ��UNICODE������룬ANSI�汾ʹ����ǰ��SENDX����.
;======================================================
Func SendX($string, $flag)
	Local $clup
	Local $Nul = Chr(0)
	If $flag <> 1 Then $flag = 0
	Switch $flag
		Case 0
			$clup = ClipGet()
			ClipPut($string)
			Send("+{ins}")
			ClipPut($clup)
		Case 1
			For $i = 1 To StringLen($string)
				Send('{ASC ' & StringToBinary(StringMid($string, $i, 1) & $Nul) & '}')
			Next
	EndSwitch
EndFunc   ;==>SendX
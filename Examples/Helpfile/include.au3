;;; TIME.AU3 ;;;
MsgBox(0,"", "����ʱ��Ϊ " & @HOUR & ":" & @MIN & ":" & @SEC)

;;; SCRIPT.AU3 ;;;
MsgBox(0,"", "����")
#include "TIME.AU3"
Exit

; Running script.au3 will output two message boxes:
; one with 'Example', followed by one with the time.

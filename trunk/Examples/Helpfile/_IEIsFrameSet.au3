; *******************************************************
; ʾ�� 1 - ��ʾ��ܼ�ʾ��, ��ȡ��ܼ���,
;				�������Ŀ, ��ʾ���ڵĿ�ܻ� iFrames ����Ŀ
; *******************************************************

#include <IE.au3>

Local $oIE = _IE_Example("frameset")
Local $oFrames = _IEFrameGetCollection($oIE)
Local $iNumFrames = @extended
If $iNumFrames > 0 Then
	If _IEIsFrameSet($oIE) Then
		MsgBox(4096, "Frame Info", "Page contains " & $iNumFrames & " frames in a FrameSet")
	Else
		MsgBox(4096, "Frame Info", "Page contains " & $iNumFrames & " iFrames")
	EndIf
Else
	MsgBox(4096, "Frame Info", "Page contains no frames")
EndIf

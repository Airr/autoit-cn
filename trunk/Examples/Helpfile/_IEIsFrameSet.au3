; *******************************************************
; ʾ�� - ��ʾ��ܼ�ʾ��, ��ȡ��ܼ�, ���������, ��ʾ��ܻ�̬��ܵ�����
; *******************************************************
#include  <IE.au3>
$oIE = _IE_Example(" frameset ")
$oFrames = _IEFrameGetCollection($oIE)
$iNumFrames = @extended
If $iNumFrames > 0 Then
	If _IEIsFrameSet($oIE) Then
		msgbox(0, "Frame Info ", "Page contains" & $iNumFrames & " frames in a FrameSet ")
	Else
		msgbox(0, "Frame Info ", "Page contains" & $iNumFrames & " iFrames ")
	EndIf
Else
	msgbox(0, "Frame Info ", "Page contains no frames ")
EndIf


; *******************************************************
; ʾ�� 1 - ������������� AutoIt ��ҳ, ��ȡ��
;				ҳ���е� 6 ��ͼ������� (ע��: �׷�ͼ������Ϊ 0)
;				����ʾ����Ϣ
; *******************************************************

#include <IE.au3>

Local $oIE = _IECreate("http://www.autoitscript.com/")
Local $oImg = _IEImgGetCollection($oIE, 5)
Local $sInfo = "Src: " & $oImg.src & @CR
$sInfo &= "FileName: " & $oImg.nameProp & @CR
$sInfo &= "Height: " & $oImg.height & @CR
$sInfo &= "Width: " & $oImg.width & @CR
$sInfo &= "Border: " & $oImg.border
MsgBox(4096, "4th Image Info", $sInfo)

; *******************************************************
; ʾ�� 2 - ������������� AutoIt ��ҳ, ��ȡ Img ����
;				����ʾ����ÿ����Դ URL
; *******************************************************

#include <IE.au3>

$oIE = _IECreate("http://www.autoitscript.com/")
Local $oImgs = _IEImgGetCollection($oIE)
Local $iNumImg = @extended
MsgBox(4096, "Img Info", "There are " & $iNumImg & " images on the page")
For $oImg In $oImgs
	MsgBox(4096, "Img Info", "src=" & $oImg.src)
Next

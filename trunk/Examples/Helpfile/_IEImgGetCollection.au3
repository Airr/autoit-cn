; *******************************************************
; ʾ��1 - ��������AutoIt��ҳ�������, ��ȡҳ���ϵ�6��ͼ�������(ע: �׸�ͼ�������Ϊ0), ����ʾ����Ϣ
; *******************************************************
#include  <IE.au3>
$oIE = _IECreate(" http://www.autoitscript.com/ ")
$oImg = _IEImgGetCollection($oIE, 5)
$sInfo = " Src:" & $oImg .src & @CR
$sInfo & = " FileName:" & $oImg .nameProp & @CR
$sInfo & = " Height:" & $oImg .height & @CR
$sInfo & = " Width:" & $oImg .width & @CR
$sInfo & = " Border:" & $oImg .border
msgbox(0, "4th Image Info ", $sInfo)

; *******************************************************
; ʾ��2 - ��������AutoIt��ҳ�������, ��ȡImg������ʾԴ��ַ
; *******************************************************
#include  <IE.au3>
$oIE = _IECreate(" http://www.autoitscript.com/ ")
$oImgs = _IEImgGetCollection($oIE)
$iNumImg = @extended
msgbox(0, "Img Info ", "There are" & $iNumImg & " images on the page ")
For $oImg In $oImgs
	msgbox(0, "Img Info  ", "src=" & $oImg .src)
Next



; ***************************************************************
; ʾ�� - ��Ԫ��д��һ��������, ���沢�ر��ļ�.
; *****************************************************************
#include  <Excel.au3>

Local $oExcel = _ExcelBookNew() ;�½�������, ��ʹ֮�ɼ�

$sLinkText = "AutoIt Website" ;T��Ԫ������ʾ���ı�, ��ͬ��OuterText
$sAddress = "http://www.AutoItScript.com" ;ʵ������, ��ͬ��ʹ��href
$sScreenTip = "AutoIt is Awesome! And Don't You Forget it!" ;��꾭��ʱ���ֵ���Ļ��ʾ
_ExcelHyperlinkInsert($oExcel, $sLinkText, $sAddress, $sScreenTip, 1, 2) ;����1��2������

msgbox(0, "Exiting", "Press OK to Save File and Exit")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; ���ڽ��䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ�
_ExcelBookClose($oExcel) ; And finally we close out


; ***************************************************************
; ʾ�� 1 ��Ԫ�����һ���������ı�, Ȼ�󱣴沢�ر��ļ�.
; *****************************************************************

#include <Excel.au3>

Local $oExcel = _ExcelBookNew() ;����һ���µĹ�������

Local $sLinkText = "AutoIt Website" ;��Ԫ������ʾ�ĳ������ı�, ��ͬ��OuterText
Local $sAddress = "http://www.AutoItScript.com" ;���ӵ���URL�ı�, ��ͬ��ʹ��href
Local $sScreenTip = "AutoIt is Awesome! And Don't You Forget it!" ;��꾭��ʱ�����ı���Ļ��ʾ
_ExcelHyperlinkInsert($oExcel, $sLinkText, $sAddress, $sScreenTip, 1, 2) ;��ָ��λ�ò���(�ڵ�1�е�2�в���)

MsgBox(4096, "�˳�", "��[ȷ��]�����ļ����˳�")
_ExcelBookSaveAs($oExcel, @TempDir & "\Temp.xls", "xls", 0, 1) ; ����ʱĿ¼�����ļ�, ����ļ��Ѵ����򸲸�ԭ�ļ�.
_ExcelBookClose($oExcel) ; �رչ�����,�˳�
; **************************************************************************************************************
; ʾ�� 1 - ������ѡ���ģʽ���ӵ���һ��ƥ���ַ�����Microsoft Excel��ʵ����.
; **************************************************************************************************************

#include <Excel.au3>
#include <File.au3>

Local $sFilePath = @TempDir & "\Temp.xls"
If Not _FileCreate($sFilePath) Then ;����һ��.XLS�ļ�
	MsgBox(4096, "����", " �����ļ�ʱ���� - " & @error)
EndIf

_ExcelBookOpen($sFilePath)
Local $oExcel = _ExcelBookAttach($sFilePath) ;����ģʽ: Excel������·��(Ĭ��ģʽ)
_ExcelWriteCell($oExcel, "��������?д����Ϣ�ɹ���!", 1, 1) ;��ָ����Excel������Ԫ��д����Ϣ.
MsgBox(4096, "�˳�", "��[ȷ��]�����ļ����˳�")
_ExcelBookClose($oExcel, 1, 0);��û���κ���ʾ������±�����ļ�,Ȼ��ر�.

; **************************************************************************************************************
; ʾ�� 2 - ������ѡ���ģʽ���ӵ���һ��ƥ���ַ�����Microsoft Excel��ʵ����.
; **************************************************************************************************************

#include <Excel.au3>
#include <File.au3>

$sFilePath = @TempDir & "\Temp.xls"
If Not _FileCreate($sFilePath) Then  ;����һ��.XLS�ļ�
	MsgBox(4096, "����", " �����ļ�ʱ���� - " & @error)
EndIf

_ExcelBookOpen($sFilePath)
$oExcel = _ExcelBookAttach("Temp.xls", "FileName") ;����ģʽ: Excel�����������
_ExcelWriteCell($oExcel, "��������?д����Ϣ�ɹ���!", 1, 1) ;��ָ����Excel������Ԫ��д����Ϣ.
MsgBox(4096, "�˳�", "��[ȷ��]�����ļ����˳�")
_ExcelBookClose($oExcel, 1, 0);��û���κ���ʾ������±�����ļ�,Ȼ��ر�.

; **************************************************************************************************************
; ʾ�� 3 - ������ѡ���ģʽ���ӵ���һ��ƥ���ַ�����Microsoft Excel��ʵ����.()
; **************************************************************************************************************

#include <Excel.au3>
#include <File.au3>

$sFilePath = @TempDir & "\Temp.xls"
If Not _FileCreate($sFilePath) Then ;����һ��.XLS�ļ�
	MsgBox(4096, "����", " �����ļ�ʱ���� - " & @error)
EndIf

_ExcelBookOpen($sFilePath)
$oExcel = _ExcelBookAttach("Microsoft Excel - Temp", "Title") ;����ģʽ: Excel������Ĵ��ڱ���
_ExcelWriteCell($oExcel, "��������?д����Ϣ�ɹ���!", 1, 1) ;��ָ����Excel������Ԫ��д����Ϣ.
MsgBox(4096, "�˳�", "��[ȷ��]�����ļ����˳�")
_ExcelBookClose($oExcel, 1, 0) ;��û���κ���ʾ������±�����ļ�,Ȼ��ر�.

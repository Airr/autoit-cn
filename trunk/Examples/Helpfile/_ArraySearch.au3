#include <Array.au3>

;===============================================================================
; ʾ�� 1 (ʹ��һά����)
;===============================================================================
Local $avArray[6] = [ _
"String0, SubString0", _
"String1, SubString1", _
"String2, SubString2", _
"String3, SubString3", _
"String4, SubString4", _
"String5, SubString5"]

_ArrayDisplay($avArray, "һά����")

$sSearch = InputBox("һά����������ʾ", "������Ҫ������ֵ��")
If @error Then Exit

$iIndex = _ArraySearch($avArray, $sSearch, 0, 0, 0, 1)
If @error Then
	MsgBox(0, "û���ҵ�ƥ����", "��" & $sSearch & "��������ϣ�û�н������ʾ��")
Else
	MsgBox(0, "�����ɹ�", "��" & $sSearch & "��������ϣ�λ�������еڡ�" & $iIndex & "���������С�")
EndIf

;===============================================================================
; ʾ�� 2 (ʹ�ö�ά����)
;===============================================================================
Local $avArray[6][2] = [ _
["String0", "SubString0"], _
["String1", "SubString1"], _
["String2", "SubString2"], _
["String3", "SubString3"], _
["String4", "SubString4"], _
["String5", "SubString5"]]

_ArrayDisplay($avArray, "��ά����")

$sSearch = InputBox("��ά����������ʾ", "������Ҫ������ֵ��")
If @error Then Exit

$sColumn = InputBox("��ά����������ʾ", "�����������ķ���" & @CRLF & "�ӿ�ʼ�����������������롰1��" & @CRLF & "�ӽ�������ʼ�����������롰0��")
If @error Then Exit
$sColumn = Int($sColumn)

$iIndex = _ArraySearch($avArray, $sSearch, 0, 0, 0, 1, $sColumn)
If @error Then
    MsgBox(0, "û���ҵ�ƥ����", "��" & $sSearch & "��������ϣ�û�н������ʾ��")
Else
	MsgBox(0, "�����ɹ�", "��" & $sSearch & "��������ϣ�λ�������еڡ�" & $iIndex & "���������С�")
EndIf

#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 1
    ��������:    _accessQueryLike()
    ����:        �������ݿ���ָ���ı��ڵ��ֶ�������ָ�����ַ���(����Ϊ�ռ�����ȫ���ַ���)   
    �﷨:        _accessQueryLike($adSource,$adTable, $adCol,$Find, [$adFull])
    ����:        $adSource  �����ݿ��ļ�������·���Լ����ݿ��ļ���
                 $adTable   �����ı�����
                 $adCol     �������ֶ���(����ʹ������)
                 $Find      �������ַ���(Ϊ�ռ�����ȫ����¼)
                 $adFull    ��� = 1 ʹ��Chr(28)��Ϊ�ָ���. (Ĭ��)
							��� <> 1 ����һ������ָ���ֶε�ÿһ����¼������
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
#include <Access.au3>
#include <Array.au3>
Dim $yo
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$adCol = "id"
$Find = ""
$adFull = 1

$yo = _accessQueryLike($adSource, $adTable, $adCol, $Find, $adFull)
_ArrayDisplay($yo, "��ȡ������������")

$aRecord = StringSplit($yo[1], Chr(28))
_ArrayDisplay($aRecord, "��ȡָ��ĳ����������")
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 2
	����:       �����ݿ��ļ��ж�ȡ������(��ȡ�����е�����)
	�﷨:       SELECT ������ FROM ������
	˵��:       BOF ָʾ��ǰ��¼λ��λ�� Recordset ����ĵ�һ����¼֮ǰ.
	            EOF ָʾ��ǰ��¼λ��λ�� Recordset ��������һ����¼֮��.
	            BOF �� EOF ���Է��ز�����ֵ��ʹ�� BOF �� EOF ���Կ�ȷ�� Recordset
	            �����Ƿ������¼�����ߴ�һ����¼�ƶ�����һ����¼ʱ�Ƿ񳬳� Recordset
	            ��������ơ������ǰ��¼λ�ڵ�һ����¼֮ǰ��BOF ���Խ����� True (-1)��
				�����ǰ��¼Ϊ��һ����¼��λ������򽫷��� False (0)��
	            �����ǰ��¼λ�� Recordset ��������һ����¼֮�� EOF ���Խ����� True��
	            ����ǰ��¼Ϊ Recordset ��������һ����¼��λ����ǰ���򽫷��� False��
	            ��� BOF �� EOF ����Ϊ True����û�е�ǰ��¼��
	            $RS.Fields(0).Value �Ƕ�ȡ���ݱ���ÿһ�е�1���ֶε�ֵ������
	            �����飬��0��ʼ���������������ơ�
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$addfld = ObjCreate("ADODB.Connection")
$addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource)
$RS = ObjCreate("ADODB.Recordset")
$RS.ActiveConnection = $addfld
$RS.Open("Select * From " & $adTable)
While Not $RS.eof And Not $RS.bof
	If @error = 1 Then ExitLoop
	MsgBox(0, $RS.Fields(0).value, $RS.Fields(0).value & "|" & $RS.Fields(1).value & "|" & $RS.Fields(2).value)
	$RS.movenext
WEnd
$RS.close
$addfld.Close
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 3
	��������:
	����:       �����ݿ��ļ��ж�ȡ������(��ȡָ���е�����)
	�﷨:       SELECT ������ FROM ������
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$adCol = "id,name,pass"
$addfld = ObjCreate("ADODB.Connection")
$addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource)
$RS = ObjCreate("ADODB.Recordset")
$RS.ActiveConnection = $addfld
$RS.Open("Select " & $adCol & " From " & $adTable)
While Not $RS.eof And Not $RS.bof
	If @error = 1 Then ExitLoop
	MsgBox(0, $RS.Fields(0).value, $RS.Fields(0).value & "|" & $RS.Fields(1).value & "|" & $RS.Fields(2).value)
	$RS.movenext
WEnd
$RS.close
$addfld.Close
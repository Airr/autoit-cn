#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:      ʾ�� 1
	��������:   _accessDeleteTable()
	����:      �����ݿ��ļ���ɾ����
	�﷨:       _accessDeleteTable($adSource, $adTable)
	����:      $adSource  - �����ݿ��ļ�������·���Լ����ݿ��ļ���
	           $adTable - �����ı�����
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
#include <Access.au3>
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"

_accessDeleteTable($adSource, $adTable)
MsgBox(64, "��ʾ", "ɾ����ɹ�", 5)
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:      ʾ�� 2
	����:      �����ݿ��ļ���ɾ����
	�﷨:      DROP TABLE ������
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"

$addtbl = ObjCreate("ADODB.Connection")
$addtbl.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource)
$addtbl.Execute("DROP TABLE " & $adTable)
$addtbl.Close
MsgBox(64, "��ʾ", "ɾ����ɹ�", 5)
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:      ʾ�� 3
	��������:   _accessDeleteTable()
	����:      �����ݿ��ļ���ɾ����
	�﷨:       _accessDeleteTable($adSource, $adTable)
	����:      $adSource  - �����ݿ��ļ�������·���Լ����ݿ��ļ���
	           $adTable - �����ı�����
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"

_accessDeleteTable($adSource, $adTable)
MsgBox(64, "��ʾ", "ɾ����ɹ�", 5)

Func _accessDeleteTable($adSource, $adTable)
   $oADO = ObjCreate("ADODB.Connection")
   $oADO.Provider = _adoProvider()
   $oADO.Open ($adSource)
   $oADO.execute ("DROP TABLE " & $adTable)
   $oADO.Close
EndFunc    ;<===> _accessDeleteTable()


Func _adoProvider()
   Local $oProvider = "Microsoft.Jet.OLEDB.4.0; "
   Local $objCheck = ObjCreate("Access.application")
   If IsObj($objCheck) Then
      Local $oVersion = $objCheck.Version
      If StringLeft($oVersion, 2) == "12" Then $oProvider="Microsoft.ACE.OLEDB.12.0; "
   EndIf
   Return $oProvider
EndFunc
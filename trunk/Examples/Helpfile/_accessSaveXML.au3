#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 1
	��������:     _accessSaveXML()
	����:         �����ݿ��ļ�����ָ���ı���ΪXML�ļ�
	�﷨:         _accessSaveXML($adSource, $adTable[,$oFile])
	����:         $adSource  - �����ݿ��ļ�������·���Լ����ݿ��ļ���
	$adTable - �����ı�����
	$oFile - ·���Լ�xml�ļ��� (Ĭ����չ��.xml)
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
#include <Access.au3>
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$oFile = @ScriptDir & "\DB1.xml"

If FileExists($oFile) Then
	MsgBox(64, "����ʧ��", $oFile & " �ļ��Ѵ���.")
Else
	_accessSaveXML($adSource, $adTable, $oFile)
	MsgBox(0, "��ʾ", "�����ɹ�.")
EndIf
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:         ʾ�� 2
	����:         �����ݿ��ļ�����ָ���ı���ΪXML�ļ�
	�﷨:         SELECT * FROM ����
				  $RS.Save �� Recordset ���󱣴浽 file �� Stream �����С�
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
#include <Access.au3>
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$oFile = @ScriptDir & "\DB1.xml"

$addfld = ObjCreate("ADODB.Connection")
$addfld.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource)
$RS = ObjCreate("ADODB.Recordset")
$RS.ActiveConnection = $addfld
$RS.Open("SELECT * FROM " & $adTable)
$RS.MoveFirst()
If FileExists($oFile) Then
	MsgBox(64, "����ʧ��", $oFile & " �ļ��Ѵ���.")
Else
	$RS.Save($oFile, 1)
	MsgBox(0, "��ʾ", "�����ɹ�.")
EndIf
$RS.close
$addfld.Close
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 3
	��������:     _accessSaveXML()
	����:         �����ݿ��ļ�����ָ���ı���ΪXML�ļ�
	�﷨:         _accessSaveXML($adSource, $adTable[,$oFile])
	����:         $adSource  - �����ݿ��ļ�������·���Լ����ݿ��ļ���
	              $adTable - �����ı�����
	              $oFile - ·���Լ�xml�ļ��� (Ĭ����չ��.xml)
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$adTable = "Table1"
$oFile = @ScriptDir & "\DB1.xml"

_accessSaveXML($adSource, $adTable, $oFile)

Func _accessSaveXML($adSource, $adTable, $oFile = '')
	If $oFile = '' Then $oFile = StringLeft($adSource, StringInStr($adSource, '\', 0, -1)) & $adTable & '.xml'
	If Not StringInStr($oFile, '\') Then $oFile = StringLeft($adSource, StringInStr($adSource, '\', 0, -1)) & $oFile
	If StringRight($oFile, 4) <> '.xml' Then $oFile &= '.xml'
	$oADO = 'ADODB.Connection'
	If IsObj($oADO) Then
		$oADO = ObjGet('', $oADO)
	Else
		$oADO = _dbOpen($adSource)
	EndIf
	If IsObj($oADO) = 0 Then Return SetError(1)
	$oRec = _dbOpenRecordset()
	$oRec.Open("SELECT * FROM " & $adTable, $oADO, 3, 3)
	$oRec.MoveFirst()
	If FileExists($oFile) Then
		MsgBox(64, "����ʧ��", $oFile & " �ļ��Ѵ���.")
	Else
		$oRec.Save($oFile, 1)
		MsgBox(0, "��ʾ", "�����ɹ�.")
	EndIf
	$oRec.Close()
	$oADO.Close()
EndFunc   ;==>_accessSaveXML

Func _dbOpen($adSource)
	$oProvider = "Microsoft.Jet.OLEDB.4.0; "
	$objCheck = ObjCreate("Access.application")
	If IsObj($objCheck) Then
		$oVersion = $objCheck.Version
		If StringLeft($oVersion, 2) == "12" Then $oProvider = "Microsoft.ACE.OLEDB.12.0; "
	EndIf
	$oADO = ObjCreate("ADODB.Connection")
	$oADO.Provider = $oProvider
	$oADO.Open($adSource)
	Return $oADO
EndFunc   ;==>_dbOpen

Func _dbOpenRecordset()
	$oRec = ObjCreate("ADODB.Recordset")
	Return $oRec
EndFunc   ;==>_dbOpenRecordset
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 1
	��������:    _accessListTables()
	����:        ��ȡ���ݿ��ļ������еı�����
	�﷨:        _accessListTables($adSource)
	����:        $adSource  - �����ݿ��ļ�������·���Լ����ݿ��ļ���
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
#include <Access.au3>
$adSource = @ScriptDir & "\DB1.mdb"

MsgBox(0, "�������",  _accessListTables($adSource))
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 2
	����:        ��ȡ���ݿ��ļ������еı�����
	����:        OpenSchema �ɷ��� Recordset ���󣬸ö�������й�����Դ��ģʽ��Ϣ��
	TABLE_TYPE = ������
	TABLE_NAME = ������
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
$oList = ''

$oADO = ObjCreate("ADODB.Connection")
$oADO.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource)
$oRec = $oADO.OpenSchema(20)
While Not $oRec.EOF
	If StringLen( $oRec("TABLE_TYPE" ).value) > 5 Then
		$oRec.movenext
		ContinueLoop
	EndIf
	MsgBox(0, "�������", $oRec("TABLE_NAME" ).value)
	$oList = $oList & $oRec("TABLE_NAME" ).value & '|'
	$oRec.movenext
WEnd
MsgBox(0, "�������", $oList)
$oADO.close
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
	����:        ʾ�� 3
	��������:    _accessListTables()
	����:        ��ȡ���ݿ��ļ������еı�����
	�﷨:        _accessListTables($adSource)
	����:        $adSource  - �����ݿ��ļ�������·���Լ����ݿ��ļ���
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"

MsgBox(0, "�������", _accessListTables($adSource))

Func _accessListTables($adSource)
	Local $oList = ''
	$oADO = 'ADODB.Connection'
	If IsObj($oADO) Then
		$oADO = ObjGet('', $oADO)
	Else
		$oADO = _dbOpen($adSource)
	EndIf
	If IsObj($oADO) = 0 Then Return SetError(1)
	$oRec = $oADO.OpenSchema(20)
	While Not $oRec.EOF
		If StringLen( $oRec("TABLE_TYPE" ).value) > 5 Then;; Skip the hidden internal tables
			$oRec.movenext
			ContinueLoop
		EndIf
		$oList = $oList & $oRec("TABLE_NAME" ).value & '|'
		$oRec.movenext
	WEnd
	If $oList <> '' Then
		$oADO.close
		Return '|' & StringTrimRight($oList, 1)
	Else
		SetError(3, 0, 0)
		$oADO.close
		Return $oList
	EndIf
EndFunc   ;==>_accessListTables

Func _dbOpen($adSource);�����ݿ�
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

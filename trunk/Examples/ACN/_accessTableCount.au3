#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
 ����:        ʾ�� 1
 ��������:    _accessTableCount()
 ����:       ͳ�����ݿ��ļ����ж��ٸ���
 �﷨:        _accessTableCount($adSource)
 ����:       $adSource  - �������ݿ��ļ�������·��
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
#include <Access.au3>
$adSource = @ScriptDir & "\DB1.mdb"

MsgBox(4096, '�������', '�����ݿ��й��С�' & _accessTableCount($adSource) & '������')
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
 ����:        ʾ�� 2
 ����:       ͳ�����ݿ��ļ����ж��ٸ���
 ˵��:       ������������2�����з�����������ѡ�к��ʵ�.
             �����Ӳ�ѯ���ý�����ܻ������1������3��һ��.
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"

$oADO = ObjCreate("ADODB.Connection")
$oADO.Open("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $adSource)
$oRec = $oADO.OpenSchema(20)

$oList_A = ''
$oList_B = ''
$A = 0
$B = 0
While Not $oRec.EOF
	;���� 1-----------------------------------------------------------------------
	If $oRec("TABLE_TYPE" ).value = "TABLE" Then
		$A += 1
	Else
		$oRec.movenext
		ContinueLoop
	EndIf
	$oList_A = $oList_A & "��" & $A & "=" & $oRec("TABLE_NAME" ).value & @CRLF
	;���� 2-----------------------------------------------------------------------
	If StringLen( $oRec("TABLE_TYPE" ).value) = 12 Then
		$oRec.movenext
		ContinueLoop
	EndIf

	If Not $oRec("TABLE_NAME" ).value = "" Then $B += 1
	$oList_B = $oList_B & "��" & $B & "=" & $oRec("TABLE_NAME" ).value & @CRLF
	;----------------------------------------------------------------------------
	$oRec.movenext
WEnd
MsgBox(4096, '����1 �������', '�����ݿ��й��С�' & $A & '������' & @CRLF & @CRLF & $oList_A)
MsgBox(4096, '����2 �������', '�����ݿ��й��С�' & $B & '������' & @CRLF & @CRLF & $oList_B)
$oADO.close
#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
 ����:        ʾ�� 3
 ��������:    _accessTableCount()
 ����:       ͳ�����ݿ��ļ����ж��ٸ���
 �﷨:        _accessTableCount($adSource)
 ����:       $adSource  - �������ݿ��ļ�������·��
#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"

MsgBox(4096, '�������', '�����ݿ��й��С�' & _accessTableCount($adSource) & '������')

Func _accessTableCount($adSource)
	$T_Count = StringSplit(_accessListTables($adSource), '|')
	Return $T_Count[0]
EndFunc   ;==>_accessTableCount

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
		If StringLen( $oRec("TABLE_TYPE" ).value) > 5 Then
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

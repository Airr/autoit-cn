;===============================================================================
; ����:        ʾ�� 1
; ��������:    _accessCreateDB ()
; ����:       ����һ�����ݿ��ļ�(*. mdb)
; �﷨:        _accessCreateDB ($adSource)
; ����:       $adSource  - �������ݿ��ļ�������·��
;===============================================================================
#AutoIt3Wrapper_UseX64 = n
#include <Access.au3>
$mdb_data_path = @ScriptDir & "\DB1.mdb"

_accessCreateDB($mdb_data_path)
MsgBox(64, "��ʾ", "�������ݿ�ɹ�", 5)

;===============================================================================
; ����:      ʾ�� 2
; ����:      ����һ�����ݿ��ļ�(*. mdb)
; ˵��:      ADOX��ADODB�Ķ�����չ�⣬���Ķ�������ڴ������޸ĺ�ɾ�����ݿ⡣
;            ����������ȫ���󣬿�����ά���û����飬�Լ�����ͳ��������Ȩ�ޡ�
;            ����ʹ�õĶ���Catalog �����ڴ���������������ԴģʽĿ¼�ļ��ϡ�
;            Create �����µ�Ŀ¼����Provider= Microsoft.Jet.OLEDB.4.0����ʾ���ݿ�����ͣ�
;            ��DataSource=" & $mdb_data_path�����ݿⴴ����·�������ơ�
;            ����ǽ���������(ActiveConnectionָʾĿ¼������ ADO Connection ����)
;===============================================================================
#AutoIt3Wrapper_UseX64 = n
$mdb_data_path = @ScriptDir & "\DB1.mdb"

If Not FileExists($mdb_data_path) Then;����ű�����Ŀ¼û�з������ݿ��ļ����򴴽����ݿ��ļ���
	$newMdb = ObjCreate("ADOX.Catalog")
	$newMdb.Create("Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & $mdb_data_path);�����µ�Ŀ¼
	$newMdb.ActiveConnection.Close
	MsgBox(64, "��ʾ", "�������ݿ�ɹ�", 5)
Else
	MsgBox(64, "��ʾ", "���Ѿ�������һ�����ݿ���", 5)
EndIf
;===============================================================================
; ����:        ʾ�� 3
; ��������:    _accessCreateDB ()
; ����:       ����һ�����ݿ��ļ�(*. mdb)
; �﷨:        _accessCreateDB ($adSource)
; ����:       $adSource  - �������ݿ��ļ�������·��
;===============================================================================
#AutoIt3Wrapper_UseX64 = n
$mdb_data_path = @ScriptDir & "\DB1.mdb"

_accessCreateDB($mdb_data_path)

Func _accessCreateDB($adSource)
	$oProvider = "Microsoft.Jet.OLEDB.4.0; "
	$objCheck = ObjCreate("Access.application")
	If IsObj($objCheck) Then
		$oVersion = $objCheck.Version
		If StringLeft($oVersion, 2) == "12" Then $oProvider = "Microsoft.ACE.OLEDB.12.0; "
	EndIf
	If StringRight($adSource, 4) <> '.mdb' Then $adSource &= '.mdb'
	If FileExists($adSource) Then
		$Fe = MsgBox(262196, '����', '����ļ��Ѿ����ڣ��Ƿ��滻����ļ���')
		If $Fe = 6 Then
			FileDelete($adSource)
			$dbObj = ObjCreate('ADOX.Catalog')
			If IsObj($dbObj) Then
				$dbObj.Create('Provider = ' & $oProvider & 'Data Source = ' & $adSource)
				MsgBox(64, "��ʾ", "�������ݿ�ɹ�", 5)
			Else
				MsgBox(262160, '����', '����ʧ�ܣ�')
			EndIf
		EndIf
	Else
		$dbObj = ObjCreate('ADOX.Catalog')
		If IsObj($dbObj) Then
			$dbObj.Create('Provider = ' & $oProvider & 'Data Source = ' & $adSource)
			MsgBox(64, "��ʾ", "�������ݿ�ɹ�", 5)
		Else
			MsgBox(262160, '����', '����ʧ�ܣ�')
		EndIf
	EndIf
EndFunc   ;==>_accessCreateDB

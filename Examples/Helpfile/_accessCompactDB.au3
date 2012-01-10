;===============================================================================
; ����:        ʾ�� 1
; ��������:   _accessCompactDB()
; ����:       ѹ�����ݿ��ļ�(*. mdb)
; �﷨:       _accessCompactDB($adSource)
; ����:       $adSource - �����ݿ��ļ�������·��
;===============================================================================
#AutoIt3Wrapper_UseX64 = n
#include <Access.au3>

$adSource = @ScriptDir & "\DB1.mdb"
_accessCompactDB($adSource)
;===============================================================================
; ����:        ʾ�� 2
; ��������:   _accessCompactDB()
; ����:       ѹ�����ݿ��ļ�(*. mdb)
; �﷨:       _accessCompactDB($adSource)
; ����:       $adSource - �����ݿ��ļ�������·��
;===============================================================================
#AutoIt3Wrapper_UseX64 = n
$adSource = @ScriptDir & "\DB1.mdb"
_accessCompactDB($adSource)

Func _accessCompactDB($adSource)
   If FileExists($adSource) Then
      $adDest = @TempDir & "\Temp.mdb"
      $obj = "JRO.JetEngine"
      If FileExists($adDest) Then FileDelete($adDest)
      If NOT IsObj($obj) Then
         $oMDB = ObjCreate($obj)
      Else
         $oMDB = ObjGet($obj)
      EndIf
      If IsObj($oMDB) Then
         $oMDB.CompactDatabase("Provider = " & _adoProvider() & "Data Source = " & $adSource, _
               "Provider = " & _adoProvider() & "Data Source = " & $adDest)
         SetError(0)
      Else
         Return SetError(1)
      EndIf
      FileMove($adDest, $adSource, 1)
   EndIf
EndFunc   ;<===>_accessCompactDB()

Func _adoProvider()
   Local $oProvider = "Microsoft.Jet.OLEDB.4.0; "
   Local $objCheck = ObjCreate("Access.application")
   If IsObj($objCheck) Then
      Local $oVersion = $objCheck.Version
      If StringLeft($oVersion, 2) == "12" Then $oProvider="Microsoft.ACE.OLEDB.12.0; "
   EndIf
   Return $oProvider
EndFunc

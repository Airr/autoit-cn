#include-once

;===============================================================================
;
; Description:      ����ָ���ı��ļ�������.
; Syntax:           _FileCountLines( $sFilePath )
; Parameter(s):     $sFilePath - ·��+�ļ���
; Requirement(s):   ��
; Return Value(s):  �ɹ� - �����ļ�������
;                   ʧ�� - ����0 ������ @error = 1
; Author(s):        Tylo <tylo at start dot no> ���� by thesnow
;
;===============================================================================
Func _FileCountLines($sFilePath)
	Local $N = FileGetSize($sFilePath) - 1
	Local $M= ""
	If @error Or $N = -1 Then Return 0
	$M=FileRead($sFilePath)
	$M=StringReplace($M,@CRLF,@CR)
	$M=StringSplit($M,@CR)
	Return $M[0]
EndFunc   ;==>_FileCountLines



;======================================================
;
; ��������:		_EncryptFile($sFilePath)
; ��ϸ��Ϣ:		�����ļ�,NTFS����ϵͳ�Դ���EFS����
; $sFilePath:	$sFilePath Ϊ������ܵ��ļ�.
; ����ֵ :		û��
; ����:			thesnow(rundll32@126.com)
;
;======================================================

Func _EncryptFile($sFilePath)
	Local $ret
	$ret=dllcall(@SystemDir & "\advapi32.dll","int","EncryptFile","str",$sFilePath)
	Return $ret
EndFunc  


;======================================================
;
; ��������:		_DecryptFile($sFilePath)
; ��ϸ��Ϣ:		�����ļ�,NTFS����ϵͳ�Դ���EFS����
; $sFilePath:	$sFilePath Ϊ������ܵ��ļ�.
; ����ֵ :		û��
; ����:			thesnow(rundll32@126.com)
;
;======================================================

Func _DecryptFile($sFilePath)
	Local $ret
	$ret=dllcall(@SystemDir & "\advapi32.dll","int","DecryptFile","str",$sFilePath,"int",1)
	Return $ret
EndFunc  


;======================================================
;
; ��������:		_HideSystemFolder($PathCode,$Hide)
; ��ϸ��Ϣ:		����ϵͳ�����ļ���.
; $PathCode:	ϵͳ�ļ��д���:
;				0,�������/1,�����ļ���Ŀ¼/2,ϵͳ����������/3,windowsĿ¼
; $Hide:		����Ϊ1,������Ϊ0.
; ����ֵ :		�ɹ�����1,ʧ��(�ļ��д������)����0,ʧ��(���ش������),����0.
; ����:			thesnow(rundll32@126.com)
;
;======================================================

Func _HideSystemFolder($PathCode = 4,$Hide=True)
If Not IsInt($Hide) Then Return 0
Switch $PathCode
	Case 0 
		RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\WebView\BarricadedFolders","shell:ControlPanelFolder","REG_DWORD",Hex($Hide))
	Case 1
 		RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\WebView\BarricadedFolders","shell:ProgramFiles","REG_DWORD",Hex($Hide))
	Case 2
		RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\WebView\BarricadedFolders","shell:SystemDriveRootFolder","REG_DWORD",Hex($Hide))
	Case 3
		RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\WebView\BarricadedFolders","shell:Windows","REG_DWORD",Hex($Hide))
	Case else
		Return 0
EndSwitch
Return 1
EndFunc  
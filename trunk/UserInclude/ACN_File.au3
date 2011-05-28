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

;======================================================
;
; ��������:		_FileReadAsUnicode($sFile,$dCodepage)
; ��ϸ��Ϣ:		��ȡANSI�ļ�����UNICODE�ַ�.
; $sFile:		�ļ�·��.
; $dCodepage:	����ҳ.�ο� http://msdn.microsoft.com/en-us/library/dd317756.aspx
; ����ֵ :		�ɹ�����UNICODE�ַ�,����SetExtendedΪ���ص��ַ���.
;				ʧ��,���ؿ��ַ�������@error.
;				@error=-1	�ļ�������
;				@error=-2	�ļ�ΪUTF-32����
;				@error=-3	�ļ��޷���
;				@error=-4	�ļ��޷����б���ת��
; ����:			thesnow(rundll32@126.com)
;
;======================================================

Func _FileReadAsUnicode($sFile,$dCodepage=0)
	Local $AnsiFile,$UnicodeFile
	If Not FileExists($sFile) Then Return SetError(-1,0,"")
	Local $hFile=_GetFileEnc($sFile)
	If $hFile=-1 Then Return SetError(-2,0,"")
	If $hFile<>16 Then 
		$UnicodeFile=FileRead($sFile)
		Return $UnicodeFile
	Else
		$hFile=FileOpen($sFile,$hFile)
		If $hFile=-1 Then 
			FileClose($hFile)
			Return SetError(-3,0,"")
		EndIf
		$AnsiFile=FileRead($hFile)
		FileClose($hFile)
		Local $kernel = DllOpen('Kernel32.dll')
		Local $TxtSize=BinaryLen($AnsiFile)
		Local $lpSrc = DLLStructCreate("byte [" & $TxtSize & "]")
		DllStructSetData($lpSrc,1,$AnsiFile)
		Local $lpDst = DLLStructCreate("byte [" & $TxtSize*2 & "]")
		Local $rt=DLLCall($kernel,"int","MultiByteToWideChar", _
                    "int",$dCodepage, _
                    "int",1, _
                    "ptr",DllStructGetPtr($lpSrc), _
                    "int",-1, _
                    "ptr",DllStructGetPtr($lpDst), _
                    "int",$TxtSize*2)
		If $rt[0]=0 Then Return SetError(-4,0,"")
		Local $UnicodeFile=BinaryToString(DllStructGetData($lpDst,1),2)
		DllClose($Kernel)
		SetExtended($rt[0])
		Return $UnicodeFile
	EndIf
EndFunc


Func _GetFileEnc($TheFile)
	Local $hTest_File = FileOpen($TheFile, 16)
	Local $Test_File = FileRead($hTest_File, 4)
	Local $FileEnc=0	;ansi
	FileClose($hTest_File)
;~ 00 00 FE FF UTF-32, big-endian
;~ FF FE 00 00 UTF-32, little-endian
;~ FE FF UTF-16, big-endian
;~ FF FE UTF-16, little-endian
;~ EF BB BF UTF-8
	If $Test_File = "0x0000FFFE" then
		$FileEnc=-1;'UTF32BE'	��֧��
	Else 
		if $Test_File = "0xFFFE0000" Then
			$FileEnc=-1;'UTF32LE'	��֧��
		Else
			$hTest_File = FileOpen($TheFile, 16)
			$Test_File = FileRead($hTest_File, 2)
			FileClose($hTest_File)
			If $Test_File = "0xFFFE" Then
				$FileEnc=32;'UTF16LE'
			Else
				If $Test_File = "0xFEFF" Then
					$FileEnc=64;'UTF16BE'
				Else
					$hTest_File = FileOpen($TheFile, 16)
					$Test_File = FileRead($hTest_File, 3)
					FileClose($hTest_File)
					If $Test_File = "0xEFBBBF" Then
						$FileEnc=128;'UTF8'
					Else
						$FileEnc=16;ansi
					EndIf
				EndIf
			EndIf
		EndIf
	EndIf
	Return $FileEnc
EndFunc
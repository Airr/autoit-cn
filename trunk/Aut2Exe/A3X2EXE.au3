#cs ----------------------------------------------------------------------------

 AutoIt �汾: 3.2.5.1(��һ��)
 �ű�����: 
	Email: 
	QQ/TM: 
 �ű��汾: 
 �ű�����: 

#ce ----------------------------------------------------------------------------


#Region AutoIt3Wrapper �������
#AutoIt3Wrapper_UseAnsi=y
#AutoIt3Wrapper_Icon= 						
#AutoIt3Wrapper_OutFile=..\autoit3\Aut2Exe\A3X2EXE.exe					
#AutoIt3Wrapper_OutFile_Type=exe				
#AutoIt3Wrapper_Compression=4				
#AutoIt3Wrapper_UseUpx=n			
#AutoIt3Wrapper_Res_Comment=����A3X��EXE	 					
#AutoIt3Wrapper_Res_Description=����A3X��EXE				
#AutoIt3Wrapper_Res_Fileversion=3.2.11.1
#AutoIt3Wrapper_Res_FileVersion_AutoIncrement=p                                               
#AutoIt3Wrapper_Res_LegalCopyright=thesnow 		
#AutoIt3Wrapper_Res_Field=AutoIt Version|%AutoItVer%
#AutoIt3Wrapper_Res_Field=thesnow|rundll32@126.com
#AutoIt3Wrapper_Run_Tidy=                   
#AutoIt3Wrapper_Run_AU3Check= 				
#AutoIt3Wrapper_Run_Before= 	
#EndRegion AutoIt3Wrapper ��������������
#NoTrayIcon
; �ű���ʼ - �������������Ĵ���.
#include <Process.au3>
$AutoItASC=@ScriptDir & "\AutoItSC.bin"
MsgBox(32,"˵��:","������߿��Խ�A3X�ű�ת��ΪEXE�ļ�." & @CRLF & "��ʽ:A3X=����(�ű�)	EXE=AutoItSC.bin+A3X+(UPX)")
$file=FileOpenDialog("ѡ������A3X�ű��ļ�","","A3X �ļ�(*.A3X)")
if @error = 1 then Exit
if FileExists($file) Then _RunDOS("copy /b " & $AutoItASC & "+" & $file & " " & $file & ".exe")
$YN=MsgBox(36,"��ϲ!�ɹ����!","��ϲ�Ѿ�ת��A3X��EXE,�Ƿ���Ҫ����UPXѹ��?")
If $YN=6 Then Run("cmd /k " & @ScriptDir & "\upx.exe " & $file & ".exe" )
#cs ----------------------------------------------------------------------------
	
	AutoIt �汾: 3.2.8.1(��һ��)
	�ű�����:
	Email:
	QQ/TM:
	�ű��汾:
	�ű�����:
	
#ce ----------------------------------------------------------------------------


#Region AutoIt3Wrapper �������
#AutoIt3Wrapper_UseAnsi=y
#AutoIt3Wrapper_Icon= TC.ico
#AutoIt3Wrapper_OutFile= 
#AutoIt3Wrapper_OutFile_Type=exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Res_Comment= �����ļ�ת��Ϊ�ű�(��FileInstall)��Ҫ����UDF�а����ļ���
#AutoIt3Wrapper_Res_Description= thesnow
#AutoIt3Wrapper_Res_Fileversion=3.2.11.1
#AutoIt3Wrapper_Res_FileVersion_AutoIncrement=p
#AutoIt3Wrapper_Res_LegalCopyright= thesnow
#AutoIt3Wrapper_Run_Tidy=
#AutoIt3Wrapper_Run_Obfuscator=
#AutoIt3Wrapper_Run_AU3Check=
#AutoIt3Wrapper_Run_Before=
#AutoIt3Wrapper_Run_After=
#EndRegion AutoIt3Wrapper ��������������

; �ű���ʼ - �������������Ĵ���.
#NoTrayIcon
MsgBox(32,"�˳�����ڵı�Ҫ","��AUTOIT��,INCLUDEĿ¼�ŵ�UDF�����Ҫ�����ļ�,ֻ���Ƕ�����д��(���ļ��ŵ�INCLUDEĿ¼����ʱ�޷��ҵ��ļ�).���������ת��.")


$OpenFilename = FileOpenDialog("ѡ����Ҫת�����ļ�", -1, "�����ļ�(*.*)")
If $OpenFilename = "" Then Exit
if FileGetSize($OpenFilename) > (5 * 1024^2) Then
	MsgBox(32,"ע��!","�������������д����ļ���,��Ϊ�ļ�����5M,�����˳�!")
	Exit
EndIf
$SaveFilename = FileSaveDialog("ѡ����Ҫ������ļ�", -1, "�ű��ļ�(*.au3)")
If $SaveFilename = "" Then Exit
if StringRight($SaveFilename,3) <> "au3" then $SaveFilename &= ".au3"
$fileopen = FileOpen($OpenFilename, 16)
$time=TimerInit()
ToolTip("��ʼת��,�������ļ��Ĵ�С��ͬ������ʱ�䲻ͬ." & @CRLF & "��ǰ����0%",0,0)
$FuncName=StringReplace($OpenFilename,"/","\")
$FuncName=StringReplace($OpenFilename,".","_")
$FuncName=StringSplit($FuncName,"\")
FileWriteLine($SaveFilename, 'Func ' & $FuncName[$FuncName[0]] & '()')
FileWriteLine($SaveFilename, 'Local $FileBin=""')
$size=FileGetSize($OpenFilename)
For $i = 1 To $size Step 100
	ToolTip("��ʼת��,�������ļ��Ĵ�С��ͬ������ʱ�䲻ͬ." & @CRLF & "��ǰ����" & Round(($i/$size),3) * 100 & "%",0,0)
	$file = FileRead($fileopen, 100)
	FileWriteLine($SaveFilename, '$FileBin &="' & StringReplace($file, "0x", "") & '"')
Next
FileWriteLine($SaveFilename, 'Return Binary("0x" & $FileBin)')
FileWriteLine($SaveFilename, 'EndFunc')
FileWriteLine($SaveFilename & ".����.au3", '#include <' & $SaveFilename & '>')
FileWriteLine($SaveFilename & ".����.au3", 'FileWrite("' & $OpenFilename & '",' & $FuncName[$FuncName[0]] & '())')
ToolTip("")
MsgBox(32, "", "�Ѿ�ת����ɣ���ʱ " & TimerDiff($time)/1000 & "��")

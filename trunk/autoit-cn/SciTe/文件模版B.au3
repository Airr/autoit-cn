#Region AutoIt3Wrapper Ԥ�������(��������)
;** ����б����еı�����������Ϊ AutoIt3Wrapper.exe ʹ�õģ�ͬʱҲ����ACN��̳��ACNWrapper.exe.
;** ע���в���Ҫ��ɾ��������һЩ������Ϣ�����ᵽ���յ�EXE��.
;===============================================================================================================
;** AUTOIT3 ����
#AutoIt3Wrapper_UseAnsi=N                       ;(Y/N) ʹ�� Ansi �汾�� AutoIt3a/AUT2EXEa. Ĭ��=N(3.2.13.1��ʼ�˺���ʧЧ)
#AutoIt3Wrapper_UseX64=                         ;(Y/N) ʹ�� X64 �汾�� AutoIt3_x64/AUT2EXE_x64. Ĭ��=N
#AutoIt3Wrapper_Run_Debug_Mode=                 ;(Y/N) ���нű��ڿ���ͼ����. Ĭ��=N
;===============================================================================================================
;** AUT2EXE ����
#AutoIt3Wrapper_Icon=                           ;��Ҫʹ�õ�ͼ��(·��)����
#AutoIt3Wrapper_OutFile=                        ;Ŀ�� exe/a3x �ļ���.
#AutoIt3Wrapper_OutFile_Type=exe                ;a3x=С�� AutoIt3 �ļ�; exe=��׼��ִ���ļ�(Ĭ��)
#AutoIt3Wrapper_Compression=                    ;ѹ������ 0-4 ?=�� 2=�� 4=�� Ĭ��=2
#AutoIt3Wrapper_UseUpx=                         ;(Y/N) ѹ������ĳ���.  Ĭ��=Y
#AutoIt3Wrapper_Change2CUI=                     ;(Y/N) �޸�����ĳ���ΪCUI(����̨����). Ĭ��=N
;===============================================================================================================
;** Ŀ�������Դ��Ϣ
#AutoIt3Wrapper_Res_Comment=                    ;ע��
#AutoIt3Wrapper_Res_Description=                ;��ϸ��Ϣ
#AutoIt3Wrapper_Res_Fileversion=                ;�ļ��汾
#AutoIt3Wrapper_Res_FileVersion_AutoIncrement=  ;(Y/N/P)�Զ����°汾  . Ĭ��=N P=��ʾ
;                                              
#AutoIt3Wrapper_Res_Language=                   ;��Դ���Դ���. �ٷ�Ĭ�� 2057=Ӣ�� (Ӣ��),ACN�汾Ĭ�� 2052=��������(�й�)
#AutoIt3Wrapper_Res_LegalCopyright=             ;��Ȩ
#AutoIt3Wrapper_res_requestedExecutionLevel=    ;None, asInvoker, highestAvailable or requireAdministrator   (Ĭ��=None)
												;��  , ����     ,���Ȩ��        ����  �������ԱȨ��
#AutoIt3Wrapper_Res_SaveSource=                 ;(Y/N) ����Դ���뱸�ݵ�EXE��Դ��. Ĭ��=N
;
; free form resource fields ... max 15
;     you can use the following variables:
;     %AutoItVer% which will be replaced with the version of AutoIt3
;     %date% = PC date in short date format
;     %longdate% = PC date in long date format
;     %time% = PC timeformat
;  eg: #AutoIt3Wrapper_Res_Field=AutoIt Version|%AutoItVer%
#AutoIt3Wrapper_Res_Field=                      ;Free format fieldname|fieldvalue
#AutoIt3Wrapper_Res_Field=                      ;Free format fieldname|fieldvalue
#AutoIt3Wrapper_Res_Field=                      ;Free format fieldname|fieldvalue
; Add extra ICO files to the resources which can be used with TraySetIcon(@ScriptFullPath, 3) etc
; list of filename of the Ico files to be added, First one will have number 3, then 4 ..etc
#AutoIt3Wrapper_Res_Icon_Add=                   ; Filename of ICO to be added.
#AutoIt3Wrapper_Res_Icon_Add=                   ; Filename of ICO to be added.
; Add extra files to the resources
#AutoIt3Wrapper_Res_File_Add=                   ; Filename[,Section [,ResName]] to be added.
#AutoIt3Wrapper_Res_File_Add=                   ; Filename[,Section [,ResName]] to be added.
;===============================================================================================================
; Tidy Settings
#AutoIt3Wrapper_Run_Tidy=                       ;(Y/N) Run Tidy before compilation. default=N
#AutoIt3Wrapper_Tidy_Stop_OnError=              ;(Y/N) Continue when only Warnings. default=Y
#Tidy_Parameters=                               ;Tidy Parameters...see SciTE4AutoIt3 Helpfile for options 
;===============================================================================================================
; Obfuscator
#AutoIt3Wrapper_Run_Obfuscator=                 ;(Y/N) Run Obfuscator before compilation. default=N
#obfuscator_parameters=
;===============================================================================================================
; AU3Check settings
#AutoIt3Wrapper_Run_AU3Check=                   ;(Y/N) Run au3check before compilation. Default=Y
#AutoIt3Wrapper_AU3Check_Parameters=            ;Au3Check parameters
#AutoIt3Wrapper_AU3Check_Stop_OnWarning=        ;(Y/N) N=Continue on Warnings.(Default) Y=Always stop on Warnings 
;#AutoIt3Wrapper_PlugIn_Funcs=                   ;Define PlugIn function names separated by a Comma to avoid AU3Check errors
;===============================================================================================================
; cvsWrapper settings
#AutoIt3Wrapper_Run_cvsWrapper=                 ;(Y/N/V) Run cvsWrapper to update the script source. default=N 
;                                                 V=only when version is increased by #AutoIt3Wrapper_Res_FileVersion_AutoIncrement.
#AutoIt3Wrapper_cvsWrapper_Parameters=          ; /NoPrompt  : Will skip the cvsComments prompt
;                                                 /Comments  : Text to added in the cvsComments. It can also contain the below variables. 
;===============================================================================================================
; RUN BEFORE AND AFTER definitions
; The following directives can contain: these variables
; ��%in% , %out%, %icon% which will be replaced by the fullpath\filename.
; ��%scriptdir% same as @ScriptDir and %scriptfile% = filename without extension.
; ��%fileversion% is the information from the #AutoIt3Wrapper_Res_Fileversion directive
;   %scitedir% will be replaced by the SciTE program directory
;   %autoitdir% will be replaced by the AutoIt3 program directory
#AutoIt3Wrapper_Run_Before=                     ;process to run before compilation - you can have multiple records that will be processed in sequence
#AutoIt3Wrapper_Run_After=                      ;process to run After compilation - you can have multiple records that will be processed in sequence
#EndRegion

#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

 AU3 �汾: 
 �ű�����: 
	Email: 
	QQ/TM: 
 �ű��汾: 
 �ű�����: 

#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�


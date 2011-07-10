#Region ACNԤ����������(��������)
;** ע���в���Ҫ��ɾ��������һЩ������Ϣ�����ᵽ���յ�EXE��.
;===============================================================================================================
;** AUTOIT3 ����
#PRE_UseX64=                         ;(Y/N) ʹ�� X64 �汾�� AutoIt3_x64/AUT2EXE_x64. Ĭ��=N
#PRE_Run_Debug_Mode=                 ;(Y/N) ���нű��ڿ���ͼ����. Ĭ��=N
#PRE_Run_SciTE_Minimized=            ;(Y/N) ���ű�����ʱ��С�� SciTE ����. Ĭ��=n
#PRE_Run_SciTE_OutputPane_Minimized= ;(Y/N) ����ʱ�ر� SciTE �������. Ĭ��=n
;===============================================================================================================
;** AUT2EXE ����
#PRE_Icon=                           ;��Ҫʹ�õ�ͼ��(·��)����,֧��EXE,DLL,ICO
#PRE_OutFile=                        ;Ŀ�� exe/a3x �ļ���.
#PRE_OutFile_Type=exe                ;a3x=С�� AutoIt3 �ļ�; exe=��׼��ִ���ļ�(Ĭ��)
#PRE_Compression=                    ;ѹ������ 0-4 ?=�� 2=�� 4=�� Ĭ��=2
#PRE_UseUpx=                         ;(Y/N) ѹ������ĳ���.  Ĭ��=Y
#PRE_UPX_Parameters=                 ;����Ĭ��UPX����.
#PRE_Change2CUI=                     ;(Y/N) �޸�����ĳ���ΪCUI(����̨����). Ĭ��=N
;===============================================================================================================
;** Ŀ�������Դ��Ϣ
#PRE_Res_Comment=                    ;ע��
#PRE_Res_Description=                ;��ϸ��Ϣ
#PRE_Res_Fileversion=                ;�ļ��汾
#PRE_Res_FileVersion_AutoIncrement=  ;(Y/N/P)�Զ����°汾  . Ĭ��=N P=��ʾ
#PRE_Res_ProductVersion=             ;Product Version. Default is the AutoIt3 version used.
#PRE_Res_Language=                   ;��Դ���Դ���. �ٷ�Ĭ�� 2057=Ӣ�� (Ӣ��),ACN�汾Ĭ�� 2052=��������(�й�)
#PRE_Res_LegalCopyright=             ;��Ȩ
#PRE_res_requestedExecutionLevel=    ;None, asInvoker, highestAvailable or requireAdministrator   (Ĭ��=None)
#PRE_res_Compatibility=    		;Vista,Windows7 . Both alloweed seperated by a comma     (default=None)
#PRE_Res_SaveSource=                 ;(Y/N) ����Դ���뱸�ݵ�EXE��Դ��. Ĭ��=N
; If _Res_SaveSource=Y the content of Scriptsource depends on the _Run_Obfuscator and #obfuscator_parameters directives:
;
;	 If _Run_Obfuscator=Y then
;	    If #obfuscator_parameters=/STRIPONLY then Scriptsource is stripped script & stripped includes
;	    If #obfuscator_parameters=/STRIPONLYINCLUDES then Scriptsource is original script & stripped includes
;	    With any other parameters, the SaveSource directive is ignored as obfuscation is intended to protect the source
; 	 If _Run_Obfuscator=N or is not set then
;    	Scriptsource is original script only
; Autoit3Wrapper indicates the SaveSource action taken in the SciTE console during compilation
; See SciTE4AutoIt3 Helpfile for more detail on Obfuscator parameters
;
;
; free form resource fields ... max 15
;     you can use the following variables:
;     %AutoItVer% which will be replaced with the version of AutoIt3
;     %date% = PC date in short date format
;     %longdate% = PC date in long date format
;     %time% = PC timeformat
;  eg: #PRE_Res_Field=AutoIt Version|%AutoItVer%
#PRE_Res_Field=                      ;Free format fieldname|fieldvalue
#PRE_Res_Field=                      ;Free format fieldname|fieldvalue
#PRE_Res_Field=                      ;Free format fieldname|fieldvalue
; Add extra ICO files to the resources which can be used with TraySetIcon(@ScriptFullPath, 5) etc
; list of filename of the Ico files to be added, First one will have number 5, then 6 ..etc
#PRE_Res_Icon_Add=                   ; Filename[,LanguageCode] of ICO to be added.
#PRE_Res_Icon_Add=                   ; Filename[,LanguageCode] of ICO to be added.
; Add extra files to the resources
#PRE_Res_File_Add=                   ; Filename[,Section [,ResName[,LanguageCode]]] to be added.
#PRE_Res_File_Add=                   ; Filename[,Section [,ResName[,LanguageCode]]] to be added.
;===============================================================================================================
; Tidy Settings
#PRE_Run_Tidy=                       ;(Y/N) Run Tidy before compilation. default=N
#PRE_Tidy_Stop_OnError=              ;(Y/N) Continue when only Warnings. default=Y
#Tidy_Parameters=                    ;Tidy Parameters...see SciTE4AutoIt3 Helpfile for options
;===============================================================================================================
; Obfuscator
#PRE_Run_Obfuscator=                 ;(Y/N) Run Obfuscator before compilation. default=N
#obfuscator_parameters=
;===============================================================================================================
; AU3Check settings
#PRE_Run_AU3Check=                   ;(Y/N) Run au3check before compilation. Default=Y
#PRE_AU3Check_Parameters=            ;Au3Check parameters
#PRE_AU3Check_Stop_OnWarning=        ;(Y/N) N=Continue on Warnings.(Default) Y=Always stop on Warnings
#PRE_PlugIn_Funcs=                   ;Define PlugIn function names separated by a Comma to avoid AU3Check errors
;===============================================================================================================
; cvsWrapper settings
#PRE_Run_cvsWrapper=                 ;(Y/N/V) Run cvsWrapper to update the script source. default=N
;                                    V=only when version is increased by #PRE_Res_FileVersion_AutoIncrement.
#PRE_cvsWrapper_Parameters=          ; /NoPrompt  : Will skip the cvsComments prompt
;                                    /Comments  : Text to added in the cvsComments. It can also contain the below variables.
;===============================================================================================================
; ����ǰ��Ķ���
; The following directives can contain: these variables
; 	%in% , %out%, %icon% which will be replaced by the fullpath\filename.
; 	%scriptdir% same as @ScriptDir and %scriptfile% = filename without extension.
; 	%fileversion% is the information from the #PRE_Res_Fileversion directive
;   %scitedir% will be replaced by the SciTE program directory
;   %autoitdir% will be replaced by the AutoIt3 program directory
#PRE_Run_Before=                     ;process to run before compilation - you can have multiple records that will be processed in sequence
#PRE_Run_After=                      ;process to run After compilation - you can have multiple records that will be processed in sequence
;===============================================================================================================
; RUN BEFORE AND AFTER definitions
#PRE_Add_Constants=                  ;Add the needed standard constant include files. Will only run one time.
#EndRegion

#cs �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�

 Au3 �汾: 
 �ű�����: 
 �����ʼ�: 
	QQ/TM: 
 �ű��汾: 
 �ű�����: 

#ce �ߣߣߣߣߣߣߣߣߣߣߣߣߣߣ߽ű���ʼ�ߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣߣ�


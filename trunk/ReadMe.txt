=========================================================
��������:Autoit
����汾:3.2.11.0 ��һ������FIX
��������:thesnow
������̳:http://www.autoit.net.cn
=========================================================
��ɫ��װ����:��ѹ���� ����Ŀ¼.
��ɫж�ط���:��ˬɾ������.
������װ����:ֱ�������Խ�ѹ����.
����ж�غ���:ʹ��AU3������>�������>ж�ر�����.
�����а�װ  : "au3tool.exe /s"
������ж��  : "au3tool.exe /u"
autoit�������ṩ�˰�װж�ع���.
=========================================================
	[H]���� [G]�ٷ� [!]���� [*]���� [+]���� [-]�Ƴ�
=========================================================
3.2.11.0.1 (2008-2-05) ��һ������ FIX
[H][!]����: SCITEʹ��VS2008����,���������ļ�ȫ����д.(�ο��˲��ֹٷ�����)
[H][*]����: AutoIt3Wrapperʹ�ùٷ�2��3�յİ汾���±���/����.����˲�������ٶ���������.
[H][*]����: �Բ��ְ����ļ��е�AU3������в���.
[H][*]����: �����汾��SCITE�ܶ�������(������)(SCITE�ٷ�/SCITE4AUTOIT�ٷ�/ACN�ٷ�)
[H][!]ע��: ò����SCITE������һЩ����ʱ��������,�Ժ����...

3.2.11.0.1 (2008-1-27) ��һ������
[H][!]����: ��SCITE���и��£�ͬʱ���ɹٷ��汾/SCITE4AUTOIT�汾/ACN�汾
[H][!]����: ���п��ܵĴ��룬ʹ��3.2.11.0�����汾���б��롣
[H][+]����: MS SPY++ 7.1
[H][*]ע��: �����ļ��ٴξ���NORTON �յ㱣��/NOD32ɨ�衣[NO VIRUS]

3.2.11.0.1 (2008-1-26) ��һ������(Ԥ����)
[G][-]�Ƴ�: Unnecessary optional parameter from ProcessClose().
[G][-]�Ƴ�: RunErrorsFatal Option.
[G][-]�Ƴ�: RunAsSet().
[G][!]�޸�: @Unicode renamed in @AutoItUnicode. @Unicode is an alias for now. It will be removed > 3.2.14.0
[G][!]�޸�: The behavior of StdoutRead(), StderrRead(), StdinWrite() and ConsoleRead() has been changed.
[G][!]�޸�: PCRE regular expression engine updated to 7.5.
[G][!]�޸�: AutoIt internet functions (e.g. InetGet()) now use "AutoIt" as a user-agent.  Previously using blank
			which was blocked by many websites.
[G][!]�޸�: ControlClick() now accepts the same mouse buttons as MouseClick() - left/right/middle/primary/secondary/main/menu.
[G][+]����: DllCall() new types int_ptr, uint_ptr, long_ptr, ulong_ptr. Special types that change size on x86/x64.
[G][+]����: "REG_QWORD" type for RegWrite().
[G][+]����: Option to compile scripts as console applications.
[G][+]����: HotKeySet() modified to work with the {} notation.
[G][+]����: _DebugBugReportEnv() function in Debug.au3 to retrieve basic Info for Bug Reporting.
[G][+]����: FileReadLine( ,-1) read last line.
[G][+]����: Std I/O redirection works with RunAsSet().
[G][+]����: Std I/O merged flag for using the same stream for stdout/stderr.
[G][+]����: Std I/O supports binary data.
[G][+]����: ConsoleWrite()/ConsoleWriteError() now return the amount of data written.
[G][+]����: Remarks in Run() about how to close streams/release resources associated with STDIO.
[G][+]����: StdioClose() function to force STDIO data closed for a process.
[G][+]����: ProcessClose() now closes processes started by other users.
[G][+]����: RunAs(), RunAsWait().
[G][*]����: DllCall() setting wrong @error values.
[G][*]����: BlockInput() returns errors.
[G][*]����: WinWaitActive() not matching (more frequent with VISTA).
[G][*]����: GUICtrlSetState($GUI_SHOW) on hidden radio on an active tab. (Thanks covaks/MsCreator)
[G][*]����: SciTe Lite not installed in the AutoIt Choosen release dir.
[G][*]����: WinMove() with Speed = 0 crash the script!. (Thanks MsCreator)
[G][*]����: Mysterious return value of 1 when no explicit value was set.
[G][*]����: ControlCommand(), "GetLineCount"
[G][*]����: _FileListToArray() when using root drive dir as c:\ under Win9x.
[G][*]����: TraySetState(4) flashing tray icon for Vista. (Thanks psandu.ro)
[G][*]����: ProcessExists() wrong return. (Thanks oktoberfest2)
[G][*]����: StringRegExp() crashing under Win95. (Thanks WesleyW)
[G][*]����: Handle leak when using Run() with I/O redirection.
[G][*]����: Disabled input control background on Tab. (Thanks Volly)
[G][*]����: GUICtrlDelete() of a tab if two GUI windows are used. (Thanks DarkTurok)
[G][*]����: AutoIt crash in Random() when range exceeds 2^31. (Thanks VicTT)
[G][*]����: #include parsing error detection.
[G][*]����: Array entry passed Byref to a UDF. (Thanks Nutster)
[G][*]����: FileSetTime() erronously rounds UP on non NTFS partition.
[G][*]����: STDIO redirection sometimes failed on Windows 9x.
[G][*]����: IniReadSectionNames() returning incorrect number of sections under Win9x.

3.2.10.0.2 (2007-12-23) �����ڶ���(δ����)
[H][!]����ACN_NET.AU3 UDF����������ǿ��
[H][!]����KODAͼ�α༭��Ϊ 1.7.0.3 (2007-12-15)
[H][!]����UPXΪ3.02 (2007-12-16)
[H][-]�Ƴ�au3�������е�AU3LIB��Ŀ.
[H][*]���������û�ʹ�����������޷����ݵ�����.(·������)
[H][+]��װʱ���ɰ����Ŀ�ݷ�ʽ����ʼ�˵�.
[H][+]����һ��M$���WMI�����(ʹ���������ű�)

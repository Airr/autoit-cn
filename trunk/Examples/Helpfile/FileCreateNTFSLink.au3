FileChangeDir(@ScriptDir)

DirCreate('dir')
FileWriteLine("test.txt", "test")
MsgBox(0,"Ӳ����", FileCreateNTFSLink("test.txt", "dir\test.log", 1))

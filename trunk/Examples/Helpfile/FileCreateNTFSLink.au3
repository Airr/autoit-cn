FileChangeDir(@ScriptDir)

DirCreate('dir')
FileWriteLine("test.txt","test")
MsgBox(0,"Ӳ����", FileCreateNTFSLink("dir\test.log", "test.txt",1))

#include "misc.au3"
Local $fTest
$fTest = _ClipPutFile(@ScriptFullPath)
If Not $fTest Then
	MsgBox(0,"_ClipPutFile() ����ʧ��","����������� @error = " & @error)
Else
	MsgBox(0,"_ClipPutFile()","�����Ѿ��ŵ����а���:" & ClipGet())
EndIf


;����˵��,������û�гɹ�...ϵͳ��ʾ�޷���ȡԴ��...�Ժ����о�...
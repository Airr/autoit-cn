#include <Misc.au3>

;~ ����������ݵ����а�.
Local $fReturn = _ClipPutFile(@ScriptFullPath & "|" & @ScriptDir & "|" & @SystemDir)
If Not $fReturn Then
	MsgBox(4096,"_ClipPutFile() ����ʧ��","����������� @error = " & @error)
Else
	MsgBox(4096,"_ClipPutFile()","�����Ѿ��ŵ����а���:" & @CRLF & ClipGet())
EndIf


;����˵��,������û�гɹ�...ϵͳ��ʾ�޷���ȡԴ��...�Ժ����о�...
; *******************************************************
; ʾ�� 1 - �������µĿ��ĵ��� word ����,
;				Ȼ�����һЩͼƬ���ĵ�.
; *******************************************************
;
#include <Word.au3>

Local $sPath = @WindowsDir & "\"
Local $search = FileFindFirstFile($sPath & "*.bmp")

; ��������Ƿ�ɹ�
If $search = -1 Then
	MsgBox(4096, "Error", "No images found")
	Exit
EndIf

Local $oWordApp = _WordCreate()
Local $oDoc = _WordDocGetCollection($oWordApp, 0)

While 1
	Local $file = FileFindNextFile($search)
	If @error Then ExitLoop
	Local $oShape = _WordDocAddPicture($oDoc, $sPath & $file, 0, 1)
	If Not @error Then $oShape.Range.InsertAfter(@CRLF)
WEnd

; �ر��������
FileClose($search)

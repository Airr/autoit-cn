#include <ID3.au3>
Dim $sID3

$hFile = FileOpenDialog("��ѡ��һ��MP3�ļ�", @DesktopDir, "MP3(*.MP3)")
$aID3 = _ID3TagToArray($hFile, 1)
For $I = 1 To $aID3[0]
	$sID3 &= $aID3[$I] & @LF
Next
MsgBox(0, "һ����" & $aID3[0] & "����ǩ", $sID3)
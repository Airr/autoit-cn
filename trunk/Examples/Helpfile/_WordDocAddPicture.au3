 ; ******************************************************* 
 ; ʾ�� - ����һ���½��հ��ļ���word����, Ȼ�����ļ����һЩͼƬ. 
 ; ******************************************************* 
 #include <Word.au3> 
 
 $sPath = @WindowsDir & " \ " 
 $search = FileFindFirstFile ( $sPath & " *.bmp " ) 
 
 ; ��������Ƿ�ɹ� 
 If $search = -1 Then 
   MsgBox ( 0 , " Error ", " No images found " ) 
   Exit 
 EndIf 
 
 $oWordApp = _WordCreate () 
 $oDoc = _WordDocGetCollection ( $oWordApp , 0 ) 
 
 While 1 
   $file = FileFindNextFile ( $search ) 
   If @error Then ExitLoop 
   $oShape = _WordDocAddPicture ( $oDoc , $sPath & $file , 0 , 1 ) 
   If Not @error Then $oShape.Range.InsertAfter ( @CRLF ) 
 WEnd 
 
 ; �ر�������� 
 FileClose ( $search ) 
 

 
 #AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include  <GDIPlus.au3> 
 #include  <ScreenCapture.au3> 
 
 Opt ( 'MustDeclareVars' ,  1 ) 
 
 _Main () 
 
 Func _Main () 
     Local  $hBitmap1 ,  $hBitmap2 ,  $hImage1 ,  $hImage2 ,  $hGraphic 
 
     ; ��ʼ��GDI+�� 
     _GDIPlus_Startup () 
 
     ; ��׽ȫ�� 
     $hBitmap1  =  _ScreenCapture_Capture ( "" ) 
     $hImage1  =  _GDIPlus_BitmapCreateFromHBITMAP ( $hBitmap1 ) 
 
     ; ��׽��Ļ���� 
     $hBitmap2  =  _ScreenCapture_Capture ( "" ,  0 ,  0 ,  400 ,  300 ) 
     $hImage2  =  _GDIPlus_BitmapCreateFromHBITMAP ( $hBitmap2 ) 
 
     ; ����һ���л���һ��ͼ�� 
     $hGraphic  =  _GDIPlus_ImageGetGraphicsContext ( $hImage1 ) 
     
     _GDIPlus_DrawImagePoints ( $hGraphic ,  $hImage2 ,  100 ,  100 ,  600 ,  170 ,  130 ,  570 ) 
 
     ; ����һ�����Ʋ���ͼ��Ŀ�� 
     _GDIPlus_GraphicsDrawRect ( $hGraphic ,  100 ,  100 ,  400 ,  300 ) 
 
     ; ������ϵ�ͼ�� 
     _GDIPlus_ImageSaveToFile ( $hImage1 ,  @MyDocumentsDir  &  "\GDIPlus_Image.jpg" ) 
 
     ; �����Դ 
     _GDIPlus_ImageDispose ( $hImage1 ) 
     _GDIPlus_ImageDispose ( $hImage2 ) 
     _WinAPI_DeleteObject ( $hBitmap1 ) 
     _WinAPI_DeleteObject ( $hBitmap2 ) 
 
     ; �ر�GDI+�� 
     _GDIPlus_Shutdown () 
 
 EndFunc    ;==>_Main 
 

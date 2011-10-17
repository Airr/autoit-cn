 
 #AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include  <GDIPlus.au3> 
 #include  <ScreenCapture.au3> 
 #include  <WinAPI.au3> 
 
 Opt ( 'MustDeclareVars' ,  1 ) 
 
 _Main () 
 
 Func _Main () 
     Local  $hBitmap1 ,  $hBitmap2 ,  $hImage1 ,  $hImage2 ,  $hGraphic ,  $width ,  $height 
 
     ; ��ʼ��GDI+�� 
     _GDIPlus_Startup () 
 
     ; ��׽ȫ��Ļ 
     $hBitmap1  =  _ScreenCapture_Capture ( "" ) 
     $hImage1  =  _GDIPlus_BitmapCreateFromHBITMAP ( $hBitmap1 ) 
 
     ; ��׽��Ļ���� 
     $hBitmap2  =  _ScreenCapture_Capture ( "" ,  0 ,  0 ,  400 ,  300 ) 
     $hImage2  =  _GDIPlus_BitmapCreateFromHBITMAP ( $hBitmap2 ) 
 
     $width  =  _GDIPlus_ImageGetWidth ( $hImage2 ) 
     $height  =  _GDIPlus_ImageGetHeight ( $hImage2 ) 
 
     ; ��ָ��ͼ����Ƶ���һ�� 
     $hGraphic  =  _GDIPlus_ImageGetGraphicsContext ( $hImage1 ) 
 
     ;DrawInsert($hGraphic, $hImage2, $iX, $iY, $nAngle,    $iWidth,    $iHeight, $iARGB = 0xFF000000, $nWidth = 1) 
     DrawInsert ( $hGraphic ,  $hImage2 ,  350 ,  100 ,  0 ,  $width  +  2 ,  $height  +  2 ,  0xFFFF8000 ,  2 ) 
     DrawInsert ( $hGraphic ,  $hImage2 ,  340 ,  50 ,  15 ,  200 ,  150 ,  0xFFFF8000 ,  4 ) 
     DrawInsert ( $hGraphic ,  $hImage2 ,  310 ,  30 ,  35 ,  $width  +  4 ,  $height  +  4 ,  0xFFFF00FF ,  4 ) 
     DrawInsert ( $hGraphic ,  $hImage2 ,  320 ,  790 ,  - 35 ,  $width ,  $height ) 
 
     ; ������Ӧ��ͼ�� 
     _GDIPlus_ImageSaveToFile ( $hImage1 ,  @MyDocumentsDir  &  "\GDIPlus_Image.jpg" ) 
 
     ; �����Դ 
     _GDIPlus_ImageDispose ( $hImage1 ) 
     _GDIPlus_ImageDispose ( $hImage2 ) 
     _WinAPI_DeleteObject ( $hBitmap1 ) 
     _WinAPI_DeleteObject ( $hBitmap2 ) 
     ; Shut down GDI+ library 
     _GDIPlus_Shutdown () 
 
 EndFunc    ;==>_Main 
 
 ; #FUNCTION# ================================================================================================== 
 ; ����..: DrawInsert 
 ; ����..: ��һ��ͼ����Ƶ���һ��ͼ���� 
 ; �﷨..: DrawInsert($hGraphic, $hImage2, $iX, $iY, $nAngle, $iWidth, $iHeight, $iARGB = 0xFF000000, $nWidth = 1) 
 ;      ��ͼ��$hImage2���뵽$hGraphic�� 
 ; ����..: $hGraphics - ͼ�ζ����� 
 ;      $hImage   - ������ͼ��ľ�� 
 ;      $iX     - ������ͼ������Ͻ�X���� 
 ;      $iY     - ������ͼ������Ͻ�Y���� 
 ;      $iWidth   - Χ�Ʋ������ľ��α߽��� 
 ;      $iHeight  - Χ�Ʋ������ľ��α߽�߶� 
 ;      $iARGB   - ������ɫ��Alpha, ��ɫ, ��ɫ����ɫ���� - �߽�ɫ 
 ;      $nWidth   - ��$iUnit����ָ����λ�Ļ��ʿ�� - �߽��� 
 ; ����ֵ: �ɹ� - �� 
 ;      ʧ�� - �� 
 ;================================================================================================== 
 Func DrawInsert ( $hGraphic ,  $hImage2 ,  $iX ,  $iY ,  $nAngle ,  $iWidth ,  $iHeight ,  $iARGB  =  0xFF000000 ,  $nWidth  =  1 ) 
     Local  $hMatrix ,  $hPen2 
 
     ; ��ת���� 
     $hMatrix  =  _GDIPlus_MatrixCreate () 
     _GDIPlus_MatrixRotate ( $hMatrix ,  $nAngle ,  "False" ) 
     _GDIPlus_GraphicsSetTransform ( $hGraphic ,  $hMatrix ) 
 
     _GDIPlus_GraphicsDrawImage ( $hGraphic ,  $hImage2 ,  $iX ,  $iY ) 
 
     ; ��ȡ���ʺ���ɫ 
     $hPen2  =  _GDIPlus_PenCreate ( $iARGB ,  $nWidth ) 
 
     ; Χ�Ʋ���ͼ�����һ����� 
     _GDIPlus_GraphicsDrawRect ( $hGraphic ,  $iX ,  $iY ,  $iWidth ,  $iHeight ,  $hPen2 ) 
 
     ; �����Դ 
     _GDIPlus_MatrixDispose ( $hMatrix ) 
     _GDIPlus_PenDispose ( $hPen2 ) 
     Return  1 
 EndFunc    ;==>DrawInsert  


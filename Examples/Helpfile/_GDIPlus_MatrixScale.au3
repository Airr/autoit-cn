 
 #include  <GUIConstants.au3> 
 #include  <ScreenCapture.au3> 
 #include  <WinAPI.au3> 
 
 ; �������� 
 $hWnd  =  GUICreate ( "GDI+ ʾ��" ,  500 ,  500 ) 
 GUISetState () 
 
 ; ����GDI+ 
 _GDIPlus_Startup () 
 $hGraphics  =  _GDIPlus_GraphicsCreateFromHWND ( $hWnd ) 
 _GDIPlus_GraphicsClear ( $hGraphics ) 
 
 ; ��ȡ��Ļ���²�Ľ�ͼ 
 $hScreenCap_hBitmap  =  _ScreenCapture_Capture ( "" ,  0 ,  @DesktopHeight  -  500 ,  500 ,  @DesktopHeight ) 
 $hScreenCap_Bitmap  =  _GDIPlus_BitmapCreateFromHBITMAP ( $hScreenCap_hBitmap ) 
 
 $hMatrix  =  _GDIPlus_MatrixCreate () 
 ; �Ŵ�2�� 
 _GDIPlus_MatrixScale ( $hMatrix ,  2.0 ,  2.0 ) 
 
 
 _GDIPlus_GraphicsSetTransform ( $hGraphics ,  $hMatrix ) 
 _GDIPlus_GraphicsDrawImageRect ( $hGraphics ,  $hScreenCap_Bitmap ,  0 ,  0 ,  500 ,  500 ) 
 
 Do 
 Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
 
 ; �����Դ 
 _WinAPI_DeleteObject ( $hScreenCap_hBitmap ) 
 _GDIPlus_BitmapDispose ( $hScreenCap_Bitmap ) 
 _GDIPlus_MatrixDispose ( $hMatrix ) 
 _GDIPlus_GraphicsDispose ( $hGraphics ) 
 _GDIPlus_Shutdown ()  


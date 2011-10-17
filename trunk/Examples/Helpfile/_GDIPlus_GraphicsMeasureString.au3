 #include  <GuiConstantsEx.au3> 
 #include  <GDIPlus.au3> 
 
 Opt ( 'MustDeclareVars' ,  1 ) 
 
 _Main () 
 
 Func _Main () 
     Local  $hGUI ,  $hWnd ,  $hGraphic ,  $hBrush ,  $hFormat ,  $hFamily ,  $hFont ,  $tLayout ,  $aInfo 
     Local  $sString  =  "Hello world" 
 
     ; �������� 
     $hGUI  =  GUICreate ( "GDI+" ,  400 ,  300 ) 
     $hWnd  =  WinGetHandle ( "GDI+" ) 
     GUISetState () 
 
     ; �����ַ��� 
     _GDIPlus_Startup  () 
     $hGraphic  =  _GDIPlus_GraphicsCreateFromHWND  ( $hWnd ) 
     $hBrush  =  _GDIPlus_BrushCreateSolid  ( 0xFF00007F ) 
     $hFormat  =  _GDIPlus_StringFormatCreate  () 
     $hFamily  =  _GDIPlus_FontFamilyCreate  ( "Arial" ) 
     $hFont  =  _GDIPlus_FontCreate  ( $hFamily ,  12 ,  2 ) 
     $tLayout  =  _GDIPlus_RectFCreate  ( 140 ,  110 ,  0 ,  0 ) 
     $aInfo  =  _GDIPlus_GraphicsMeasureString  ( $hGraphic ,  $sString ,  $hFont ,  $tLayout ,  $hFormat ) 
     _GDIPlus_GraphicsDrawStringEx  ( $hGraphic ,  $sString ,  $hFont ,  $aInfo [ 0 ],  $hFormat ,  $hBrush ) 
 
     ; ѭ�����û��˳� 
     Do 
     Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
 
     ; �����Դ 
     _GDIPlus_FontDispose  ( $hFont ) 
     _GDIPlus_FontFamilyDispose  ( $hFamily ) 
     _GDIPlus_StringFormatDispose  ( $hFormat ) 
     _GDIPlus_BrushDispose  ( $hBrush ) 
     _GDIPlus_GraphicsDispose  ( $hGraphic ) 
     _GDIPlus_Shutdown  () 
 
 EndFunc    ;==>_Main  


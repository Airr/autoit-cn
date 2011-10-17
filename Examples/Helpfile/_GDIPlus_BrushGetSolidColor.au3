 
 #AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include  <GuiConstantsEx.au3> 
 #include  <GDIPlus.au3> 
 #include  <WindowsConstants.au3> 
 
 Opt ( 'MustDeclareVars' ,  1 ) 
 
 _Main () 
 
 Func _Main () 
     Local  $hGUI ,  $Label1 ,  $label2 ,  $hGraphic ,  $hBrush1 ,  $iClr1 ,  $iClr2 
 
     ; �������� 
     $hGUI  =  GUICreate ( "GDI+" ,  345 ,  150 ) 
     $Label1  =  GUICtrlCreateLabel ( "" ,  2 ,  2 ,  150 ,  20 ) 
     $label2  =  GUICtrlCreateLabel ( "" ,  202 ,  2 ,  150 ,  20 ) 
     GUISetState () 
     Sleep ( 100 ) 
 
     ; ����GDIPlus 
     _GDIPlus_Startup () 
     $hGraphic  =  _GDIPlus_GraphicsCreateFromHWND ( $hGUI ) 
 
     ; ����ʵ�Ļ�ˢ 
     $hBrush1  =  _GDIPlus_BrushCreateSolid () 
 
     ; ��ȡʵ�Ļ�ˢ��ɫ 
     $iClr1  =  _GDIPlus_BrushGetSolidColor ( $hBrush1 ) 
 
     ; ��ԭʼ��ˢ��ɫ����һЩͼ�� 
     _GDIPlus_GraphicsFillEllipse ( $hGraphic ,  25 ,  25 ,  100 ,  100 ,  $hBrush1 ) 
 
     ; ���û�ˢ��ɫ(0xFFFF0000 = Red) 
     _GDIPlus_BrushSetSolidColor ( $hBrush1 ,  0xFFFF0000 ) 
 
     ; ��ȡ�µĻ�ˢ��ɫ 
     $iClr2  =  _GDIPlus_BrushGetSolidColor ( $hBrush1 ) 
 
     ; ���µĻ�ˢ��ɫ����һЩͼ�� 
     _GDIPlus_GraphicsFillRect ( $hGraphic ,  220 ,  25 ,  100 ,  100 ,  $hBrush1 ) 
 
     ; ��ԭʼ��ˢɫд��Label1 
     GUICtrlSetData ( $Label1 ,  "Brush orignal color: "  &  Hex ( $iClr1 )) 
 
     ; ���»�ˢɫд��Label2 
     GUICtrlSetData ( $label2 ,  "Brush new color: "  &  Hex ( $iClr2 )) 
 
     ; ѭ�����û��˳� 
     Do 
     Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
 
     ; �����Դ 
     _GDIPlus_BrushDispose ( $hBrush1 ) 
     _GDIPlus_GraphicsDispose ( $hGraphic ) 
     _GDIPlus_Shutdown () 
 
 EndFunc    ;==>_Main 
 

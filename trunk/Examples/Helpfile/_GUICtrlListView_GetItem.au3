 
 #AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include  <GuiConstantsEx.au3> 
 #include  <GuiListView.au3> 
 
 Opt ( 'MustDeclareVars' ,  1 ) 
 
 $Debug_LV  =  False  ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 _Main () 
 
 Func _Main () 
     Local  $aItem ,  $hListView 
     
     GUICreate ( "ListView Get Item" ,  400 ,  300 ) 
 
     $hListView  =  GUICtrlCreateListView ( "Items" ,  2 ,  2 ,  394 ,  268 ) 
     GUISetState () 
 
     GUICtrlCreateListViewItem ( "Row 1" ,  $hListView ) 
     GUICtrlCreateListViewItem ( "Row 2" ,  $hListView ) 
     GUICtrlCreateListViewItem ( "Row 3" ,  $hListView ) 
 
     ; ��ʾ��Ŀ2���ı� 
     $aItem  =  _GUICtrlListView_GetItem ( $hListView ,  1 ) 
     MsgBox ( 4160 ,  "Information" ,  "Item 2 Text: "  &  $aItem [ 3 ]) 
     
     ; ѭ�����û��˳� 
     Do 
     Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
 
     GUIDelete () 
 EndFunc    ;==>_Main 
 

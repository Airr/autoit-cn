 #AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include <GuiConstantsEx.au3> 
 #include <GuiTab.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 $Debug_TAB = False ;  ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 _Main() 
 
 Func _Main() 
   Local $tRect , $sRect , $hTab 
 
   ; �������� 
   GUICreate ( " Tab Control Get Display RectEx ", 400 , 300 ) 
   $hTab = GUICtrlCreateTab ( 2 , 2 , 396 , 296 ) 
   GUISetState () 
 
   ; ��ӱ�ǩҳ 
   _GUICtrlTab_InsertItem ( $hTab , 0 , " Tab 1 " ) 
   _GUICtrlTab_InsertItem ( $hTab , 1 , " Tab 2 " ) 
   _GUICtrlTab_InsertItem ( $hTab , 2 , " Tab 3 " ) 
 
   ; ��ȡ��ʾ���� 
   $tRect = _GUICtrlTab_GetDisplayRectEx ( GUICtrlGetHandle ( $hTab )) 
   $sRect = StringFormat ( " [%d, %d, %d, %d] ", DllStructGetData ( $tRect , " Left " ), _ 
             DllStructGetData ( $tRect , " Top " ) , _ 
             DllStructGetData ( $tRect , " Right " ) , _ 
             DllStructGetData ( $tRect , " Bottom " )) 
   MsgBox ( 4160 , " Information ", " Display rectangle: " & $sRect ) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
   GUIDelete () 
 EndFunc ;==>_Main 


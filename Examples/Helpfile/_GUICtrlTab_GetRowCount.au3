 
 #AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include <GuiConstantsEx.au3> 
 #include <GuiTab.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 $Debug_TAB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤�� 
 
 _Main() 
 
 Func _Main() 
   Local $hTab 
 
   ; �������� 
   GUICreate ( " Tab Control Get Row Count ", 400 , 300 ) 
   $hTab = GUICtrlCreateTab ( 2 , 2 , 396 , 296 , $TCS_MULTILINE ) 
   GUISetState () 
 
   ; ��ӱ�ǩҳ 
   For $x = 0  To 10 
     _GUICtrlTab_InsertItem ( $hTab , $x , " Tab " & $x + 1 ) 
   Next 
 
   ; ��ȡ������ 
   MsgBox ( 4160 , " Information ", " Row count: " & _GUICtrlTab_GetRowCount ( $hTab )) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
   GUIDelete () 
 EndFunc ;==>_Main 
 

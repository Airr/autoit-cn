 #AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include <GuiConstantsEx.au3> 
 #include <GuiTab.au3> 
 #include <GuiToolTip.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 $Debug_TAB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤�� 
 
 _Main () 
 
 Func _Main () 
  Local $hTool , $hTab 
 
  ; �������� 
  GUICreate ( " Tab Control Tool Tips ", 400 , 300 ) 
  $hTab = GUICtrlCreateTab ( 2 , 2 , 396 , 296 ) 
  GUISetState () 
 
  ; ��ӱ�ǩҳ 
  _GUICtrlTab_InsertItem ( $hTab , 0 , " Tab 1 " ) 
  _GUICtrlTab_InsertItem ( $hTab , 1 , " Tab 2 " ) 
  _GUICtrlTab_InsertItem ( $hTab , 2 , " Tab 3 " ) 
 
  ; ��ȡ/���ù�����ʾ 
  $hTool = _GUIToolTip_Create ( GUICtrlGetHandle ( $hTab )) 
  _GUICtrlTab_SetToolTips ( $hTab , $hTool ) 
  MsgBox ( 4160 , " Information ", "ToolTip handle: 0x " & _GUICtrlTab_GetToolTips ( $hTab )) 
 
  ; ѭ�����û��˳� 
  Do 
  Until GUIGetMsg () = $GUI_EVENT_CLOSE 
  GUIDelete () 
 EndFunc    ;==>_Main 
 

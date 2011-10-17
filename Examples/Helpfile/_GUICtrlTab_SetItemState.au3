 #AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include <GuiConstantsEx.au3> 
 #include <GuiTab.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 $Debug_TAB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ�����۲��乤�� 
 
 _Main () 
 
 Func _Main() 
   Local $hTab 
 
   ; �������� 
   GUICreate ( " Tab Control Item State ", 400 , 300 ) 
   $hTab = GUICtrlCreateTab ( 2 , 2 , 396 , 296 , $TCS_BUTTONS ) 
   GUISetState () 
 
   ; ��ӱ�ǩ 
   _GUICtrlTab_InsertItem ( $hTab , 0 , " Tab 1 " ) 
   _GUICtrlTab_InsertItem ( $hTab , 1 , " Tab 2 " ) 
   _GUICtrlTab_InsertItem ( $hTab , 2 , " Tab 3 " ) 
 
   ; ��ȡ/���ñ�ǩ2״̬ 
   _GUICtrlTab_SetItemState ( $hTab , 1 , $TCIS_BUTTONPRESSED ) 
   MsgBox ( 4160 , "Information" , " Tab 2 state: " & _ExplainItemState( _GUICtrlTab_GetItemState ( $hTab , 1 ))) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
   GUIDelete () 
 EndFunc    ;==>_Main 
 
 Func _ExplainItemState ( $iState ) 
   Local $sText = "" 
   If $iState = 0  Then  $sText &= " No state set on this item " & @LF 
   If BitAND ( $iState , $TCIS_BUTTONPRESSED ) Then  $sText &= " Button Pressed " & @LF 
   If BitAND ( $iState , $TCIS_HIGHLIGHTED ) Then  $sText &= " Button Highlighted " 
   Return $sText 
 EndFunc ;==>_ExplainItemState 


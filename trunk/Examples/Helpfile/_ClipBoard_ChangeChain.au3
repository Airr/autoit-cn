 #include <ClipBoard.au3> 
 #include <GuiConstantsEx.au3> 
 #include <WindowsConstants.au3> 
 #include <SendMessage.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 Global $iMemo , $hNext = 0 
 
 _Main() 
 
 Func _Main() 
   Local $hGUI 
 
   ; �������� 
   $hGUI = GUICreate ( " Clipboard ", 600 , 400 ) 
   $iMemo = GUICtrlCreateEdit ( "", 2 , 2 , 596 , 396 , $WS_VSCROLL ) 
   GUICtrlSetFont ( $iMemo , 9 , 400 , 0 , " Courier New " ) 
   GUISetState () 
 
   ; ��ʼ������������� 
   $hNext = _ClipBoard_SetViewer ( $hGUI ) 
 
   GUIRegisterMsg ( $WM_CHANGECBCHAIN , " WM_CHANGECBCHAIN " ) 
   GUIRegisterMsg ( $WM_DRAWCLIPBOARD , " WM_DRAWCLIPBOARD " ) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
 
   ; �رռ���������� 
   _ClipBoard_ChangeChain ( $hGUI , $hNext ) 
 EndFunc ;==>_Main 
 
 ; ��memo�ؼ�д����Ϣ 
 Func MemoWrite( $sMessage = "" ) 
   GUICtrlSetData ( $iMemo , $sMessage & @CRLF , 1 ) 
 EndFunc ;==>MemoWrite 
 
 ; ִ��$WM_CHANGECBCHAIN��Ϣ 
 Func WM_CHANGECBCHAIN( $hWnd , $iMsg , $iwParam , $ilParam ) 
   ; ��ʾ�յ�����Ϣ 
   MemoWrite( " ***** $WM_CHANGECBCHAIN ***** " ) 
 
   ; �����һ�������ڹر�, �޸��������� 
   If $iwParam = $hNext Then 
     $hNext = $ilParam 
     ; ������Ϣ���ݸ���һ������ 
   ElseIf $hNext <> 0  Then 
     _SendMessage ( $hNext , $WM_CHANGECBCHAIN , $iwParam , $ilParam , 0 , " hwnd ", " hwnd " ) 
   EndIf 
 EndFunc ;==>WM_CHANGECBCHAIN 
 
 ; ִ��$WM_DRAWCLIPBOARD��Ϣ 
 Func WM_DRAWCLIPBOARD( $hWnd , $iMsg , $iwParam , $ilParam ) 
   ; ��ʾ�������ϵ������ı� 
   MemoWrite( _ClipBoard_GetData ()) 
 
   ; ������Ϣ����һ�������� 
   If $hNext <> 0  Then  _SendMessage ( $hNext , $WM_DRAWCLIPBOARD , $iwParam , $ilParam ) 
 EndFunc ;==>WM_DRAWCLIPBOARD 
 

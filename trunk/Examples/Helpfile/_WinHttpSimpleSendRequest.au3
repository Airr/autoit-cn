 #AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 

 #Include <WinHttp.au3> 
 #include <GuiConstantsEx.au3> 
 #include <WindowsConstants.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 Global $iMemo 
 
 _Main () 
 
 Func _Main () 
   ; �������� 
   GUICreate ( "HTTP Status" ,  800 ,  600 ) 
 
   ; ����memo�ؼ� 
   $iMemo  =  GUICtrlCreateEdit ("" ,  2 ,  2 ,  796 ,  596 ,  $WS_VSCROLL ) 
   GUICtrlSetFont ( $iMemo ,  9 ,  400 ,  0 ,  "Courier New" ) 
   GUISetState () 
 
   ; ��ʼ������ȡ�Ự��� 
   Global $hOpen = _WinHttpOpen () 
   ; ��ȡ���Ӿ�� 
   Global $hConnect = _WinHttpConnect ( $hOpen , " google.com " ) 
   ; �������� 
   Global $hRequest = _WinHttpSimpleSendRequest ( $hConnect , Default , " tags/tag_input.asp " ) 
 
   If $hRequest Then 
     ; �򵥶�ȡ... 
     MemoWrite( _WinHttpSimpleReadData ( $hRequest ) & @CRLF ) 
     MsgBox ( 64 , " Ok ", " Returned source is print to concole. Check it. " ) 
   Else 
     MsgBox ( 48 , " Error ", " Error ocurred for _WinHttpSimpleSendRequest, Error number is " & @error ) 
   EndIf 
 
   ; �رվ�� 
   _WinHttpCloseHandle ( $hRequest ) 
   _WinHttpCloseHandle ( $hConnect ) 
   _WinHttpCloseHandle ( $hOpen ) 
 
   ; ѭ�����û��˳� 
   Do 
   Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
 EndFunc    ;==>_Main 
 
 ; ��memo�ؼ�д����Ϣ 
 Func MemoWrite ( $sMessage  =  "" ) 
   GUICtrlSetData ( $iMemo ,  $sMessage  &  @CRLF ,  1 ) 
 EndFunc    ;==>MemoWrite 
 

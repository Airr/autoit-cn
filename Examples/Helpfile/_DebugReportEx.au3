 AutoItSetOption ( " MustDeclareVars ",  1 ) 
 
 #include <Debug.au3> 
 
 _DebugSetup () 
 
 _DebugReport ( " message1 " ) 
 
 SomeUDF( " anyfunction " ) 
 If @error Then _DebugReportEx ( " user32|anyfunction ",  True ) ; ׷������Ĵ�����Ϣ 
 
 Local $iRet = SomeUDF( " CloseClipboard " ) 
 If @error Or $iRet = 0  Then _DebugReportEx ( " user32|CloseClipboard " ) 
 
 _DebugReport ( " message2 " ) 
 
 $iRet = SomeUDF( " CloseClipboard " ) 
 If @error Or $iRet = 0  Then _DebugReportEx ( " user32|CloseClipboard ",  False , True ) ;��ֹ�ű� 
 
 _DebugReport ( " message3 " ) ; ������ 
 
 Func SomeUDF($func) 
  Local $aResult = DllCall ( " user32.dll ", " int ", $func ) 
  If @error Then Return SetError ( @error , @extended , 0 ) 
  Return $aResult [ 0 ] 
 EndFunc 
 

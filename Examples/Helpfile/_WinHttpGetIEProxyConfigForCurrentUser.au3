 #AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 

 #Include <WinHTTP.au3> 
 #Include <Array.au3> 
 
 ; ��ǰ�û���IE�������� 
 Global $aIEproxy = _WinHttpGetIEProxyConfigForCurrentUser () 
 _ArrayDisplay ( $aIEproxy , " Internet Explorer proxy configuration " ) 
 

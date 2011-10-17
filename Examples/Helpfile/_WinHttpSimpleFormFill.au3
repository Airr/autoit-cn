 #AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 

 #Include <WinHTTP.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 ; ��ʼ������ȡ�Ự��� 
 Global $hOpen = _WinHttpOpen () 
 
 Global $hConnect , $sRead 
 Global $hFileHTM , $sFileHTM = @ScriptDir & " \Form.htm " 
 
 ; ʾ��1: 
 ; 1. ��APNIC whoisҳ(http://wq.apnic.net/apnic-bin/whois.pl) 
 ; 2. ��дҳ�ϵı�: 
 ; - ��дĬ�ϱ� 
 ; - ����������ip��ַΪ4.2.2.2. ʹ����������"��λ"����t 
 ; - ���ͱ�(�����ť) 
 ; - �ռ����� 
 
 ; ��ȡ���Ӿ�� 
 $hConnect = _WinHttpConnect ( $hOpen , " wq.apnic.net " ) 
 ; ��дҳ���ϵı� 
 $sRead = _WinHttpSimpleFormFill ( $hConnect , " apnic-bin/whois.pl ", Default , " name:searchtext ", " 4.2.2.2 " ) 
 ; �رվ�� 
 _WinHttpCloseHandle ( $hConnect ) 
 ; �鿴����ֵ(Ĭ��������л���������) 
 If $sRead Then 
  MsgBox ( 64 + 262144 , " Done! ", " Will open returned page in your default browser now. " & @CRLF & _ 
    " When you close that window another example will run. " ) 
  $hFileHTM = FileOpen ( $sFileHTM , 2 ) 
  FileWrite ( $hFileHTM , $sRead ) 
  FileClose ( $hFileHTM ) 
  ShellExecuteWait ( $sFileHTM ) 
 EndIf 
 
 ;===================================================================================================================== 
 MsgBox ( 262144 , " Example 2 ", " Click ok to run new example. " ) 
 
 ; ʾ��2: 
 ; 1. ��w3schools��ҳ(http://www.w3schools.com/html/html_forms.asp) 
 ; 2. ��дҳ�ϵı�: 
 ; - ���������Ʊ�ʶ, ��Ϊ"input0" 
 ; - ����������"OMG!!!"����. �������ƶ�λ�����. Ϊ"user" 
 ; - �ռ����� 
 
 ; ��ȡ���Ӿ�� 
 $hConnect = _WinHttpConnect ( $hOpen , " w3schools.com " ) 
 ; ��дҳ���ϵı� 
 $sRead = _WinHttpSimpleFormFill ( $hConnect , " html/html_forms.asp ", " name:input0 ", " name:user ", " OMG!!! " ) 
 ; �رվ�� 
 _WinHttpCloseHandle ( $hConnect ) 
 If $sRead Then 
  MsgBox ( 64 + 262144 , " Done! ", " Will open returned page in your default browser now. " & @CRLF & _ 
    " You should see 'OMG!!!' somewhere on that page. " ) 
  $hFileHTM = FileOpen ( $sFileHTM , 2 ) 
  FileWrite ( $hFileHTM , $sRead ) 
  FileClose ( $hFileHTM ) 
  ShellExecuteWait ( $sFileHTM ) 
 EndIf 
 
 ;===================================================================================================================== 
 MsgBox ( 262144 , " Example 3 ", " Click ok to run new example. " ) 
 
 ; ʾ��3: 
 ; 1. ��cs.tut.fi��ҳ(http://www.cs.tut.fi/~jkorpela/forms/testing.html) 
 ; 2. ��дҳ�ϵı�: 
 ; - ������������ʶ, ����Ϊҳ�ϵ��׸���, ������Ϊ0 
 ; - ����������"Johnny B. Goode"����. �������ƶ�λ�����. Ϊ"box" 
 ; - ������Ϊ"hidden field"������"This is hidden, so what?"���� 
 ; - �ռ����� 
 
 ; ��ȡ���Ӿ�� 
 $hConnect = _WinHttpConnect ( $hOpen , " www.cs.tut.fi " ) 
 ; ��дҳ���ϵı� 
 $sRead = _WinHttpSimpleFormFill ( $hConnect , " ~jkorpela/forms/testing.html ", " index:0 ", " name:box ", " Johnny B. Goode ", " name:hidden field ", " This is hidden, so what? " ) 
 ; �رվ�� 
 _WinHttpCloseHandle ( $hConnect ) 
 If $sRead Then 
  MsgBox ( 64 + 262144 , " Done! ", " Will open returned page in your default browser now. " & @CRLF & _ 
    " It should show sent data. " ) 
  $hFileHTM = FileOpen ( $sFileHTM , 2 ) 
  FileWrite ( $hFileHTM , $sRead ) 
  FileClose ( $hFileHTM ) 
  ShellExecuteWait ( $sFileHTM ) 
 EndIf 
 
 ;===================================================================================================================== 
 MsgBox ( 262144 , " Example 4 ", " Click ok to run new example. " ) 
 
 ; ʾ��4: 
 ; 1. ��yahoo�ʼ���¼ҳ(https://login.yahoo.com/config/login_verify2?&.src=ym) 
 ; 2. ��дҳ�ϵı�: 
 ; - ���������Ʊ�ʶ, ��Ϊ"login_form" 
 ; - �����û���������"MyUserName"����. ����ID��λ�����. Ϊ"username" 
 ; - ����ָ����������"MyPassword"����. ����ID��λ�����. Ϊ"passwd" 
 ; - �ռ����� 
 
 ; ��ȡ���Ӿ�� 
 $hConnect = _WinHttpConnect ( $hOpen , " login.yahoo.com " ) 
 ; ��дҳ���ϵı� 
 $sRead = _WinHttpSimpleFormFill ( $hConnect , " config/login_verify2?&.src=ym ", " name:login_form ", " username ", " MyUserName ", " passwd ", " MyPassword " ) 
 ; �رվ�� 
 _WinHttpCloseHandle ( $hConnect ) 
 
 MsgBox ( 262144 , " The End ", " Source of the last example is printed to console. " & @CRLF & _ 
    " In case valid login data was passed it will be user's mail page on yahoo.mail. " ) 
 
 ; �رվ�� 
 _WinHttpCloseHandle ( $hOpen ) 
 

 
 #include  <Crypt.au3> 
 
 ; ����ʹ����_Crypt_DeriveKey��������Կ��ʾ�� 
 
 Local  $StringsToCrypt [ 6 ]=[ "Bluth" ,  "Sunny" ,  "AutoIt3" ,  "SciTe" ,  42 ,  "42" ] 
 Local  $Crypted [ 6 ] 
 
 
 ; ����DeriveKey/DestroyKeyʹ���ڲ�������Բ���Ҫ_Crypt_Startup 
 $Key  =  _Crypt_DeriveKey ( "supersecretpassword" ,  $CALG_RC4 ) 
 
 $DisplayStr  =  "" 
 
 for  $Word  In  $StringsToCrypt 
     $DisplayStr  &=  $Word  &  @TAB  &  " = "  &  _Crypt_EncryptData ( $Word ,  $Key ,  $CALG_USERKEY )  &  @CRLF 
 Next 
 
 MsgBox ( 0 ,  "Crypt table" ,  $DisplayStr ) 
 
 _Crypt_DestroyKey ( $Key ) 
 

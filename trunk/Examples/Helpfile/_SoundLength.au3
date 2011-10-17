 
 #include  <Sound.au3> 
 ;�������ļ� 
 $sound  =  _SoundOpen ( @WindowsDir  &  "\media\Windows XP Startup.wav" ) 
 If  @error  =  2  Then 
     MsgBox ( 0 ,  "Error" ,  "The file does not exist" ) 
     Exit 
 ElseIf  @error  =  3  Then 
     MsgBox ( 0 ,  "Error" ,  "The alias was invalid" ) 
     Exit 
 ElseIf  @extended  <>  0  Then 
     $extended  =  @extended  ;����@extended����DllCall����, �ȸ�ֵ����һ������ 
     $stText  =  DllStructCreate ( "char[128]" ) 
     $errorstring  =  DllCall ( "winmm.dll" ,  "short" ,  "mciGetErrorStringA" ,  "str" ,  $extended ,  "ptr" ,  DllStructGetPtr ( $stText ),  "int" ,  128 ) 
     MsgBox ( 0 ,  "Error" ,  "The open failed."  &  @CRLF  &  "Error Number: "  &  $extended  &  @CRLF  &  "Error Description: "  &  DllStructGetData ( $stText ,  1 )  &  @CRLF  &  "Please Note: The sound may still play correctly." ) 
 Else 
     MsgBox ( 0 ,  "Success" ,  "The file opened successfully" ) 
 EndIf 
 MsgBox ( 0 ,  "Sound Length" ,  "The Sound has a length of:"  &  @CRLF  &  "hh:mm:ss - "  &  _ 
         _SoundLength ( $sound ,  1 )  &  @CRLF  &  "Milliseconds - "  &  _SoundLength ( $sound ,  2 ))  


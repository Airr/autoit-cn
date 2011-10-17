 #include <Array.au3> 
 
 ;=============================================================================== 
 ; ��1 
 ;=============================================================================== 
 $asControls = StringSplit ( WinGetClassList ( " [active] ", "" ) , @LF ) 
 _ArrayDisplay ( $asControls , " Class List of Active Window " ) 
 
 ;=============================================================================== 
 ; ��2 (ʹ��һ���ֹ����������) 
 ;=============================================================================== 
 Local $avArray [ 10 ] 
 
 $avArray [ 0 ] = " JPM " 
 $avArray [ 1 ] = " Holger " 
 $avArray [ 2 ] = " Jon " 
 $avArray [ 3 ] = " Larry " 
 $avArray [ 4 ] = " Jeremy " 
 $avArray [ 5 ] = " Valik " 
 $avArray [ 6 ] = " Cyberslug " 
 $avArray [ 7 ] = " Nutster " 
 $avArray [ 8 ] = " JdeB " 
 $avArray [ 9 ] = " Tylo " 
 
 _ArrayDisplay ( $avArray , " $avArray set manually 1D " ) 
 _ArrayDisplay ( $avArray , " $avArray set manually 1D transposed ", -1 , 1 ) 
 
 ;=============================================================================== 
 ; ��3 (ʹ����StringSplit()���ص�����) 
 ;=============================================================================== 
 $avArray = StringSplit ( WinGetClassList ( " ", " " ) , @LF ) 
 _ArrayDisplay ( $avArray , " $avArray as a list classes in window " ) 
 
 ;=============================================================================== 
 ; ��4 (��ά����) 
 ;=============================================================================== 
 Local $avArray [ 2 ][ 5 ] = [[ " JPM ", " Holger ", " Jon ", " Larry ", " Jeremy " ] , [ " Valik ", " Cyberslug ", " Nutster ", " JdeB ", " Tylo " ]] 
 _ArrayDisplay ( $avArray , " $avArray as a 2D array " ) 
 _ArrayDisplay ( $avArray , " $avArray as a 2D array , transposed ", -1 , 1 ) 
 

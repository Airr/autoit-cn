
 
   
���  _IEIsFrameSet , _IEFrameGetObjByName  
   
ʾ��  
 ; ******************************************************* 
 ; ʾ�� - �򿪿�ܼ�ʾ��, ��ȡ��ܼ� 
 ; ******************************************************* 
 #include <IE.au3> 
 $oIE = _IE_Example ( " frameset " ) 
 $oFrames = _IEFrameGetCollection ( $oIE ) 
 $iNumFrames = @extended 
 For $i = 0  to ( $iNumFrames - 1 ) 
   $oFrame = _IEFrameGetCollection ( $oIE , $i ) 
   MsgBox ( 0 , " Frame Info > ", _IEPropertyGet ( $oFrame , " locationurl " )) 
 Next 

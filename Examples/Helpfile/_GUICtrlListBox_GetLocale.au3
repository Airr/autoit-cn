48
 _GUICtrlListBox_GetLocale     _GUICtrlListBox_GetLocale   
��ȡ��ǰ���� 
 
#Include <GuiListBox.au3> 
_GUICtrlListBox_GetLocale( $hWnd ) 
  
   
����    
 $hWnd  �ؼ����  
   
����ֵ �ɹ�: �߼������ְ������Ҵ���, �ͼ������ְ�������ʶ����. 
 
   
��� _GUICtrlListBox_GetLocaleCountry , _GUICtrlListBox_GetLocaleLang , _GUICtrlListBox_GetLocalePrimLang , _GUICtrlListBox_GetLocaleSubLang , _GUICtrlListBox_SetLocale  
   
 #AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6 
 #include <GUIListBox.au3> 
 #include <GuiConstantsEx.au3> 
 
 Opt ( ' MustDeclareVars ', 1 ) 
 
 $Debug_LB = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 _Main() 
 
 Func _Main() 
   Local $hListBox 
 
   ; �������� 
   GUICreate ( " List Box Get Locale ",  400 , 296 ) 
   $hListBox = GUICtrlCreateList ( "",  2 , 2 , 396 , 296 ) 
   GUISetState () 
 
   ; ��ʾ����, ���Ҵ���, ����ʶ����, �������Ա��, �����Ա�� 
   MsgBox ( 4160 , " Information ", _ 
       " Locale .................: " & _GUICtrlListBox_GetLocale ( $hListBox ) & @LF & _ 
       " Country code ........: " & _GUICtrlListBox_GetLocaleCountry ( $hListBox ) & @LF & _ 
       " Language identifier..: " & _GUICtrlListBox_GetLocaleLang ( $hListBox ) & @LF & _ 
       " Primary Language id : " & _GUICtrlListBox_GetLocalePrimLang ( $hListBox ) & @LF & _ 
       " Sub-Language id ....: " & _GUICtrlListBox_GetLocaleSubLang ( $hListBox )) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
   GUIDelete () 
 EndFunc ;==>_Main 
 

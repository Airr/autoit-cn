 #include <GuiComboBoxEx.au3> 
 #include <GuiConstantsEx.au3> 
 #include <GuiImageList.au3> 
 
 Opt ( ' MustDeclareVars ' , 1 ) 
 
 $Debug_CB = False ; ��鴫�ݸ����������� , ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 _Main() 
 
 Func _Main() 
   Local $hGUI , $hImage , $hCombo 
 
     ; �������� 
   $hGUI = GUICreate ( " ComboBoxEx  Show Drop Down ", 400 , 300 ) 
   $hCombo = _GUICtrlComboBoxEx_Create ( $hGUI , "", 2 , 2 , 394 , 100 ) 
   GUISetState () 
 
   $hImage = _GUIImageList_Create ( 16 , 16 , 5 , 3 ) 
   _GUIImageList_AddIcon ( $hImage , @SystemDir & " \shell32.dll ", 110 ) 
   _GUIImageList_AddIcon ( $hImage , @SystemDir & " \shell32.dll ", 131 ) 
   _GUIImageList_AddIcon ( $hImage , @SystemDir & " \shell32.dll ", 165 ) 
   _GUIImageList_AddIcon ( $hImage , @SystemDir & " \shell32.dll ", 168 ) 
   _GUIImageList_AddIcon ( $hImage , @SystemDir & " \shell32.dll ", 137 ) 
   _GUIImageList_AddIcon ( $hImage , @SystemDir & " \shell32.dll ", 146 ) 
   _GUIImageList_Add ( $hImage , _GUICtrlComboBoxEx_CreateSolidBitMap ( $hCombo , 0xFF0000 , 16 , 16 )) 
   _GUIImageList_Add ( $hImage , _GUICtrlComboBoxEx_CreateSolidBitMap ( $hCombo , 0x00FF00 , 16 , 16 )) 
   _GUIImageList_Add ( $hImage , _GUICtrlComboBoxEx_CreateSolidBitMap ( $hCombo , 0x0000FF , 16 , 16 )) 
   _GUICtrlComboBoxEx_SetImageList ( $hCombo , $hImage ) 
 
   For $x = 0  To 8 
     _GUICtrlComboBoxEx_AddString ( $hCombo , StringFormat ( " %03d : Random string ", Random ( 1 , 100 , 1 )) , $x , $x ) 
   Next 
 
   ; ��ʾ�����б� 
   _GUICtrlComboBoxEx_ShowDropDown ( $hCombo , True ) 
 
   Sleep ( 500 ) 
 
   ; ���������б� 
   _GUICtrlComboBoxEx_ShowDropDown ( $hCombo ) 
 
   ; ѭ�����û��˳� 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
 EndFunc ;==>_Main 
 

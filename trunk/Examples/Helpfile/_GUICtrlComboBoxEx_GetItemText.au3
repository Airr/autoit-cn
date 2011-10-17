 #include <GuiComboBoxEx.au3> 
 #include <GuiConstantsEx.au3> 
 #include <GuiImageList.au3> 
 
 Opt ( ' MustDeclareVars ' , 1 ) 
 
 $Debug_CB = False ; ��鴫�ݸ����������� , ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 _Main() 
 
 Func _Main() 
   Local $hGUI , $hImage , $sText , $hCombo 
 
   ; �������� 
   $hGUI = GUICreate ( " ComboBoxEx Item Text ", 400 , 300 ) 
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
 
   For $x = 0  To 149 
     _GUICtrlComboBoxEx_AddString ( $hCombo , StringFormat ( " %03d : Random string ", Random ( 1 , 100 , 1 )) , Random ( 0 , 8 , 1 ) , Random ( 0 , 8 , 1 ) , Random ( 0 , 8 , 1 )) 
   Next 
   _GUICtrlComboBoxEx_EndUpdate ( $hCombo ) 
   _GUICtrlComboBoxEx_SetItemImage ( $hCombo , 0 , 1 ) 
   _GUICtrlComboBoxEx_SetItemIndent ( $hCombo , 1 , 1 ) 
   _GUICtrlComboBoxEx_SetItemIndent ( $hCombo , 2 , 1 ) 
   _GUICtrlComboBoxEx_SetItemSelectedImage ( $hCombo , 0 , 3 ) 
 
   ; ��ȡ��Ŀ�ı� 
   _GUICtrlComboBoxEx_GetItemText ( $hCombo , 0 , $sText ) 
   MsgBox ( 4160 , " Information ", " Item Text:  " & $sText ) 
 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
 EndFunc ;==>_Main 
 

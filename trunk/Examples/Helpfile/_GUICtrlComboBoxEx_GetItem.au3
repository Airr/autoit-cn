 #include <GuiComboBoxEx.au3> 
 #include <GuiConstantsEx.au3> 
 #include <GuiImageList.au3> 
 
 Opt ( ' MustDeclareVars ' , 1 ) 
 
 $Debug_CB = False ; ��鴫�ݸ����������� , ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 
 
 Global $iMemo 
 
 _Main() 
 
 Func _Main() 
   Local $hGUI , $hImage , $aItem , $hCombo 
 
   ; �������� 
   $hGUI = GUICreate ( " ComboBoxEx Image List ", 400 , 300 ) 
   $hCombo = _GUICtrlComboBoxEx_Create ( $hGUI , "", 2 , 2 , 394 , 100 ) 
   $iMemo = GUICtrlCreateEdit ( "", 2 , 32 , 396 , 266 , 0 ) 
   GUICtrlSetFont ( $iMemo , 9 , 400 , 0 , " Courier New " ) 
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
 
   ;������Ŀ���� 
   _GUICtrlComboBoxEx_SetItemIndent ( $hCombo , 1 , 1 ) 
 
   $aItem = _GUICtrlComboBoxEx_GetItem ( $hCombo , 1 ) 
   MemoWrite( " Item Text : " & $aItem [ 0 ]) 
   MemoWrite( " Item Len ..........................: " & $aItem [ 1 ]) 
   MemoWrite( " # image widths to indent ..........: " & $aItem [ 2 ]) 
   MemoWrite( " Zero based item image index .......: " & $aItem [ 3 ]) 
   MemoWrite( " Zero based item state image index .: " & $aItem [ 4 ]) 
   MemoWrite( " Zero based item image overlay index: " & $aItem [ 5 ]) 
   MemoWrite( " Item application defined value ....: " & $aItem [ 6 ]) 
 
   Do 
   Until GUIGetMsg () = $GUI_EVENT_CLOSE 
 EndFunc ;==>_Main 
 
 ; д��memo�ؼ� 
 Func MemoWrite( $sMessage ) 
   GUICtrlSetData ( $iMemo , $sMessage & @CRLF , 1 ) 
 EndFunc ;==>MemoWrite 
 

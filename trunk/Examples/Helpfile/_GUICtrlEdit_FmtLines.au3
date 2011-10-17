
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 
6 
#include  <GuiEdit.au3> 
#include  <GuiConstantsEx.au3> 
#include  <WindowsConstants.au3> 

Opt ( 'MustDeclareVars' ,  1 ) 

$Debug_Ed  =  False  ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤�� 

_Main () 

Func _Main () 
    Local  $hEdit 
    Local  $sFile  =  RegRead ( "HKEY_LOCAL_MACHINE\SOFTWARE\AutoIt v3\AutoIt" ,  "InstallDir" )  &  "\include\changelog.txt" 
    Local  $sBefore ,  $sAfter 
    
    ; �������� 
    GUICreate ( "Edit 
FmtLines" ,  400 ,  300 ) 
    $hEdit  =  GUICtrlCreateEdit ( "" ,  2 ,  2 ,  394 ,  268 ,  BitOR ( $ES_WANTRETURN ,  $WS_VSCROLL )) 
    GUISetState () 

    ; 
�����ı� 
    _GUICtrlEdit_SetText ( $hEdit ,  FileRead ( $sFile ,  500 )) 

    ; 
��Ĭ�ϸ�ʽ��ȡ���ı� 
    $sBefore  =  _GUICtrlEdit_GetText ( $hEdit ) 
    
    ; �������з� 
    _GUICtrlEdit_FmtLines ( $hEdit ,  True ) 

    ; �������з����ı� 
    $sAfter  =  _GUICtrlEdit_GetText ( $hEdit ) 

  
  MsgBox ( 4096 ,  "Information" ,  "Before:"  &  @LF  &  @LF  &  $sBefore  &  @LF  &  _ 
            '--------------------------------------------------------------'  &  @LF  &  _ 
      
      "After:"  &  @LF  &  @LF  &  $sAfter ) 
    
    ; ѭ�����û��˳� 
    Do 
    Until  GUIGetMsg ()  =  $GUI_EVENT_CLOSE 
    GUIDelete () 
EndFunc    ;==>_Main 


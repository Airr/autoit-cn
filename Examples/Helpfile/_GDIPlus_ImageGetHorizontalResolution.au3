
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6

#include  <GuiConstantsEx.au3>
#include  <WindowsConstants.au3>
#include  <GDIPlus.au3>
#include  <ScreenCapture.au3>
#include  <WinAPI.au3>


Opt('MustDeclareVars', 1)

Global $iMemo

_Main()

Func _Main()
	Local $hGUI, $hBitmap, $hImage

	; ��������
	$hGUI = GUICreate("GDI+", 600, 400)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; ��ʼ��GDI+��
	_GDIPlus_Startup()

	; ��׽32λλͼ
	$hBitmap = _ScreenCapture_Capture("")
	$hImage = _GDIPlus_BitmapCreateFromHBITMAP($hBitmap)

	; ��ʾͼ��DPI��ˮƽ�ʹ�ֱ�ֱ���
	MemoWrite("HorizontalResolution DPI :" & _GDIPlus_ImageGetHorizontalResolution($hImage)) ;
	MemoWrite("VerticalResolution DPI :" & _GDIPlus_ImageGetVerticalResolution($hImage)) ;

	; �����Դ
	_GDIPlus_ImageDispose($hImage)
	_WinAPI_DeleteObject($hBitmap)

	; �ر�GDI+��
	_GDIPlus_Shutdown()

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

endfunc   ;==>_Main

; д��memo�ؼ�
Func MemoWrite($sMessage = '')
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
endfunc   ;==>MemoWrite


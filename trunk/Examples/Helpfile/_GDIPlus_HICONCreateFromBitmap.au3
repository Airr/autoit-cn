#include <Constants.au3>
#include <GDIPlusEx.au3>
#include <GUIConstantsEx.au3>
#include <ScreenCapture.au3>
#include <StaticConstants.au3>

Opt('MustDeclareVars ', 1)

_Example()

Func _Example()
	Local $hGUI, $hBMP, $hBitmap, $hGraphic

	; ��������
	$hGUI = GUICreate(" _GDIPlus_HICONCreateFromBitmap Example ", 400, 200)
	$Label = GUICtrlCreateLabel("", 120, 20, 160, 160, $SS_ICON)
	GUISetState()

	; ��ʼ��GDI+��
	_GDIPlus_Startup()

	; ��λͼ���Ƶ�GUI
	$hBMP = _ScreenCapture_Capture("", 0, 0, -1, -1, False)
	$hBitmap = _GDIPlus_BitmapCreateFromHBITMAP($hBMP)
	$hIcon = _GDIPlus_HICONCreateFromBitmap($hBitmap)
	GUICtrlSendMsg($Label, $hBitmap, 370, $IMAGE_ICON, $hIcon) ; STM_SETIMAGE = 370

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; �����Դ
	_WinAPI_DestroyIcon($hIcon)
	_GDIPlus_ImageDispose($hBitmap)
	_WinAPI_DeleteObject($hBMP)

	; �ر�GDI+��
	_GDIPlus_ShutDown()

endfunc   ;==>_Example


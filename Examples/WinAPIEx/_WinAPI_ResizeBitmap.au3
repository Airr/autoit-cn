#Include <APIConstants.au3>
#Include <WinAPIEx.au3>

Opt('MustDeclareVars', 1)

Global Const $STM_SETIMAGE = 0x0172
Global Const $STM_GETIMAGE = 0x0173

Global $hForm, $Pic, $hPic, $tSIZE, $W, $H, $hObj, $hBitmap, $hResize

; ���ز�����ͼ���С (x2)
$hBitmap = _WinAPI_LoadImage(0, @ScriptDir & '\Extras\Logo.bmp', $IMAGE_BITMAP, 0, 0, $LR_LOADFROMFILE)
$tSIZE = _WinAPI_GetBitmapDimension($hBitmap)
$W = 2 * DllStructGetData($tSIZE, 'X')
$H = 2 * DllStructGetData($tSIZE, 'Y')
$hResize = _WinAPI_ResizeBitmap($hBitmap, $W, $H)
_WinAPI_DeleteObject($hBitmap)

; ���� GUI
$hForm = GUICreate('MyGUI', $W, $H)
$Pic = GUICtrlCreatePic('', 0, 0, $W, $H)
$hPic = GUICtrlGetHandle($Pic)

; ����λͼ���ؼ�
_SendMessage($hPic, $STM_SETIMAGE, 0, $hResize)
$hObj = _SendMessage($hPic, $STM_GETIMAGE)
If $hObj <> $hResize Then
	_WinAPI_DeleteObject($hResize)
EndIf

GUISetState()

Do
Until GUIGetMsg() = -3

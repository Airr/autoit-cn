#Include <APIConstants.au3>
#Include <GUIConstantsEx.au3>
#Include <WinAPIEx.au3>

Opt('MustDeclareVars', 1)

If _WinAPI_GetVersion() < '6.0' Then
	MsgBox(16, 'Error', 'Require Windows Vista or later.')
	Exit
EndIf

Global Const $STM_SETIMAGE = 0x0172
Global Const $STM_GETIMAGE = 0x0173

Global $hPic, $hObj, $hIcon, $hTech, $hBitmap, $hBP, $hDC, $hSrcDC, $hSrcSv, $hDestDC, $hDestSv, $hNewDC

; ����λͼ��ͼ��
$hTech = _WinAPI_LoadImage(0, @ScriptDir & '\Extras\Tech.bmp', $IMAGE_BITMAP, 0, 0, $LR_LOADFROMFILE)
$hIcon = _WinAPI_ShellExtractIcon(@ScriptDir & '\Extras\NVIDIA.ico', 0, 256, 256)

; ���� GUI
GUICreate('MyGUI', 302, 302, -1, -1, $WS_POPUP, $WS_EX_TOPMOST)
GUICtrlCreatePic('', 0, 0, 302, 302)
$hPic = GUICtrlGetHandle(-1)

; ��ʼ���������滭
_WinAPI_BufferedPaintInit()

; ѡ��λͼ���豸������
$hDC = _WinAPI_GetDC($hPic)
$hSrcDC = _WinAPI_CreateCompatibleDC($hDC)
$hSrcSv = _WinAPI_SelectObject($hSrcDC, $hTech)

; ��ʼ�������滭����
$hBP = _WinAPI_BeginBufferedPaint($hSrcDC, _WinAPI_CreateRectEx(22, 22, 256, 256), $hNewDC, $BPBF_COMPATIBLEBITMAP, 0, 0, 160)

; ��溬͸���ȵ�ͼ��
_WinAPI_DrawIconEx($hNewDC, 22, 22, $hIcon)

; �����������滭���������������豸������
_WinAPI_EndBufferedPaint($hBP)

; �ϲ�λͼ���ͷ���Դ
$hDestDC = _WinAPI_CreateCompatibleDC($hDC)
$hBitmap = _WinAPI_CreateCompatibleBitmapEx($hDC, 302, 302, 0x606060)
$hDestSv = _WinAPI_SelectObject($hDestDC, $hBitmap)
_WinAPI_BitBlt($hDestDC, 1, 1, 300, 300, $hSrcDC, 0, 0, $MERGECOPY)
_WinAPI_SelectObject($hDestDC, $hDestSv)
_WinAPI_DeleteDC($hDestDC)
_WinAPI_SelectObject($hSrcDC, $hSrcSv)
_WinAPI_DeleteDC($hSrcDC)
_WinAPI_ReleaseDC($hPic, $hDC)
_WinAPI_DeleteObject($hTech)
_WinAPI_DestroyIcon($hIcon)

; ����λͼ���ؼ�
_SendMessage($hPic, $STM_SETIMAGE, 0, $hBitmap)
$hObj = _SendMessage($hPic, $STM_GETIMAGE)
If $hObj <> $hBitmap Then
	_WinAPI_DeleteObject($hBitmap)
EndIf

; �رջ������滭
_WinAPI_BufferedPaintUnInit()

GUISetState()

Do
Until GUIGetMsg() = -3

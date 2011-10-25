#Include <WinAPIEx.au3>

Opt('MustDeclareVars ', 1)

Global Const $STM_SETIMAGE = 0x0172
Global Const $STM_GETIMAGE = 0x0173

Global $hForm, $Pic, $hPic, $hDC, $hMemDC, $hMemSv, $hBitmap, $pBits, $hDev, $hObj, $Path
Global $aColorTable, $tColorTable

; 8λͼ��Ҫ256��ֵ����ɫ����
Dim $aColorTable[256]
For $i = 0 To 255
	$aColorTable[$i] = _WinAPI_RGB(0, $i, 255 - $i)
Next

; ����ɫ���鴴����ɫ��
$tColorTable = _WinAPI_CreateDIBColorTable($aColorTable)

; ����8λ��DIB����ȡ����λֵ��λ��ָ��
$hBitmap = _WinAPI_CreateDIB(256, 256, 8, $tColorTable, 256)
$pBits = _WinAPI_GetExtended()

; ���λͼ��ɫ����
For $i = 0 To 255
	_WinAPI_FillMemory($pBits + 256 * $i, 256, $i)
Next

; ��������
$hForm = GUICreate('MyGUI ', 256, 256)
$Pic = GUICtrlCreatePic('', 0, 0, 256, 256)
$hPic = GUICtrlGetHandle($Pic)

; ��DIB����DDB�������ؼ��е���ʾλͼ
$hDC = _WinAPI_GetDC($hPic)
$hDev = _WinAPI_CreateCompatibleBitmap($hDC, 256, 256)
$hMemDC = _WinAPI_CreateCompatibleDC($hDC)
$hMemSv = _WinAPI_SelectObject($hMemDC, $hDev)
_WinAPI_TextOut($hMemDC, 0, 0, $hBitmap)
_WinAPI_ReleaseDC($hPic, $hDC)
_WinAPI_SelectObject($hMemDC, $hMemSv)
_WinAPI_DeleteDC($hMemDC)

; ��λͼ���ø��ؼ�
_SendMessage($hPic, $STM_SETIMAGE, 0, $hDev)
$hObj = _SendMessage($hPic, $STM_GETIMAGE)
If $hObj <> $hDev Then
	_WinAPI_FreeObject($hDev)
EndIf

GUISetState()

; ����8����λ��λͼ��.bmp�ļ�
$Path = FileSaveDialog('Save Image ', @Desktopdir, 'Bitmap Image Files (*.bmp) ', 2 + 16, @Desktopdir & ' \MyImage.bmp ', $hForm)
If $Path Then
	_WinAPI_SaveHBITMAPToFile($Path, $hBitmap, 2834, 2834)
EndIf

Do
Until GUIGetMsg() = -3


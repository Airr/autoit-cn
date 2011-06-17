﻿#Include <FontConstants.au3>
#Include <WinAPIEx.au3>

Opt('MustDeclareVars', 1)

Global $tOLTM, $tData, $hDC, $hSv, $hFont

; 选择 "Arial" 字体到设备环境并获取 $tagOUTLINETEXTMETRIC 结构
$hDC = _WinAPI_GetDC(0)
$hFont = _WinAPI_CreateFont(24, 0, 0, 0, $FW_NORMAL , 0, 0, 0, $DEFAULT_CHARSET, $OUT_DEFAULT_PRECIS, $CLIP_DEFAULT_PRECIS, $ANTIALIASED_QUALITY, $DEFAULT_PITCH, 'Arial')
$hSv = _WinAPI_SelectObject($hDC, $hFont)
$tOLTM = _WinAPI_GetOutlineTextMetrics($hDC)
_WinAPI_SelectObject($hDC, $hSv)
_WinAPI_ReleaseDC(0, $hDC)

If IsDllStruct($tOLTM) Then
	ConsoleWrite('Family name:   ' & _otm($tOLTM, 'otmFamilyName') & @CR)
	ConsoleWrite('Typeface name: ' & _otm($tOLTM, 'otmFaceName') & @CR)
	ConsoleWrite('Style name     ' & _otm($tOLTM, 'otmStyleName') & @CR)
	ConsoleWrite('Full name:     ' & _otm($tOLTM, 'otmFullName') & @CR)
EndIf

Func _otm(ByRef $tOLTM, $sName)
	Return DllStructGetData(DllStructCreate('wchar[' & (_WinAPI_StrLen(DllStructGetPtr($tOLTM) + DllStructGetData($tOLTM, $sName)) + 1) & ']', DllStructGetPtr($tOLTM) + DllStructGetData($tOLTM, $sName)), 1)
EndFunc   ;==>_otm

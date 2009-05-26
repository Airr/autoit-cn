﻿#include-once

#include <ToolTipConstants.au3>
#include <Memory.au3>
#include <WinAPI.au3>
#include <StructureConstants.au3>
#include <SendMessage.au3>

; #INDEX# =======================================================================================================================
; Title .........: ToolTip
; Description ...: Functions that assist with ToolTip control management.
;                  ToolTip controls are pop-up windows that display text.  The text usually describes a tool, which is  either  a
;                  window, such as a child window or control, or an application-defined rectangular area within a window's client
;                  area.
; Author(s) .....: Paul Campbell (PaulIA)
; ===============================================================================================================================

; #VARIABLES# ===================================================================================================================
Global $_TT_ghTTLastWnd
; ===============================================================================================================================

; #CONSTANTS# ===================================================================================================================
Global Const $_TOOLTIPCONSTANTS_ClassName = "tooltips_class32"
; ===============================================================================================================================

; #CURRENT# =====================================================================================================================
;_GUIToolTip_Activate
;_GUIToolTip_AddTool
;_GUIToolTip_AdjustRect
;_GUIToolTip_BitsToTTF
;_GUIToolTip_Create
;_GUIToolTip_DelTool
;_GUIToolTip_Destroy
;_GUIToolTip_EnumTools
;_GUIToolTip_GetBubbleHeight
;_GUIToolTip_GetBubbleSize
;_GUIToolTip_GetBubbleWidth
;_GUIToolTip_GetCurrentTool
;_GUIToolTip_GetDelayTime
;_GUIToolTip_GetMargin
;_GUIToolTip_GetMarginEx
;_GUIToolTip_GetMaxTipWidth
;_GUIToolTip_GetText
;_GUIToolTip_GetTipBkColor
;_GUIToolTip_GetTipTextColor
;_GUIToolTip_GetTitleBitMap
;_GUIToolTip_GetTitleText
;_GUIToolTip_GetToolCount
;_GUIToolTip_GetToolInfo
;_GUIToolTip_HitTest
;_GUIToolTip_NewToolRect
;_GUIToolTip_Pop
;_GUIToolTip_PopUp
;_GUIToolTip_SetDelayTime
;_GUIToolTip_SetMargin
;_GUIToolTip_SetMaxTipWidth
;_GUIToolTip_SetTipBkColor
;_GUIToolTip_SetTipTextColor
;_GUIToolTip_SetTitle
;_GUIToolTip_SetToolInfo
;_GUIToolTip_SetWindowTheme
;_GUIToolTip_ToolExists
;_GUIToolTip_ToolToArray
;_GUIToolTip_TrackActivate
;_GUIToolTip_TrackPosition
;_GUIToolTip_TTFToBits
;_GUIToolTip_Update
;_GUIToolTip_UpdateTipText
; ===============================================================================================================================

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_Activate
; Description ...: Activates or deactivates the control
; Syntax.........: _GUIToolTip_Activate($hWnd[, $fActivate = True])
; Parameters ....: $hWnd        - Handle to control
;                  $fActivate   - Activation flag:
;                  |True  - Activate ToolTip
;                  |False - Deactivate ToolTip
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_Activate($hWnd, $fActivate = True)
	_SendMessage($hWnd, $TTM_ACTIVATE, $fActivate)
EndFunc   ;==>_GUIToolTip_Activate

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_AddTool
; Description ...: Registers a tool with the control
; Syntax.........: _GUIToolTip_AddTool($hTool, $hWnd, $sText[, $iID = 0[, $iLeft = 0[, $iTop = 0[, $iRight = 0[, $iBottom = 0[, $iFlags = 8[, $iParam = 0]]]]]]])
; Parameters ....: $hTool       - ToolTip handle
;                  $hWnd        - Handle to the window that contains the tool
;                  $sText       - Text for the ToolTip control
;                  $iID         - Identifier or window handle of the tool
;                  $iLeft       - X coordinate of the upper left corner of the rectangle
;                  $iTop        - Y coordinate of the upper left corner of the rectangle
;                  $iRight      - X coordinate of the lower right corner of the rectangle
;                  $iBottom     - Y coordinate of the lower right corner of the rectangle
;                  $iFlags      - Flags that control the ToolTip display:
;                  |  1 - Indicates that $iID is the window handle to the tool instead of the ID
;                  |  2 - Centers the window below the tool specified by $iID
;                  |  4 - Indicates that text will be displayed in the opposite direction
;                  |  8 - Indicates that the control should subclass the tool's  window
;                  | 16 - Positions the control next to the tool to which it corresponds
;                  | 32 - Positions the window at the same coordinates provided by TTM_TRACKPOSITION
;                  | 64 - Causes the control to forward mouse messages to the parent window
;                  |128 - Indicates that links in the control text should be parsed
;                  $iParam      - Application-defined value that is associated with the tool
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _GUIToolTip_DelTool
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_AddTool($hTool, $hWnd, $sText, $iID = 0, $iLeft = 0, $iTop = 0, $iRight = 0, $iBottom = 0, $iFlags = 8, $iParam = 0)
	Local $iToolInfo, $pToolInfo, $tToolInfo, $iBuffer, $pBuffer, $tBuffer, $pMemory, $tMemMap, $pText, $iResult

	$iBuffer = StringLen($sText) + 1
;~ 	If @AutoItUnicode Then
	$iBuffer *= 2
	$tBuffer = DllStructCreate("wchar Text[" & $iBuffer & "]")
;~ 	Else
;~ 		$tBuffer = DllStructCreate("char Text[" & $iBuffer & "]")
;~ 	EndIf
	$pBuffer = DllStructGetPtr($tBuffer)
	$tToolInfo = DllStructCreate($tagTOOLINFO)
	$pToolInfo = DllStructGetPtr($tToolInfo)
	$iToolInfo = DllStructGetSize($tToolInfo)
	DllStructSetData($tBuffer, "Text", $sText)
	DllStructSetData($tToolInfo, "Size", $iToolInfo)
	DllStructSetData($tToolInfo, "Flags", _GUIToolTip_BitsToTTF($iFlags))
	DllStructSetData($tToolInfo, "hWnd", $hWnd)
	DllStructSetData($tToolInfo, "ID", $iID)
	DllStructSetData($tToolInfo, "Left", $iLeft)
	DllStructSetData($tToolInfo, "Top", $iTop)
	DllStructSetData($tToolInfo, "Right", $iRight)
	DllStructSetData($tToolInfo, "Bottom", $iBottom)
	DllStructSetData($tToolInfo, "Param", $iParam)
	If _WinAPI_InProcess($hTool, $_TT_ghTTLastWnd) Then
		DllStructSetData($tToolInfo, "Text", $pBuffer)
;~ 		If @AutoItUnicode Then
		$iResult = _SendMessage($hTool, $TTM_ADDTOOLW, 0, $pToolInfo, 0, "wparam", "ptr")
;~ 		Else
;~ 			$iResult = _SendMessage($hTool, $TTM_ADDTOOL, 0, $pToolInfo, 0, "wparam", "ptr")
;~ 		EndIf
	Else
		$pMemory = _MemInit($hTool, $iToolInfo + $iBuffer, $tMemMap)
		$pText = $pMemory + $iToolInfo
		DllStructSetData($tToolInfo, "Text", $pText)
		_MemWrite($tMemMap, $pToolInfo, $pMemory, $iToolInfo)
		_MemWrite($tMemMap, $pBuffer, $pText, $iBuffer)
;~ 		If @AutoItUnicode Then
		$iResult = _SendMessage($hTool, $TTM_ADDTOOLW, 0, $pMemory, 0, "wparam", "ptr")
;~ 		Else
;~ 			$iResult = _SendMessage($hTool, $TTM_ADDTOOL, 0, $pMemory, 0, "wparam", "ptr")
;~ 		EndIf
		_MemFree($tMemMap)
	EndIf
	Return $iResult <> 0
EndFunc   ;==>_GUIToolTip_AddTool

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_AdjustRect
; Description ...: Calculates the text display rectangle from the window rectangle
; Syntax.........: _GUIToolTip_AdjustRect($hWnd, ByRef $tRect[, $fLarger = True])
; Parameters ....: $hWnd        - Handle to control
;                  $tRect       - $tagRECT structure that holds a window or text display rectangle
;                  $fLarger     - Value that specifies which operation to perform.  If True, $tRect is used  to  specify  a  text
;                  +display rectangle and it receives the corresponding window rectangle.  If False, $tRect is used to specify  a
;                  +window rectangle and it receives the corresponding text display rectangle.
; Return values .: Success      - $tagRECT structure
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: The ToolTip's window rectangle is somewhat larger than the text display  rectangle  that  bounds  the  ToolTip
;                  string.  The window origin is also offset up and to the left from the origin of the  text  display  rectangle.
;                  To position the text display rectangle, you must calculate the corresponding window  rectangle  and  use  that
;                  rectangle to position the ToolTip.  $TTM_ADJUSTRECT handles this calculation for you.  If you set $fLarger  to
;                  True, $TTM_ADJUSTRECT takes the size and position of the desired ToolTip text display  rectangle,  and  passes
;                  back the size and position of the ToolTip window needed to display the text in the specified  position. If you
;                  set $fLarger to False you can specify a ToolTip window rectangle and $TTM_ADJUSTRECT will return the size  and
;                  position of its text rectangle.
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_AdjustRect($hWnd, ByRef $tRect, $fLarger = True)
	Local $iRect, $pRect, $pMemory, $tMemMap

	$pRect = DllStructGetPtr($tRect)
	If _WinAPI_InProcess($hWnd, $_TT_ghTTLastWnd) Then
		_SendMessage($hWnd, $TTM_ADJUSTRECT, $fLarger, $pRect, 0, "wparam", "ptr")
	Else
		$iRect = DllStructGetSize($tRect)
		$pMemory = _MemInit($hWnd, $iRect, $tMemMap)
		_MemWrite($tMemMap, $pRect)
		_SendMessage($hWnd, $TTM_ADJUSTRECT, $fLarger, $pMemory, 0, "wparam", "ptr")
		_MemRead($tMemMap, $pMemory, $pRect, $iRect)
		_MemFree($tMemMap)
	EndIf
	Return $tRect
EndFunc   ;==>_GUIToolTip_AdjustRect

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_BitsToTTF
; Description ...: Encode user bit flags to $TTF_ flags
; Syntax.........: _GUIToolTip_BitsToTTF($iFlags)
; Parameters ....: $iFlags      - User bit flags
; Return values .: Success      - $TTF_ flags
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _GUIToolTip_TTFToBits
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_BitsToTTF($iFlags)
	Local $iN = 0

	If BitAND($iFlags, 1) <> 0 Then $iN = BitOR($iN, $TTF_IDISHWND)
	If BitAND($iFlags, 2) <> 0 Then $iN = BitOR($iN, $TTF_CENTERTIP)
	If BitAND($iFlags, 4) <> 0 Then $iN = BitOR($iN, $TTF_RTLREADING)
	If BitAND($iFlags, 8) <> 0 Then $iN = BitOR($iN, $TTF_SUBCLASS)
	If BitAND($iFlags, 16) <> 0 Then $iN = BitOR($iN, $TTF_TRACK)
	If BitAND($iFlags, 32) <> 0 Then $iN = BitOR($iN, $TTF_ABSOLUTE)
	If BitAND($iFlags, 64) <> 0 Then $iN = BitOR($iN, $TTF_TRANSPARENT)
	If BitAND($iFlags, 128) <> 0 Then $iN = BitOR($iN, $TTF_PARSELINKS)
	Return $iN
EndFunc   ;==>_GUIToolTip_BitsToTTF

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_Create
; Description ...: Creates a ToolTip control
; Syntax.........: _GUIToolTip_Create($hWnd[, $iStyle = 0x00000003])
; Parameters ....: $hWnd        - Handle to control that will own the tool tip window
;                  $iStyle      - ToolTip style:
;                  |$TTS_ALWAYSTIP - Indicates that the ToolTip control appears when the cursor is on a tool even if the  ToolTip
;                  +control's owner window is inactive. Without this style, the ToolTip appears only when the tool's owner window
;                  +is active.
;                  |$TTS_BALLOON   - Indicates that the ToolTip control has the appearance of a cartoon "balloon,"  with  rounded
;                  +corners and a stem pointing to the item.
;                  |$TTS_NOANIMATE - Disables sliding ToolTip animation on Windows 98 and Windows 2000  systems.  This  style  is
;                  +ignored on earlier systems.
;                  |$TTS_NOFADE    - Disables fading ToolTip animation on Windows 2000 systems.  This style is ignored on earlier
;                  +Windows NT systems, Windows 95 and Windows 98.
;                  |$TTS_NOPREFIX  - Prevents the system from stripping the ampersand character from a string. Without this style
;                  +the system automatically strips ampersand characters.  This allows an application to use the same  string  as
;                  +both a menu item and as text in a ToolTip control.
;                  |$TTS_CLOSE     - Displays a close icon so that the tooltip can be canceled
;                  -
;                  |Default: $TTS_ALWAYSTIP, $TTS_NOPREFIX
; Return values .: Success      - The handle to the Tooltip window
;                  Failure      - 0
; Author ........: Paul Campbell (PaulIA)
; Modified.......: Gary Frost
; Remarks .......:
; Related .......: _GUIToolTip_Destroy
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_Create($hWnd, $iStyle = 0x00000003)
;~ 	Local $nCtrlID

;~ 	$nCtrlID = _UDF_GetNextGlobalID($hWnd)
;~ 	If @error Then Return SetError(@error, @extended, 0)

;~ 	Return _WinAPI_CreateWindowEx(0, $_TOOLTIPCONSTANTS_ClassName, "", $iStyle, 0, 0, 0, 0, $hWnd, $nCtrlID)
	Return _WinAPI_CreateWindowEx(0, $_TOOLTIPCONSTANTS_ClassName, "", $iStyle, 0, 0, 0, 0, $hWnd)
EndFunc   ;==>_GUIToolTip_Create

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_DelTool
; Description ...: Removes a tool
; Syntax.........: _GUIToolTip_DelTool($hWnd, $hTool[, $iID = 0])
; Parameters ....: $hWnd        - Handle to control
;                  $hTool       - Handle to the window that contains the tool
;                  $iID         - Identifier of the tool
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _GUIToolTip_AddTool
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_DelTool($hWnd, $hTool, $iID = 0)
	Local $iToolInfo, $pToolInfo, $tToolInfo, $pMemory, $tMemMap

	$tToolInfo = DllStructCreate($tagTOOLINFO)
	$pToolInfo = DllStructGetPtr($tToolInfo)
	$iToolInfo = DllStructGetSize($tToolInfo)
	DllStructSetData($tToolInfo, "Size", $iToolInfo)
	DllStructSetData($tToolInfo, "ID", $iID)
	DllStructSetData($tToolInfo, "hWnd", $hTool)
	If _WinAPI_InProcess($hWnd, $_TT_ghTTLastWnd) Then
;~ 		If @AutoItUnicode Then
		_SendMessage($hWnd, $TTM_DELTOOLW, 0, $pToolInfo, 0, "wparam", "ptr")
;~ 		Else
;~ 			_SendMessage($hWnd, $TTM_DELTOOL, 0, $pToolInfo, 0, "wparam", "ptr")
;~ 		EndIf
	Else
		$pMemory = _MemInit($hWnd, $iToolInfo, $tMemMap)
		_MemWrite($tMemMap, $pToolInfo)
;~ 		If @AutoItUnicode Then
		_SendMessage($hWnd, $TTM_DELTOOLW, 0, $pMemory, 0, "wparam", "ptr")
;~ 		Else
;~ 			_SendMessage($hWnd, $TTM_DELTOOL, 0, $pMemory, 0, "wparam", "ptr")
;~ 		EndIf
		_MemFree($tMemMap)
	EndIf
EndFunc   ;==>_GUIToolTip_DelTool

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_Destroy
; Description ...: Delete the ToolTip control
; Syntax.........: _GUIToolTip_Destroy(ByRef $hWnd)
; Parameters ....: $hWnd        - Handle to the control
; Return values .: Success      - True, Handle is set to 0
;                  Failure      - False
; Author ........: Gary Frost
; Modified.......:
; Remarks .......: Restricted to only be used on ToolTip created with _GUIToolTip_Create
; Related .......: _GUIToolTip_Create
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_Destroy(ByRef $hWnd)
;~ 	Local $iResult
	Local $Destroyed

	If _WinAPI_IsClassName($hWnd, $_TOOLTIPCONSTANTS_ClassName) Then
		If IsHWnd($hWnd) Then
			If _WinAPI_InProcess($hWnd, $_TT_ghTTLastWnd) Then
;~ 				Local $nCtrlID = _WinAPI_GetDlgCtrlID($hWnd)
;~ 				Local $hParent = _WinAPI_GetParent($hWnd)
				$Destroyed = _WinAPI_DestroyWindow($hWnd)
;~ 				$iResult = _UDF_FreeGlobalID($hParent, $nCtrlID)
;~ 				If Not $iResult Then
;~ 					; can check for errors here if needed, for debug
;~ 				EndIf
			Else
				_WinAPI_ShowMsg("Not Allowed to Destroy Other Applications Control(s)")
				Return SetError(1, 1, False)
			EndIf
		EndIf
		If $Destroyed Then $hWnd = 0
		Return $Destroyed <> 0
	EndIf
	Return SetError(2, 2, False)
EndFunc   ;==>_GUIToolTip_Destroy

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_EnumTools
; Description ...: Retrieves information  about the current tool
; Syntax.........: _GUIToolTip_EnumTools($hWnd, $iIndex)
; Parameters ....: $hWnd        - Handle to control
;                  $iIndex      - Zero based index of the tool for which to retrieve information
; Return values .: Success      - Array with the following format:
;                  |[0] - Flags that control the ToolTip display:
;                  |  1 - Indicates that $iID is the window handle to the tool instead of the ID
;                  |  2 - Centers the window below the tool specified by $iID
;                  |  4 - Indicates that text will be displayed in the opposite direction
;                  |  8 - Indicates that the control should subclass the tool's window to intercept messages
;                  | 16 - Positions the control next to the tool to which it corresponds
;                  | 32 - Positions the window at the same coordinates provided by TTM_TRACKPOSITION
;                  | 64 - Causes the control to forward mouse messages to the parent window
;                  |128 - Indicates that links in the control text should be parsed
;                  |[1] - Handle to the window that contains the tool
;                  |[2] - Identifier of the tool
;                  |[3] - X coordinate of the upper left corner of the rectangle
;                  |[4] - Y coordinate of the upper left corner of the rectangle
;                  |[5] - X coordinate of the lower right corner of the rectangle
;                  |[6] - Y coordinate of the lower right corner of the rectangle
;                  |[7] - Handle to the instance that contains the string resource for the tool
;                  |[8] - Text for the tool
;                  |[9] - Application-defined value associated with the tool
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_EnumTools($hWnd, $iIndex)
	Local $iToolInfo, $pToolInfo, $tToolInfo, $pMemory, $tMemMap, $fResult

	$tToolInfo = DllStructCreate($tagTOOLINFO)
	$pToolInfo = DllStructGetPtr($tToolInfo)
	$iToolInfo = DllStructGetSize($tToolInfo)
	DllStructSetData($tToolInfo, "Size", $iToolInfo)
	If _WinAPI_InProcess($hWnd, $_TT_ghTTLastWnd) Then
;~ 		If @AutoItUnicode Then
		$fResult = _SendMessage($hWnd, $TTM_ENUMTOOLSW, $iIndex, $pToolInfo, 0, "wparam", "ptr")
;~ 		Else
;~ 			$fResult = _SendMessage($hWnd, $TTM_ENUMTOOLS, $iIndex, $pToolInfo, 0, "wparam", "ptr")
;~ 		EndIf
	Else
		$pMemory = _MemInit($hWnd, $iToolInfo, $tMemMap)
		_MemWrite($tMemMap, $pToolInfo, $pMemory, $iToolInfo)
;~ 		If @AutoItUnicode Then
		$fResult = _SendMessage($hWnd, $TTM_ENUMTOOLSW, $iIndex, $pMemory, 0, "wparam", "ptr")
;~ 		Else
;~ 			$fResult = _SendMessage($hWnd, $TTM_ENUMTOOLS, $iIndex, $pMemory, 0, "wparam", "ptr")
;~ 		EndIf
		_MemRead($tMemMap, $pMemory, $pToolInfo, $iToolInfo)
		_MemFree($tMemMap)
	EndIf
	Return _GUIToolTip_ToolToArray($hWnd, $tToolInfo, $fResult = True)
EndFunc   ;==>_GUIToolTip_EnumTools

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_GetBubbleHeight
; Description ...: Returns the height of the control
; Syntax.........: _GUIToolTip_GetBubbleHeight($hWnd, $hTool, $iID[, $iFlags = 48])
; Parameters ....: $hWnd        - Handle to control
;                  $hTool       - Handle to the window that contains the tool
;                  $iID         - Identifier of the tool
;                  $iFlags      - Flags that control the ToolTip display:
;                  |  1 - Indicates that $iID is the window handle to the tool instead of the ID
;                  |  2 - Centers the window below the tool specified by $iID
;                  |  4 - Indicates that text will be displayed in the opposite direction
;                  |  8 - Indicates that the control should subclass the tool's window to intercept messages
;                  | 16 - Positions the control next to the tool to which it corresponds
;                  | 32 - Positions the window at the same coordinates provided by TTM_TRACKPOSITION
;                  | 64 - Causes the control to forward mouse messages to the parent window
;                  |128 - Indicates that links in the control text should be parsed
; Return values .: Success      - The height the ToolTip
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _GUIToolTip_GetBubbleSize, _GUIToolTip_GetBubbleWidth
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_GetBubbleHeight($hWnd, $hTool, $iID, $iFlags = 48)
	Return _WinAPI_HiWord(_GUIToolTip_GetBubbleSize($hWnd, $hTool, $iID, _GUIToolTip_BitsToTTF($iFlags)))
EndFunc   ;==>_GUIToolTip_GetBubbleHeight

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_GetBubbleSize
; Description ...: Returns the width and height of the control
; Syntax.........: _GUIToolTip_GetBubbleSize($hWnd, $hTool, $iID[, $iFlags = 0x000000A0])
; Parameters ....: $hWnd        - Handle to control
;                  $hTool       - Handle to the window that contains the tool
;                  $iID         - Identifier of the tool
;                  $iFlags      - Flags that control the ToolTip display
; Return values .: Success      - Returns the width of the ToolTip in the low word and the height in the high word
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _GUIToolTip_GetBubbleHeight, _GUIToolTip_GetBubbleWidth
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_GetBubbleSize($hWnd, $hTool, $iID, $iFlags = 0x000000A0)
	Local $iToolInfo, $pToolInfo, $tToolInfo, $pMemory, $tMemMap, $iResult

	$tToolInfo = DllStructCreate($tagTOOLINFO)
	$pToolInfo = DllStructGetPtr($tToolInfo)
	$iToolInfo = DllStructGetSize($tToolInfo)
	DllStructSetData($tToolInfo, "Size", $iToolInfo)
	DllStructSetData($tToolInfo, "hWnd", $hTool)
	DllStructSetData($tToolInfo, "ID", $iID)
	DllStructSetData($tToolInfo, "Flags", $iFlags)
	If _WinAPI_InProcess($hWnd, $_TT_ghTTLastWnd) Then
		$iResult = _SendMessage($hWnd, $TTM_GETBUBBLESIZE, 0, $pToolInfo, 0, "wparam", "ptr")
	Else
		$pMemory = _MemInit($hWnd, $iToolInfo, $tMemMap)
		_MemWrite($tMemMap, $pToolInfo)
		$iResult = _SendMessage($hWnd, $TTM_GETBUBBLESIZE, 0, $pMemory, 0, "wparam", "ptr")
		_MemFree($tMemMap)
	EndIf
	Return $iResult
EndFunc   ;==>_GUIToolTip_GetBubbleSize

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_GetBubbleWidth
; Description ...: Returns the width of a ToolTip control
; Syntax.........: _GUIToolTip_GetBubbleWidth($hWnd, $hTool, $iID[, $iFlags = 48])
; Parameters ....: $hWnd        - Handle to control
;                  $hTool       - Handle to the window that contains the tool
;                  $iID         - Application-defined identifier of the tool
;                  $iFlags      - Flags that control the ToolTip display:
;                  |  1 - Indicates that $iID is the window handle to the tool instead of the ID
;                  |  2 - Centers the window below the tool specified by $iID
;                  |  4 - Indicates that text will be displayed in the opposite direction
;                  |  8 - Indicates that the control should subclass the tool's  window to intercept messages
;                  | 16 - Positions the control next to the tool to which it corresponds
;                  | 32 - Positions the window at the same coordinates provided by TTM_TRACKPOSITION
;                  | 64 - Causes the control to forward mouse messages to the parent window
;                  |128 - Indicates that links in the control text should be parsed
; Return values .: Success      - The width the ToolTip
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _GUIToolTip_GetBubbleHeight, _GUIToolTip_GetBubbleSize
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_GetBubbleWidth($hWnd, $hTool, $iID, $iFlags = 48)
	Return _WinAPI_LoWord(_GUIToolTip_GetBubbleSize($hWnd, $hTool, $iID, _GUIToolTip_BitsToTTF($iFlags)))
EndFunc   ;==>_GUIToolTip_GetBubbleWidth

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_GetCurrentTool
; Description ...: Retrieves information for the current tool
; Syntax.........: _GUIToolTip_GetCurrentTool($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - Array with the following format:
;                  |[0] - Flags that control the ToolTip display:
;                  |   1 - Indicates that $iID is the window handle to the tool instead of the ID
;                  |   2 - Centers the window below the tool specified by $iID
;                  |   4 - Indicates that text will be displayed in the opposite direction
;                  |   8 - Indicates that the control should subclass the tool's  window to intercept messages
;                  |  16 - Positions the control next to the tool to which it corresponds
;                  |  32 - Positions the window at the same coordinates provided by TTM_TRACKPOSITION
;                  |  64 - Causes the control to forward mouse messages to the parent window
;                  | 128 - Indicates that links in the control text should be parsed
;                  |[1] - Handle to the window that contains the tool
;                  |[2] - Identifier of the tool
;                  |[3] - X coordinate of the upper left corner of the rectangle
;                  |[4] - Y coordinate of the upper left corner of the rectangle
;                  |[5] - X coordinate of the lower right corner of the rectangle
;                  |[6] - Y coordinate of the lower right corner of the rectangle
;                  |[7] - Handle to the instance that contains the string resource for the tool
;                  |[8] - Text for the tool
;                  |[9] - Application-defined value associated with the tool
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_GetCurrentTool($hWnd)
	Local $iToolInfo, $pToolInfo, $tToolInfo, $pMemory, $tMemMap, $fResult

	$tToolInfo = DllStructCreate($tagTOOLINFO)
	$pToolInfo = DllStructGetPtr($tToolInfo)
	$iToolInfo = DllStructGetSize($tToolInfo)
	DllStructSetData($tToolInfo, "Size", $iToolInfo)
	If _WinAPI_InProcess($hWnd, $_TT_ghTTLastWnd) Then
;~ 		If @AutoItUnicode Then
		$fResult = _SendMessage($hWnd, $TTM_GETCURRENTTOOLW, 0, $pToolInfo, 0, "wparam", "ptr")
;~ 		Else
;~ 			$fResult = _SendMessage($hWnd, $TTM_GETCURRENTTOOL, 0, $pToolInfo, 0, "wparam", "ptr")
;~ 		EndIf
	Else
		$pMemory = _MemInit($hWnd, $iToolInfo, $tMemMap)
		_MemWrite($tMemMap, $pToolInfo, $pMemory, $iToolInfo)
;~ 		If @AutoItUnicode Then
		$fResult = _SendMessage($hWnd, $TTM_GETCURRENTTOOLW, 0, $pMemory, 0, "wparam", "ptr")
;~ 		Else
;~ 			$fResult = _SendMessage($hWnd, $TTM_GETCURRENTTOOL, 0, $pMemory, 0, "wparam", "ptr")
;~ 		EndIf
		_MemRead($tMemMap, $pMemory, $pToolInfo, $iToolInfo)
		_MemFree($tMemMap)
	EndIf
	Return _GUIToolTip_ToolToArray($hWnd, $tToolInfo, $fResult = True)
EndFunc   ;==>_GUIToolTip_GetCurrentTool

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_GetDelayTime
; Description ...: Retrieves the initial, pop-up or reshow durations
; Syntax.........: _GUIToolTip_GetDelayTime($hWnd, $iDuration)
; Parameters ....: $hWnd        - Handle to control
;                  $iDuration   - Flag that specifies which duration value will be retrieved:
;                  |0 - Time it takes for subsequent ToolTip windows to appear as the pointer moves from one tool to another
;                  |1 - Time the ToolTip window remains visible if the pointer is stationary within a tool's bounding rectangle
;                  |2 - Time the pointer must remain stationary within a tool's bounding rectangle before the window appears
; Return values .: Success      - The specified duration, in milliseconds
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _GUIToolTip_SetDelayTime
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_GetDelayTime($hWnd, $iDuration)
	Return _SendMessage($hWnd, $TTM_GETDELAYTIME, $iDuration + 1)
EndFunc   ;==>_GUIToolTip_GetDelayTime

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_GetMargin
; Description ...: Retrieves the top, left, bottom, and right margins
; Syntax.........: _GUIToolTip_GetMargin($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - Array with the following format:
;                  |[0] - Distance between top border and top of text, in pixels
;                  |[1] - Distance between left border and left end of text, in pixels
;                  |[2] - Distance between bottom border and bottom of text, in pixels
;                  |[3] - Distance between right border and right end of text, in pixels
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _GUIToolTip_GetMarginEx, _GUIToolTip_SetMargin
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_GetMargin($hWnd)
	Local $tRect, $aMargin[4]

	$tRect = _GUIToolTip_GetMarginEx($hWnd)
	$aMargin[0] = DllStructGetData($tRect, "Left")
	$aMargin[1] = DllStructGetData($tRect, "Top")
	$aMargin[2] = DllStructGetData($tRect, "Right")
	$aMargin[3] = DllStructGetData($tRect, "Bottom")
	Return $aMargin
EndFunc   ;==>_GUIToolTip_GetMargin

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_GetMarginEx
; Description ...: Retrieves the top, left, bottom, and right margins
; Syntax.........: _GUIToolTip_GetMarginEx($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - $tagRECT structure that will receive the margin information:
;                  |Top    - Distance between top border and top of ToolTip text, in pixels
;                  |Left   - Distance between left border and left end of ToolTip text, in pixels
;                  |Bottom - Distance between bottom border and bottom of ToolTip text, in pixels
;                  |Right  - Distance between right border and right end of ToolTip text, in pixels
;                  |Result - True on success, otherwise False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _GUIToolTip_GetMargin
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_GetMarginEx($hWnd)
	Local $iRect, $pRect, $tRect, $pMemory, $tMemMap

	$tRect = DllStructCreate($tagRECT)
	$pRect = DllStructGetPtr($tRect)
	If _WinAPI_InProcess($hWnd, $_TT_ghTTLastWnd) Then
		_SendMessage($hWnd, $TTM_GETMARGIN, 0, $pRect, 0, "wparam", "ptr")
	Else
		$iRect = DllStructGetSize($tRect)
		$pMemory = _MemInit($hWnd, $iRect, $tMemMap)
		_SendMessage($hWnd, $TTM_GETMARGIN, 0, $pMemory, 0, "wparam", "ptr")
		_MemRead($tMemMap, $pMemory, $pRect, $iRect)
		_MemFree($tMemMap)
	EndIf
	Return $tRect
EndFunc   ;==>_GUIToolTip_GetMarginEx

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_GetMaxTipWidth
; Description ...: Retrieves the maximum width for a ToolTip window
; Syntax.........: _GUIToolTip_GetMaxTipWidth($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - Returns the maximum ToolTip width, in pixels
;                  Failure      - -1
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: The maximum ToolTip width value does not indicate a ToolTip window's actual width. Rather, if a ToolTip string
;                  exceeds the maximum width, the control breaks the text into multiple lines, using  spaces  to  determine  line
;                  breaks. If the text cannot be segmented into multiple lines, it will be displayed on a single line. The length
;                  of this line may exceed the maximum ToolTip width.
; Related .......: _GUIToolTip_SetMaxTipWidth
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_GetMaxTipWidth($hWnd)
	Return _SendMessage($hWnd, $TTM_GETMAXTIPWIDTH)
EndFunc   ;==>_GUIToolTip_GetMaxTipWidth

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_GetText
; Description ...: Retrieves the text
; Syntax.........: _GUIToolTip_GetText($hWnd, $hTool, $iID)
; Parameters ....: $hWnd        - Handle to control
;                  $hTool       - Handle to the window that contains the tool
;                  $iID         - Identifier of the tool
; Return values .: Success      - ToolTip text
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _GUIToolTip_UpdateTipText
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_GetText($hWnd, $hTool, $iID)
	Local $iToolInfo, $pToolInfo, $tToolInfo, $pBuffer, $tBuffer, $pMemory, $tMemMap, $pText

;~ 	If @AutoItUnicode Then
	$tBuffer = DllStructCreate("wchar Text[4096]")
;~ 	Else
;~ 		$tBuffer = DllStructCreate("char Text[4096]")
;~ 	EndIf
	$pBuffer = DllStructGetPtr($tBuffer)
	$tToolInfo = DllStructCreate($tagTOOLINFO)
	$pToolInfo = DllStructGetPtr($tToolInfo)
	$iToolInfo = DllStructGetSize($tToolInfo)
	DllStructSetData($tToolInfo, "Size", $iToolInfo)
	DllStructSetData($tToolInfo, "hWnd", $hTool)
	DllStructSetData($tToolInfo, "ID", $iID)
	If _WinAPI_InProcess($hWnd, $_TT_ghTTLastWnd) Then
		DllStructSetData($tToolInfo, "Text", $pBuffer)
;~ 		If @AutoItUnicode Then
		_SendMessage($hWnd, $TTM_GETTEXTW, 0, $pToolInfo, 0, "wparam", "ptr")
;~ 		Else
;~ 			_SendMessage($hWnd, $TTM_GETTEXT, 0, $pToolInfo, 0, "wparam", "ptr")
;~ 		EndIf
	Else
		$pMemory = _MemInit($hWnd, $iToolInfo + 4096, $tMemMap)
		$pText = $pMemory + $iToolInfo
		DllStructSetData($tToolInfo, "Text", $pText)
		_MemWrite($tMemMap, $pToolInfo, $pMemory, $iToolInfo)
;~ 		If @AutoItUnicode Then
		_SendMessage($hWnd, $TTM_GETTEXTW, 0, $pMemory, 0, "wparam", "ptr")
;~ 		Else
;~ 			_SendMessage($hWnd, $TTM_GETTEXT, 0, $pMemory, 0, "wparam", "ptr")
;~ 		EndIf
		_MemRead($tMemMap, $pText, $pBuffer, 81)
		_MemFree($tMemMap)
	EndIf
	Return DllStructGetData($tBuffer, "Text")
EndFunc   ;==>_GUIToolTip_GetText

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_GetTipBkColor
; Description ...: Retrieves the background color
; Syntax.........: _GUIToolTip_GetTipBkColor($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - The background color
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _GUIToolTip_SetTipBkColor
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_GetTipBkColor($hWnd)
	Return _SendMessage($hWnd, $TTM_GETTIPBKCOLOR)
EndFunc   ;==>_GUIToolTip_GetTipBkColor

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_GetTipTextColor
; Description ...: Retrieves the text color
; Syntax.........: _GUIToolTip_GetTipTextColor($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - The text color
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _GUIToolTip_SetTipTextColor
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_GetTipTextColor($hWnd)
	Return _SendMessage($hWnd, $TTM_GETTIPTEXTCOLOR)
EndFunc   ;==>_GUIToolTip_GetTipTextColor

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_GetTitleBitMap
; Description ...: Retrieves the title bitmap icon
; Syntax.........: _GUIToolTip_GetTitleBitMap($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - Handle to the ToolTip icon
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: Only available on Windows XP
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_GetTitleBitMap($hWnd)
	Local $pBuffer, $tBuffer, $iTitle, $pTitle, $tTitle, $pMemory, $tMemMap, $pText

	$tBuffer = DllStructCreate("char Text[4096]")
	$pBuffer = DllStructGetPtr($tBuffer)
	$tTitle = DllStructCreate($tagTTGETTITLE)
	$pTitle = DllStructGetPtr($tTitle)
	$iTitle = DllStructGetSize($tTitle)
	DllStructSetData($tTitle, "Size", $iTitle)
	If _WinAPI_InProcess($hWnd, $_TT_ghTTLastWnd) Then
		DllStructSetData($tTitle, "Title", $pBuffer)
		_SendMessage($hWnd, $TTM_GETTITLE, 0, $pTitle, 0, "wparam", "ptr")
	Else
		$pMemory = _MemInit($hWnd, $iTitle + 4096, $tMemMap)
		$pText = $pMemory + $iTitle
		DllStructSetData($tTitle, "Title", $pText)
		_MemWrite($tMemMap, $pTitle, $pMemory, $iTitle)
		_SendMessage($hWnd, $TTM_GETTITLE, 0, $pMemory, 0, "wparam", "ptr")
		_MemRead($tMemMap, $pText, $pBuffer, 4096)
		_MemFree($tMemMap)
	EndIf
	Return DllStructGetData($tTitle, "Bitmap")
EndFunc   ;==>_GUIToolTip_GetTitleBitMap

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_GetTitleText
; Description ...: Retrieve the title
; Syntax.........: _GUIToolTip_GetTitleText($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - ToolTip title
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: Only available on Windows XP
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_GetTitleText($hWnd)
	Local $pBuffer, $tBuffer, $iTitle, $pTitle, $tTitle, $pMemory, $tMemMap, $pText

	$tBuffer = DllStructCreate("char Text[4096]")
	$pBuffer = DllStructGetPtr($tBuffer)
	$tTitle = DllStructCreate($tagTTGETTITLE)
	$pTitle = DllStructGetPtr($tTitle)
	$iTitle = DllStructGetSize($tTitle)
	DllStructSetData($tTitle, "Size", $iTitle)
	If _WinAPI_InProcess($hWnd, $_TT_ghTTLastWnd) Then
		DllStructSetData($tTitle, "Title", $pBuffer)
		_SendMessage($hWnd, $TTM_GETTITLE, 0, $pTitle, 0, "wparam", "ptr")
	Else
		$pMemory = _MemInit($hWnd, $iTitle + 4096, $tMemMap)
		$pText = $pMemory + $iTitle
		DllStructSetData($tTitle, "Title", $pText)
		_MemWrite($tMemMap, $pTitle, $pMemory, $iTitle)
		_SendMessage($hWnd, $TTM_GETTITLE, 0, $pMemory, 0, "wparam", "ptr")
		_MemRead($tMemMap, $pText, $pBuffer, 4096)
		_MemFree($tMemMap)
	EndIf
	Return DllStructGetData($tBuffer, "Text")
EndFunc   ;==>_GUIToolTip_GetTitleText

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_GetToolCount
; Description ...: Retrieves the tool count
; Syntax.........: _GUIToolTip_GetToolCount($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: Success      - Count of tools maintained by the ToolTip
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_GetToolCount($hWnd)
	Return _SendMessage($hWnd, $TTM_GETTOOLCOUNT)
EndFunc   ;==>_GUIToolTip_GetToolCount

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_GetToolInfo
; Description ...: Retrieves the information about a specific tool
; Syntax.........: _GUIToolTip_GetToolInfo($hWnd, $hTool, $iID)
; Parameters ....: $hWnd        - Handle to control
;                  $hTool       - Handle to the window that contains the tool
;                  $iID         - Identifier of the tool
; Return values .: Success      - Array with the following format:
;                  |[1] - Flags that control the ToolTip display:
;                  |   1 - Indicates that $iID is the window handle to the tool instead of the ID
;                  |   2 - Centers the window below the tool specified by $iID
;                  |   4 - Indicates that text will be displayed in the opposite direction
;                  |   8 - Indicates that the control should subclass the tool's  window to intercept messages
;                  |  16 - Positions the control next to the tool to which it corresponds
;                  |  32 - Positions the window at the same coordinates provided by TTM_TRACKPOSITION
;                  |  64 - Causes the control to forward mouse messages to the parent window
;                  | 128 - Indicates that links in the control text should be parsed
;                  |[2] - Handle to the window that contains the tool
;                  |[3] - Identifier of the tool
;                  |[4] - X coordinate of the upper left corner of the rectangle
;                  |[5] - Y coordinate of the upper left corner of the rectangle
;                  |[6] - X coordinate of the lower right corner of the rectangle
;                  |[7] - Y coordinate of the lower right corner of the rectangle
;                  |[8] - Handle to the instance that contains the string resource for the tool
;                  |[9] - Application-defined value associated with the tool
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _GUIToolTip_SetToolInfo
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_GetToolInfo($hWnd, $hTool, $iID)
	Local $iToolInfo, $pToolInfo, $tToolInfo, $pMemory, $tMemMap, $fResult

	$tToolInfo = DllStructCreate($tagTOOLINFO)
	$pToolInfo = DllStructGetPtr($tToolInfo)
	$iToolInfo = DllStructGetSize($tToolInfo)
	DllStructSetData($tToolInfo, "Size", $iToolInfo)
	DllStructSetData($tToolInfo, "hWnd", $hTool)
	DllStructSetData($tToolInfo, "ID", $iID)
	If _WinAPI_InProcess($hWnd, $_TT_ghTTLastWnd) Then
;~ 		If @AutoItUnicode Then
		$fResult = _SendMessage($hWnd, $TTM_GETTOOLINFOW, 0, $pToolInfo, 0, "wparam", "ptr")
;~ 		Else
;~ 			$fResult = _SendMessage($hWnd, $TTM_GETTOOLINFO, 0, $pToolInfo, 0, "wparam", "ptr")
;~ 		EndIf
	Else
		$pMemory = _MemInit($hWnd, $iToolInfo, $tMemMap)
		_MemWrite($tMemMap, $pToolInfo, $pMemory, $iToolInfo)
;~ 		If @AutoItUnicode Then
		$fResult = _SendMessage($hWnd, $TTM_GETTOOLINFOW, 0, $pMemory, 0, "wparam", "ptr")
;~ 		Else
;~ 			$fResult = _SendMessage($hWnd, $TTM_GETTOOLINFO, 0, $pMemory, 0, "wparam", "ptr")
;~ 		EndIf
		_MemRead($tMemMap, $pMemory, $pToolInfo, $iToolInfo)
		_MemFree($tMemMap)
	EndIf
	Return _GUIToolTip_ToolToArray($hWnd, $tToolInfo, $fResult = True)
EndFunc   ;==>_GUIToolTip_GetToolInfo

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_HitTest
; Description ...: Retrieves the information that a ToolTip control maintains about a tool
; Syntax.........: _GUIToolTip_HitTest($hWnd, $hTool, $iX, $iY)
; Parameters ....: $hWnd        - Handle to control
;                  $hTool       - Handle to the window that contains the tool
;                  $iX          - X position to test
;                  $iY          - Y position to test
; Return values .: Success      - Array with the following format:
;                  |[1] - Flags that control the ToolTip display:
;                  |   1 - Indicates that $iID is the window handle to the tool instead of the ID
;                  |   2 - Centers the window below the tool specified by $iID
;                  |   4 - Indicates that text will be displayed in the opposite direction
;                  |   8 - Indicates that the control should subclass the tool's  window to intercept messages
;                  |  16 - Positions the control next to the tool to which it corresponds
;                  |  32 - Positions the window at the same coordinates provided by TTM_TRACKPOSITION
;                  |  64 - Causes the control to forward mouse messages to the parent window
;                  | 128 - Indicates that links in the control text should be parsed
;                  |[2] - Handle to the window that contains the tool
;                  |[3] - Identifier of the tool
;                  |[4] - X coordinate of the upper left corner of the rectangle
;                  |[5] - Y coordinate of the upper left corner of the rectangle
;                  |[6] - X coordinate of the lower right corner of the rectangle
;                  |[7] - Y coordinate of the lower right corner of the rectangle
;                  |[8] - Handle to the instance that contains the string resource for the tool
;                  |[9] - Application-defined value associated with the tool
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: This message must be sent when the tool has the $TTF_TRACK flag set.  $TTM_HITTEST will fail if $TTF_TRACK  is
;                  not set, regardless if the hit point is in the tools rectangle or not.
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_HitTest($hWnd, $hTool, $iX, $iY)
	Local $iToolInfo, $tToolInfo, $iHitTest, $pHitTest, $tHitTest, $pMemory, $tMemMap, $fResult

	$tHitTest = DllStructCreate($tagTTHITTESTINFO)
	$pHitTest = DllStructGetPtr($tHitTest)
	$tToolInfo = DllStructCreate($tagTOOLINFO)
	$iToolInfo = DllStructGetSize($tToolInfo)
	DllStructSetData($tHitTest, "Tool", $hTool)
	DllStructSetData($tHitTest, "X", $iX)
	DllStructSetData($tHitTest, "Y", $iY)
	DllStructSetData($tHitTest, "Size", $iToolInfo)
	If _WinAPI_InProcess($hWnd, $_TT_ghTTLastWnd) Then
;~ 		If @AutoItUnicode Then
		$fResult = _SendMessage($hWnd, $TTM_HITTESTW, 0, $pHitTest, 0, "wparam", "ptr")
;~ 		Else
;~ 			$fResult = _SendMessage($hWnd, $TTM_HITTEST, 0, $pHitTest, 0, "wparam", "ptr")
;~ 		EndIf
	Else
		$iHitTest = DllStructGetSize($tHitTest)
		$pMemory = _MemInit($hWnd, $iHitTest, $tMemMap)
		_MemWrite($tMemMap, $pHitTest, $pMemory, $iHitTest)
;~ 		If @AutoItUnicode Then
		$fResult = _SendMessage($hWnd, $TTM_HITTESTW, 0, $pMemory, 0, "wparam", "ptr")
;~ 		Else
;~ 			$fResult = _SendMessage($hWnd, $TTM_HITTEST, 0, $pMemory, 0, "wparam", "ptr")
;~ 		EndIf
		_MemRead($tMemMap, $pMemory, $pHitTest, $iHitTest)
		_MemFree($tMemMap)
	EndIf
	DllStructSetData($tToolInfo, "Size", $tHitTest.Size)
	DllStructSetData($tToolInfo, "Flags", $tHitTest.Flags)
	DllStructSetData($tToolInfo, "hWnd", $tHitTest.hWnd)
	DllStructSetData($tToolInfo, "ID", $tHitTest.ID)
	DllStructSetData($tToolInfo, "Left", $tHitTest.Left)
	DllStructSetData($tToolInfo, "Top", $tHitTest.Top)
	DllStructSetData($tToolInfo, "Right", $tHitTest.Right)
	DllStructSetData($tToolInfo, "Bottom", $tHitTest.Bottom)
	DllStructSetData($tToolInfo, "hInst", $tHitTest.hInst)
	DllStructSetData($tToolInfo, "Param", $tHitTest.Param)
	Return _GUIToolTip_ToolToArray($hWnd, $tToolInfo, $fResult = True)
EndFunc   ;==>_GUIToolTip_HitTest

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_NewToolRect
; Description ...: Sets a new bounding rectangle for a tool
; Syntax.........: _GUIToolTip_NewToolRect($hWnd, $hTool, $iID, $iLeft, $iTop, $iRight, $iBottom)
; Parameters ....: $hWnd        - Handle to control
;                  $hTool       - Handle to the window that contains the tool
;                  $iID         - Application-defined identifier of the tool
;                  $iLeft       - X coordinate of the upper left corner of the rectangle
;                  $iTop        - Y coordinate of the upper left corner of the rectangle
;                  $iRight      - X coordinate of the lower right corner of the rectangle
;                  $iBottom     - Y coordinate of the lower right corner of the rectangle
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_NewToolRect($hWnd, $hTool, $iID, $iLeft, $iTop, $iRight, $iBottom)
	Local $iToolInfo, $pToolInfo, $tToolInfo, $pMemory, $tMemMap

	$tToolInfo = DllStructCreate($tagTOOLINFO)
	$pToolInfo = DllStructGetPtr($tToolInfo)
	$iToolInfo = DllStructGetSize($tToolInfo)
	DllStructSetData($tToolInfo, "Size", $iToolInfo)
	DllStructSetData($tToolInfo, "hwnd", $hTool)
	DllStructSetData($tToolInfo, "ID", $iID)
	DllStructSetData($tToolInfo, "Left", $iLeft)
	DllStructSetData($tToolInfo, "Top", $iTop)
	DllStructSetData($tToolInfo, "Right", $iRight)
	DllStructSetData($tToolInfo, "Bottom", $iBottom)
	If _WinAPI_InProcess($hWnd, $_TT_ghTTLastWnd) Then
;~ 		If @AutoItUnicode Then
		_SendMessage($hWnd, $TTM_NEWTOOLRECTW, 0, $pToolInfo, 0, "wparam", "ptr")
;~ 		Else
;~ 			_SendMessage($hWnd, $TTM_NEWTOOLRECT, 0, $pToolInfo, 0, "wparam", "ptr")
;~ 		EndIf
	Else
		$pMemory = _MemInit($hWnd, $iToolInfo, $tMemMap)
		_MemWrite($tMemMap, $pToolInfo)
;~ 		If @AutoItUnicode Then
		_SendMessage($hWnd, $TTM_NEWTOOLRECTW, 0, $pMemory, 0, "wparam", "ptr")
;~ 		Else
;~ 			_SendMessage($hWnd, $TTM_NEWTOOLRECT, 0, $pMemory, 0, "wparam", "ptr")
;~ 		EndIf
		_MemFree($tMemMap)
	EndIf
EndFunc   ;==>_GUIToolTip_NewToolRect

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_Pop
; Description ...: Removes a displayed ToolTip from view
; Syntax.........: _GUIToolTip_Pop($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_Pop($hWnd)
	_SendMessage($hWnd, $TTM_POP)
EndFunc   ;==>_GUIToolTip_Pop

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_PopUp
; Description ...: Causes the ToolTip to display at the coordinates of the last mouse message
; Syntax.........: _GUIToolTip_PopUp($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: Only available on Windows XP
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_PopUp($hWnd)
	_SendMessage($hWnd, $TTM_POPUP)
EndFunc   ;==>_GUIToolTip_PopUp

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_SetDelayTime
; Description ...: Sets the initial, pop-up, and reshow durations
; Syntax.........: _GUIToolTip_SetDelayTime($hWnd, $iDuration, $iTime)
; Parameters ....: $hWnd        - Handle to control
;                  $iDuration   - Flag that specifies which duration value will be retrieved:
;                  |0 - Set all three delay times to default settings
;                  |1 - Time it takes for subsequent ToolTip windows to appear as the pointer moves from one tool to another
;                  |2 - Time the ToolTip window remains visible if the pointer is stationary within a tool's bounding rectangle
;                  |3 - Time the pointer must remain stationary within a tool's bounding rectangle before the window appears
;                  $iTime       - Delay time in milliseconds
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: The default delay times are based on the double-click time. For the default double-click time of 500  ms,  the
;                  initial, autopop, and reshow delay times are 500ms, 5000ms, and 100ms respectively.
; Related .......: _GUIToolTip_GetDelayTime
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_SetDelayTime($hWnd, $iDuration, $iTime)
	_SendMessage($hWnd, $TTM_SETDELAYTIME, $iDuration, $iTime)
EndFunc   ;==>_GUIToolTip_SetDelayTime

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_SetMargin
; Description ...: Sets the top, left, bottom, and right margins
; Syntax.........: _GUIToolTip_SetMargin($hWnd, $iLeft, $iTop, $iRight, $iBottom)
; Parameters ....: $hWnd        - Handle to control
;                  $iLeft       - Distance between left border and left end of text, in pixels
;                  $iTop        - Distance between top border and top of text, in pixels
;                  $iRight      - Distance between right border and right end of text, in pixels
;                  $iBottom     - Distance between bottom border and bottom of text, in pixels
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _GUIToolTip_GetMargin
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_SetMargin($hWnd, $iLeft, $iTop, $iRight, $iBottom)
	Local $iRect, $pRect, $tRect, $pMemory, $tMemMap

	$tRect = DllStructCreate($tagRECT)
	$pRect = DllStructGetPtr($tRect)
	DllStructSetData($tRect, "Left", $iLeft)
	DllStructSetData($tRect, "Top", $iTop)
	DllStructSetData($tRect, "Right", $iRight)
	DllStructSetData($tRect, "Bottom", $iBottom)
	If _WinAPI_InProcess($hWnd, $_TT_ghTTLastWnd) Then
		_SendMessage($hWnd, $TTM_SETMARGIN, 0, $pRect, 0, "wparam", "ptr")
	Else
		$iRect = DllStructGetSize($tRect)
		$pMemory = _MemInit($hWnd, $iRect, $tMemMap)
		_MemWrite($tMemMap, $pRect)
		_SendMessage($hWnd, $TTM_SETMARGIN, 0, $pMemory, 0, "wparam", "ptr")
		_MemFree($tMemMap)
	EndIf
EndFunc   ;==>_GUIToolTip_SetMargin

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_SetMaxTipWidth
; Description ...: Sets the maximum width for a ToolTip window
; Syntax.........: _GUIToolTip_SetMaxTipWidth($hWnd, $iWidth)
; Parameters ....: $hWnd        - Handle to control
;                  $iWidth      - Maximum ToolTip window width to be set
; Return values .: Success      - The previous maximum ToolTip width
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: The maximum ToolTip width value does not indicate a ToolTip window's actual width. Rather, if a ToolTip string
;                  exceeds the maximum width, the control breaks the text into multiple lines, using  spaces  to  determine  line
;                  breaks. If the text cannot be segmented into multiple lines, it will be displayed on a single line. The length
;                  of this line may exceed the maximum ToolTip width.
; Related .......: _GUIToolTip_GetMaxTipWidth
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_SetMaxTipWidth($hWnd, $iWidth)
	Return _SendMessage($hWnd, $TTM_SETMAXTIPWIDTH, 0, $iWidth)
EndFunc   ;==>_GUIToolTip_SetMaxTipWidth

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_SetTipBkColor
; Description ...: Sets the background color
; Syntax.........: _GUIToolTip_SetTipBkColor($hWnd, $iColor)
; Parameters ....: $hWnd        - Handle to control
;                  $iColor      - New background color
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _GUIToolTip_GetTipBkColor
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_SetTipBkColor($hWnd, $iColor)
	_SendMessage($hWnd, $TTM_SETTIPBKCOLOR, $iColor)
EndFunc   ;==>_GUIToolTip_SetTipBkColor

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_SetTipTextColor
; Description ...: Sets the text color
; Syntax.........: _GUIToolTip_SetTipTextColor($hWnd, $iColor)
; Parameters ....: $hWnd        - Handle to control
;                  $iColor      - New text color
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _GUIToolTip_GetTipTextColor
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_SetTipTextColor($hWnd, $iColor)
	_SendMessage($hWnd, $TTM_SETTIPTEXTCOLOR, $iColor)
EndFunc   ;==>_GUIToolTip_SetTipTextColor

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_SetTitle
; Description ...: Adds a standard icon and title string
; Syntax.........: _GUIToolTip_SetTitle($hWnd, $sTitle[, $iIcon = 0])
; Parameters ....: $hWnd        - Handle to control
;                  $sTitle      - Title string
;                  $iIcon       - Set to one of the values below:.
;                  |0 - No icon
;                  |1 - Information icon
;                  |2 - Warning icon
;                  |3 - Error Icon
; Return values .: Success      - True
;                  Failure      - False
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: As of Windows XP SP2 and later, $iIcon can contain an HICON value.  Any value greater than 3 is assumed to  be
;                  an HICON.
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_SetTitle($hWnd, $sTitle, $iIcon = 0)
	Local $iBuffer, $pBuffer, $tBuffer, $pMemory, $tMemMap, $iResult

	$iBuffer = StringLen($sTitle) + 1
;~ 	If @AutoItUnicode Then
	$iBuffer *= 2
	$tBuffer = DllStructCreate("wchar Text[" & $iBuffer & "]")
;~ 	Else
;~ 		$tBuffer = DllStructCreate("char Text[" & $iBuffer & "]")
;~ 	EndIf
	$pBuffer = DllStructGetPtr($tBuffer)
	DllStructSetData($tBuffer, "Text", $sTitle)
	If _WinAPI_InProcess($hWnd, $_TT_ghTTLastWnd) Then
;~ 		If @AutoItUnicode Then
		$iResult = _SendMessage($hWnd, $TTM_SETTITLEW, $iIcon, $pBuffer, 0, "wparam", "ptr")
;~ 		Else
;~ 			$iResult = _SendMessage($hWnd, $TTM_SETTITLE, $iIcon, $pBuffer, 0, "wparam", "ptr")
;~ 		EndIf
	Else
		$pMemory = _MemInit($hWnd, $iBuffer, $tMemMap)
		_MemWrite($tMemMap, $pBuffer)
;~ 		If @AutoItUnicode Then
		$iResult = _SendMessage($hWnd, $TTM_SETTITLEW, $iIcon, $pMemory, 0, "wparam", "ptr")
;~ 		Else
;~ 			$iResult = _SendMessage($hWnd, $TTM_SETTITLE, $iIcon, $pMemory, 0, "wparam", "ptr")
;~ 		EndIf
		_MemFree($tMemMap)
	EndIf
	Return $iResult <> 0
EndFunc   ;==>_GUIToolTip_SetTitle

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_SetToolInfo
; Description ...: Sets the information for a tool
; Syntax.........: _GUIToolTip_SetToolInfo($hWnd, $sText[, $iID = 0[, $iLeft = 0[, $iTop = 0[, $iRight = 0[, $iBottom = 0[, $iFlags = 8[, $iParam = 0]]]]]]])
; Parameters ....: $hWnd        - Handle to the window that contains the tool
;                  $sText       - Text for the ToolTip control
;                  $iID         - Identifier or window handle of the tool
;                  $iLeft       - X coordinate of the upper left corner of the rectangle
;                  $iTop        - Y coordinate of the upper left corner of the rectangle
;                  $iRight      - X coordinate of the lower right corner of the rectangle
;                  $iBottom     - Y coordinate of the lower right corner of the rectangle
;                  $iFlags      - Flags that control the ToolTip display:
;                  |  1 - Indicates that $iID is the window handle to the tool instead of the ID
;                  |  2 - Centers the window below the tool specified by $iID
;                  |  4 - Indicates that text will be displayed in the opposite direction
;                  |  8 - Indicates that the control should subclass the tool's  window to intercept messages
;                  | 16 - Positions the control next to the tool to which it corresponds
;                  | 32 - Positions the window at the same coordinates provided by TTM_TRACKPOSITION
;                  | 64 - Causes the control to forward mouse messages to the parent window
;                  |128 - Indicates that links in the control text should be parsed
;                  $iParam       - Application-defined value that is associated with the tool
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: Some internal properties of a tool are established when the tool is created, and are  not  recomputed  when  a
;                  $TTM_SETTOOLINFO message is sent.  If you simply assign valuesto a TOOLINFO  structure  and  pass  it  to  the
;                  ToolTip control with a $TTM_SETTOOLINFO message, these properties may be lost. Instead your application should
;                  first request the tool's current TOOLINFO structure by sending a $TTM_GETTOOLINFO message.  Then,  modify  the
;                  members of this structure as needed and pass it back  to  the  ToolTip  control  with  $TTM_SETTOOLINFO.  When
;                  calling $TTM_SETTOOLINFO, the string pointed to by the Text member of the TOOLINFO structure must  not  exceed
;                  80 characters in length.
; Related .......: _GUIToolTip_GetToolInfo
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_SetToolInfo($hWnd, $sText, $iID = 0, $iLeft = 0, $iTop = 0, $iRight = 0, $iBottom = 0, $iFlags = 8, $iParam = 0)
	Local $pBuffer, $tBuffer, $iToolInfo, $tToolInfo, $pToolInfo, $pMemory, $tMemMap, $pText

;~ 	If @AutoItUnicode Then
	$tBuffer = DllStructCreate("wchar Text[4096]")
;~ 	Else
;~ 		$tBuffer = DllStructCreate("char Text[4096]")
;~ 	EndIf
	$pBuffer = DllStructGetPtr($tBuffer)
	$tToolInfo = DllStructCreate($tagTOOLINFO)
	$pToolInfo = DllStructGetPtr($tToolInfo)
	$iToolInfo = DllStructGetSize($tToolInfo)
	DllStructSetData($tBuffer, "Text", $sText)
	DllStructSetData($tToolInfo, "Size", $iToolInfo)
	DllStructSetData($tToolInfo, "Flags", _GUIToolTip_BitsToTTF($iFlags))
	DllStructSetData($tToolInfo, "hWnd", $hWnd)
	DllStructSetData($tToolInfo, "ID", $iID)
	DllStructSetData($tToolInfo, "Left", $iLeft)
	DllStructSetData($tToolInfo, "Top", $iTop)
	DllStructSetData($tToolInfo, "Right", $iRight)
	DllStructSetData($tToolInfo, "Bottom", $iBottom)
	DllStructSetData($tToolInfo, "Param", $iParam)
	If _WinAPI_InProcess($hWnd, $_TT_ghTTLastWnd) Then
		DllStructSetData($tToolInfo, "Text", $pBuffer)
;~ 		If @AutoItUnicode Then
		_SendMessage($hWnd, $TTM_SETTOOLINFOW, 0, $pToolInfo, 0, "wparam", "ptr")
;~ 		Else
;~ 			_SendMessage($hWnd, $TTM_SETTOOLINFO, 0, $pToolInfo, 0, "wparam", "ptr")
;~ 		EndIf
	Else
		$pMemory = _MemInit($hWnd, $iToolInfo + 4096, $tMemMap)
		$pText = $pMemory + $iToolInfo
		DllStructSetData($tToolInfo, "Text", $pText)
		_MemWrite($tMemMap, $pToolInfo, $pMemory, $iToolInfo)
		_MemWrite($tMemMap, $pText, $pBuffer, 4096)
;~ 		If @AutoItUnicode Then
		_SendMessage($hWnd, $TTM_SETTOOLINFOW, 0, $pMemory, 0, "wparam", "ptr")
;~ 		Else
;~ 			_SendMessage($hWnd, $TTM_SETTOOLINFO, 0, $pMemory, 0, "wparam", "ptr")
;~ 		EndIf
		_MemFree($tMemMap)
	EndIf
EndFunc   ;==>_GUIToolTip_SetToolInfo

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_SetWindowTheme
; Description ...: Sets the visual style
; Syntax.........: _GUIToolTip_SetWindowTheme($hWnd, $sStyle)
; Parameters ....: $hWnd        - Handle to control
;                  $sStyle      - String that contains the ToolTip visual style to set
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_SetWindowTheme($hWnd, $sStyle)
	Local $pBuffer, $tBuffer, $pMemory, $tMemMap

	$tBuffer = _WinAPI_MultiByteToWideChar($sStyle)
	$pBuffer = DllStructGetPtr($tBuffer)
	If _WinAPI_InProcess($hWnd, $_TT_ghTTLastWnd) Then
		_SendMessage($hWnd, $TTM_SETWINDOWTHEME, 0, $pBuffer, 0, "wparam", "ptr")
	Else
		$pMemory = _MemInit($hWnd, 4096, $tMemMap)
		_MemWrite($tMemMap, $pBuffer)
		_SendMessage($hWnd, $TTM_SETWINDOWTHEME, 0, $pMemory, 0, "wparam", "ptr")
		_MemFree($tMemMap)
	EndIf
EndFunc   ;==>_GUIToolTip_SetWindowTheme

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_ToolExists
; Description ...: Determines whether a current tool exists
; Syntax.........: _GUIToolTip_ToolExists($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .: True         - Tool exists
;                  False        - Tool does not exist
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_ToolExists($hWnd)
	Return _SendMessage($hWnd, $TTM_GETCURRENTTOOL) <> 0
EndFunc   ;==>_GUIToolTip_ToolExists

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_ToolToArray
; Description ...: Transfers a ToolInfo structure to an array
; Syntax.........: _GUIToolTip_ToolToArray($hWnd, ByRef $tToolInfo, $iError)
; Parameters ....: $hWnd        - Handle to control
;                  $tToolInfo   - $tagTOOLINFO structure
;                  $iError      - Error code to be returned
; Return values .: Success      - Array with the following format:
;                  |[0] - Flags that control the ToolTip display:
;                  |   1 - Indicates that $iID is the window handle to the tool instead of the ID
;                  |   2 - Centers the window below the tool specified by $iID
;                  |   4 - Indicates that text will be displayed in the opposite direction
;                  |   8 - Indicates that the control should subclass the tool's  window to intercept messages
;                  |  16 - Positions the control next to the tool to which it corresponds
;                  |  32 - Positions the window at the same coordinates provided by TTM_TRACKPOSITION
;                  |  64 - Causes the control to forward mouse messages to the parent window
;                  | 128 - Indicates that links in the control text should be parsed
;                  |[1] - Handle to the window that contains the tool
;                  |[2] - Identifier of the tool
;                  |[3] - X coordinate of the upper left corner of the rectangle
;                  |[4] - Y coordinate of the upper left corner of the rectangle
;                  |[5] - X coordinate of the lower right corner of the rectangle
;                  |[6] - Y coordinate of the lower right corner of the rectangle
;                  |[7] - Handle to the instance that contains the string resource for the tool
;                  |[8] - Text for the tool
;                  |[9] - Application-defined value associated with the tool
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_ToolToArray($hWnd, ByRef $tToolInfo, $iError)
	Local $aTool[10]

	$aTool[0] = _GUIToolTip_TTFToBits(DllStructGetData($tToolInfo, "Flags"))
	$aTool[1] = DllStructGetData($tToolInfo, "hWnd")
	$aTool[2] = DllStructGetData($tToolInfo, "ID")
	$aTool[3] = DllStructGetData($tToolInfo, "Left")
	$aTool[4] = DllStructGetData($tToolInfo, "Top")
	$aTool[5] = DllStructGetData($tToolInfo, "Right")
	$aTool[6] = DllStructGetData($tToolInfo, "Bottom")
	$aTool[7] = DllStructGetData($tToolInfo, "hInst")
	$aTool[8] = _GUIToolTip_GetText($hWnd, $aTool[1], $aTool[2])
	$aTool[9] = DllStructGetData($tToolInfo, "Param")
	Return SetError($iError, 0, $aTool)
EndFunc   ;==>_GUIToolTip_ToolToArray

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_TrackActivate
; Description ...: Activates or deactivates a tracking ToolTip
; Syntax.........: _GUIToolTip_TrackActivate($hWnd[, $fActivate = True[, $hTool = 0[, $iID = 0]]])
; Parameters ....: $hWnd        - Handle to control
;                  $fActivate   - True to activate, False to deactivate
;                  $hTool       - Handle to the window that contains the tool
;                  $iID         - Application-defined identifier of the tool
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_TrackActivate($hWnd, $fActivate = True, $hTool = 0, $iID = 0)
	Local $iToolInfo, $tToolInfo, $pToolInfo, $pMemory, $tMemMap

	$tToolInfo = DllStructCreate($tagTOOLINFO)
	$pToolInfo = DllStructGetPtr($tToolInfo)
	DllStructSetData($tToolInfo, "Size", $iToolInfo)
	DllStructSetData($tToolInfo, "hWnd", $hTool)
	DllStructSetData($tToolInfo, "ID", $iID)
	If _WinAPI_InProcess($hWnd, $_TT_ghTTLastWnd) Then
		_SendMessage($hWnd, $TTM_TRACKACTIVATE, $fActivate, $pToolInfo, 0, "wparam", "ptr")
	Else
		$iToolInfo = DllStructGetSize($tToolInfo)
		$pMemory = _MemInit($hWnd, $iToolInfo, $tMemMap)
		_MemWrite($tMemMap, $pToolInfo)
		_SendMessage($hWnd, $TTM_TRACKACTIVATE, $fActivate, $pMemory, 0, "wparam", "ptr")
		_MemFree($tMemMap)
	EndIf
EndFunc   ;==>_GUIToolTip_TrackActivate

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_TrackPosition
; Description ...: Sets the position of a tracking ToolTip
; Syntax.........: _GUIToolTip_TrackPosition($hWnd, $iX, $iY)
; Parameters ....: $hWnd        - Handle to control
;                  $iX          - X position in screen coordinates
;                  $iY          - Y position in screen coordinates
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......: The ToolTip chooses where to display the window based on the coordinates you provide with this  message.  This
;                  causes the ToolTip window to appear beside the tool to which it corresponds. To have ToolTip windows displayed
;                  at specific coordinates, include the $TTF_ABSOLUTE flag in the $iFlags member of the TOOLINFO  structure  when
;                  adding the tool.
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_TrackPosition($hWnd, $iX, $iY)
	_SendMessage($hWnd, $TTM_TRACKPOSITION, 0, _WinAPI_MakeLong($iX, $iY))
EndFunc   ;==>_GUIToolTip_TrackPosition

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_TTFToBits
; Description ...: Decode $TTF_flags to user bit flags
; Syntax.........: _GUIToolTip_TTFToBits($iFlags)
; Parameters ....: $iFlags      - $TTF_ flags
; Return values .: Success      - User bit flags
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _GUIToolTip_BitsToTTF
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_TTFToBits($iFlags)
	Local $iN = 0

	If BitAND($iFlags, $TTF_IDISHWND) <> 0 Then $iN = BitOR($iN, 1)
	If BitAND($iFlags, $TTF_CENTERTIP) <> 0 Then $iN = BitOR($iN, 2)
	If BitAND($iFlags, $TTF_RTLREADING) <> 0 Then $iN = BitOR($iN, 4)
	If BitAND($iFlags, $TTF_SUBCLASS) <> 0 Then $iN = BitOR($iN, 8)
	If BitAND($iFlags, $TTF_TRACK) <> 0 Then $iN = BitOR($iN, 16)
	If BitAND($iFlags, $TTF_ABSOLUTE) <> 0 Then $iN = BitOR($iN, 32)
	If BitAND($iFlags, $TTF_TRANSPARENT) <> 0 Then $iN = BitOR($iN, 64)
	If BitAND($iFlags, $TTF_PARSELINKS) <> 0 Then $iN = BitOR($iN, 128)
	Return $iN
EndFunc   ;==>_GUIToolTip_TTFToBits

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_Update
; Description ...: Forces the current tool to be redrawn
; Syntax.........: _GUIToolTip_Update($hWnd)
; Parameters ....: $hWnd        - Handle to control
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_Update($hWnd)
	_SendMessage($hWnd, $TTM_UPDATE)
EndFunc   ;==>_GUIToolTip_Update

; #FUNCTION# ====================================================================================================================
; Name...........: _GUIToolTip_UpdateTipText
; Description ...: Sets the ToolTip text for a tool
; Syntax.........: _GUIToolTip_UpdateTipText($hWnd, $hTool, $iID, $sText)
; Parameters ....: $hWnd        - Handle to control
;                  $hTool       - Handle to the window that contains the tool
;                  $iID         - Application-defined identifier of the tool
;                  $sText       - Text to display in tooltip
; Return values .:
; Author ........: Paul Campbell (PaulIA)
; Modified.......:
; Remarks .......:
; Related .......: _GUIToolTip_GetText
; Link ..........:
; Example .......:
; ===============================================================================================================================
Func _GUIToolTip_UpdateTipText($hWnd, $hTool, $iID, $sText)
	Local $iBuffer, $pBuffer, $tBuffer, $pToolInfo, $tToolInfo, $iToolInfo, $pMemory, $tMemMap, $pText

	$iBuffer = StringLen($sText) + 1
;~ 	If @AutoItUnicode Then
	$iBuffer *= 2
	$tBuffer = DllStructCreate("wchar Text[" & $iBuffer & "]")
;~ 	Else
;~ 		$tBuffer = DllStructCreate("char Text[" & $iBuffer & "]")
;~ 	EndIf
	$pBuffer = DllStructGetPtr($tBuffer)
	$tToolInfo = DllStructCreate($tagTOOLINFO)
	$pToolInfo = DllStructGetPtr($tToolInfo)
	$iToolInfo = DllStructGetSize($tToolInfo)
	DllStructSetData($tBuffer, "Text", $sText)
	DllStructSetData($tToolInfo, "Size", $iToolInfo)
	DllStructSetData($tToolInfo, "hWnd", $hTool)
	DllStructSetData($tToolInfo, "ID", $iID)
	If _WinAPI_InProcess($hWnd, $_TT_ghTTLastWnd) Then
		DllStructSetData($tToolInfo, "Text", $pBuffer)
;~ 		If @AutoItUnicode Then
		_SendMessage($hWnd, $TTM_UPDATETIPTEXTW, 0, $pToolInfo, 0, "wparam", "ptr")
;~ 		Else
;~ 			_SendMessage($hWnd, $TTM_UPDATETIPTEXT, 0, $pToolInfo, 0, "wparam", "ptr")
;~ 		EndIf
	Else
		$pMemory = _MemInit($hWnd, $iToolInfo + $iBuffer, $tMemMap)
		$pText = $pMemory + $iToolInfo
		DllStructSetData($tToolInfo, "Text", $pText)
		_MemWrite($tMemMap, $pToolInfo, $pMemory, $iToolInfo)
		_MemWrite($tMemMap, $pBuffer, $pText, $iBuffer)
;~ 		If @AutoItUnicode Then
		_SendMessage($hWnd, $TTM_UPDATETIPTEXTW, 0, $pMemory, 0, "wparam", "ptr")
;~ 		Else
;~ 			_SendMessage($hWnd, $TTM_UPDATETIPTEXT, 0, $pMemory, 0, "wparam", "ptr")
;~ 		EndIf
		_MemFree($tMemMap)
	EndIf
EndFunc   ;==>_GUIToolTip_UpdateTipText

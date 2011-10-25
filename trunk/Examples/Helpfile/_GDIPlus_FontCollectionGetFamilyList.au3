#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>
#Include <WindowsConstants.au3>

Opt(" MustDeclareVars ", 1)

Global $iARGBBackground, $hGraphics, $aFontFamilies

_Example()

Func _Example()
	Local $hGUI, $hFontCollection

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_FontCollection* Example ", 400, 200)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; ��������ϵͳ֧�ֵ������InstalledFontCollection����
	$hFontCollection = _GDIPlus_FontCollectionCreate()

	; ��ȡȫ��������
	$aFontFamilies = _GDIPlus_FontCollectionGetFamilyList($hFontCollection)

	; ��ȡ���ͶԻ���ı���ɫ
	$iARGBBackground = BitOR(0xFF000000, $_WinAPI_GetSysColor($COLOR_BTNFACE)

	; ÿ2��ʹ���������������ַ���
	_PrintFonts()
	AdlibRegister(" _PrintFonts ", 2000)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	AdlibUnRegister()

	; ���
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example

Func _PrintFonts()
	Local $iI, $iIndex, $iMaxIndex, $hFontFamily, $iIndex
	If IsArray($aFontFamilies) Then
		$iMaxIndex = $aFontFamilies[0]
		_GDIPlus_GraphicsClear($hGraphics, $iARGBBackground)

		For $iI = 1 To 3
			$iIndex = Random(1, $iMaxIndex, 1)

			; �����弯�����ȡһ�����������
			$hFontFamily = $aFontFamilies[$iIndex]
			; ��ȡ����������
			$sFamilyName = _GDIPlus_FontFamilyGetFamilyName($hFontFamily)
			; �Ը���������Ϊ�����������������
			_GDIPlus_GraphicsDrawString($hGraphics, $sFamilyName, 20, $iI * 40, $sFamilyName, 15)
		Next
	EndIf
endfunc   ;==>_PrintFonts


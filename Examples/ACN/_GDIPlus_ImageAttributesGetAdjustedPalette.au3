#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hBrush, $hIA, $tColorPalette, $pColorPalette, $aRemap[2][2], $iI

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_ImageAttributesGetAdjustedPalette Example ", 450, 200)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; ���������ĸ�ֵ�ĵ�ɫ��
	$tColorPalette = DllStructCreate(" uint Flags;uint Count;uint Entries[4] ")
	$pColorPalette = DllStructGetPtr($tColorPalette)

	DllStructSetData($tColorPalette, "Flags ", 0)
	DllStructSetData($tColorPalette, "Count ", 4)
	DllStructSetData($tColorPalette, "Entries ", 0xFF00FFFF, 1) ; ˮɫ
	DllStructSetData($tColorPalette, "Entries ", 0xFF000000, 2) ; ��ɫ
	DllStructSetData($tColorPalette, "Entries ", 0xFFFF0000, 3) ; ��ɫ
	DllStructSetData($tColorPalette, "Entries ", 0xFF00FF00, 4) ; ��ɫ

	; ������ˢ�����Ƶľ���
	$hBrush = _GDIPlus_BrushCreateSolid()

	; ��ʾ�ĸ�δ�����ĵ�ɫ��
	For $iI = 1 To 4
		_GDIPlus_BrushSetSolidColor($hBrush, DllStructGetData($tColorPalette, "Entries ", $iI))
		_GDIPlus_GraphicsFillRect($hGraphics, $iI * 30, 10, 20, 20, $hBrush)
	Next

	; ��������ɫתΪ��ɫ����ӳ���
	$aRemap[0][0] = 1
	$aRemap[1][0] = 0xFF00FF00 ; ��ɫΪ��ȥ����ɫ
	$aRemap[1][1] = 0xFF0000FF ; ��ɫΪ����ɫ

	; ����ImageAttribute�����������λͼ��ӳ���
	$hIA = _GDIPlus_ImageAttributesCreate()
	_GDIPlus_ImageAttributesSetRemapTable($hIA, 1, True, $aRemap)
	; ������ɫ��
	_GDIPlus_ImageAttributesGetAdjustedPalette($hIA, $pColorPalette, 1)

	; ��ʾ�ĸ�������ĵ�ɫ��
	For $iI = 1 To 4
		_GDIPlus_BrushSetSolidColor($hBrush, DllStructGetData($tColorPalette, "Entries ", $iI))
		_GDIPlus_GraphicsFillRect($hGraphics, $iI * 30, 40, 20, 20, $hBrush)
	Next

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_BrushDispose($hBrush)
	_GDIPlus_ImageAttributesDispose($hIA)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


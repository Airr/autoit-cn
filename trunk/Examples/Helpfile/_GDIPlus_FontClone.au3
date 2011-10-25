#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hFontFamily, $hFont, $hFontCloned, $hBrush, $tLayout

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_FontClone Example ", 400, 320)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; ��������
	$hFontFamily = _GDIPlus_FontFamilyCreate(" Arial ")
	$hFont = _GDIPlus_FontCreate($hFontFamily, 24)

	; �������帱��
	$hFontCloned = _GDIPlus_FontClone($hFont)

	; ����ʵɫˢ
	$hBrush = _GDIPlus_BrushCreateSolid()

	; �����ַ���
	$tLayout = _GDIPlus_RectFCreate(30, 30)
	_GDIPlus_GraphicsDrawStringEx($hGraphics, "This is a cloned Font ", $hFontCloned, $tLayout, 0, $hBrush)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_BrushDispose($hBrush)
	_GDIPlus_FontFamilyDispose($hFontFamily)
	_GDIPlus_FontDispose($hFontCloned)
	_GDIPlus_FontDispose($hFont)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


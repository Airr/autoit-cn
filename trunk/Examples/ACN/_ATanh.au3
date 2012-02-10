#include <Math.au3>
#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>

Opt('MustDeclareVars', 1)

_Main()

Func _Main()
	Local $hGUI, $hWnd, $hGraphic, $hBrush, $hAsymPen, $hFormat, $hFamily, $hFont, $tLayout, $hPen
	Local $aPoint[400][2], $j = 1

	; ��������
	$hGUI = GUICreate("Inverse Hyperbolic Tangent", 400, 300)
	$hWnd = WinGetHandle("Inverse Hyperbolic Tangent")
	GUISetState()

	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hWnd)
	$hBrush = _GDIPlus_BrushCreateSolid(0xFF000000)
	$hFormat = _GDIPlus_StringFormatCreate()
	$hFamily = _GDIPlus_FontFamilyCreate("Arial")
	$hFont = _GDIPlus_FontCreate($hFamily, 8, 2)
	$tLayout = _GDIPlus_RectFCreate(200, 150, 50, 20)
	_GDIPlus_GraphicsDrawStringEx($hGraphic, 'O(0,0)', $hFont, $tLayout, $hFormat, $hBrush)
	$tLayout = _GDIPlus_RectFCreate(20, 20, 200, 20)
	_GDIPlus_GraphicsDrawStringEx($hGraphic, 'Inverse Hyperbolic Tangent', $hFont, $tLayout, $hFormat, $hBrush)
	$tLayout = _GDIPlus_RectFCreate(100, 150, 50, 20)
	_GDIPlus_GraphicsDrawStringEx($hGraphic, '-1', $hFont, $tLayout, $hFormat, $hBrush)
	$tLayout = _GDIPlus_RectFCreate(300, 150, 50, 20)
	_GDIPlus_GraphicsDrawStringEx($hGraphic, '1', $hFont, $tLayout, $hFormat, $hBrush)
	$hPen = _GDIPlus_PenCreate()
	_GDIPlus_GraphicsDrawLine($hGraphic, 0, 150, 400, 150, $hPen)
	_GDIPlus_GraphicsDrawLine($hGraphic, 200, 0, 200, 300, $hPen)
	$hAsymPen = _GDIPlus_PenCreate()
	_GDIPlus_PenSetDashStyle($hAsymPen, $GDIP_DASHSTYLEDASH)
	_GDIPlus_GraphicsDrawLine($hGraphic, 100, 0, 100, 300, $hAsymPen)
	_GDIPlus_GraphicsDrawLine($hGraphic, 300, 0, 300, 300, $hAsymPen)

	$aPoint[0][0] = 399
	For $i = -2 To 2 Step 0.01
		If Not (Abs($i) = 2) Then
			$aPoint[$j][0] = $i * 50 + 200
			$aPoint[$j][1] = 150 - _ATanh($i / 2) * 50
			$j += 1
		EndIf
	Next
	_GDIPlus_GraphicsDrawCurve($hGraphic, $aPoint)
	
	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; �����Դ
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_PenDispose($hAsymPen)
	_GDIPlus_FontDispose($hFont)
	_GDIPlus_FontFamilyDispose($hFamily)
	_GDIPlus_StringFormatDispose($hFormat)
	_GDIPlus_BrushDispose($hBrush)
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()

EndFunc   ;==>_Main

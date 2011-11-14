#include <Math.au3>
#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>

Opt('MustDeclareVars', 1)

_Main()

Func _Main()
	Local $hGUI, $hWnd, $hGraphic, $hBrush, $tLayout1, $hFormat, $hFamily, $hFont, $tLayout, $hPen
	Local $aPoint[802][2], $m = 1, $hDashPen

	; ��������
	$hGUI = GUICreate("Hyperbolic Tangent", 400, 300)
	$hWnd = WinGetHandle("Hyperbolic Tangent")
	GUISetState()

	; �����ַ���
	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hWnd)
	$hBrush = _GDIPlus_BrushCreateSolid(0xFF000000)
	$hFormat = _GDIPlus_StringFormatCreate()
	$hFamily = _GDIPlus_FontFamilyCreate("Arial")
	$hFont = _GDIPlus_FontCreate($hFamily, 8, 2)
	$tLayout = _GDIPlus_RectFCreate(200, 150, 50, 20)
	_GDIPlus_GraphicsDrawStringEx($hGraphic, 'O(0, 0)', $hFont, $tLayout, $hFormat, $hBrush)
	$tLayout = _GDIPlus_RectFCreate(20, 20, 200, 20)
	_GDIPlus_GraphicsDrawStringEx($hGraphic, 'Hyperbolic Tangent', $hFont, $tLayout, $hFormat, $hBrush)
	$tLayout = _GDIPlus_RectFCreate(200, 100, 200, 20)
	_GDIPlus_GraphicsDrawStringEx($hGraphic, '1', $hFont, $tLayout, $hFormat, $hBrush)
	$tLayout = _GDIPlus_RectFCreate(200, 200, 200, 20)
	_GDIPlus_GraphicsDrawStringEx($hGraphic, '-1', $hFont, $tLayout, $hFormat, $hBrush)
	$hPen = _GDIPlus_PenCreate()
	_GDIPlus_GraphicsDrawLine($hGraphic, 0, 150, 400, 150, $hPen)
	_GDIPlus_GraphicsDrawLine($hGraphic, 200, 0, 200, 300, $hPen)
	$hDashPen = _GDIPlus_PenCreate()
	_GDIPlus_PenSetDashStyle($hDashPen, $GDIP_DASHSTYLEDOT)
	_GDIPlus_GraphicsDrawLine($hGraphic, 0, 98, 400, 98, $hDashPen)
	_GDIPlus_GraphicsDrawLine($hGraphic, 0, 201, 400, 201, $hDashPen)

    $aPoint[0][0] = 801
	For $i = -4 To 4 Step 0.01
		$aPoint[$m][0] = $i * 50 + 200
		$aPoint[$m][1] = 150 - _Tanh($i) * 50
		$m += 1
	Next
	_GDIPlus_GraphicsDrawCurve($hGraphic, $aPoint)

	; ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; �����Դ
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_FontDispose($hFont)
	_GDIPlus_FontFamilyDispose($hFamily)
	_GDIPlus_StringFormatDispose($hFormat)
	_GDIPlus_BrushDispose($hBrush)
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()

EndFunc   ;==>_Main

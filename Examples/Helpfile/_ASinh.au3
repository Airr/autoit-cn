#Include <Math.au3>
#include <GuiConstantsEx.au3>
#include <GDIPlus.au3>

Opt('MustDeclareVars', 1)

_Main()

Func _Main()
  Local $hGUI, $hWnd, $hGraphic, $hBrush, $tLayout, $hFormat, $hFamily, $hFont, $hAsymPen, $hPen
  Local $aPoint[802][2], $j = 1, $m = 1

  ; ��������
  $hGUI = GUICreate("Inverse Hyperbolic Sine", 400, 300)
  $hWnd = WinGetHandle("Inverse Hyperbolic Sine")
  GUISetState()

  _GDIPlus_Startup()
  $hGraphic = _GDIPlus_GraphicsCreateFromHWND($hWnd)
  $hBrush = _GDIPlus_BrushCreateSolid(0xFF000000)
  $hFormat = _GDIPlus_StringFormatCreate()
  $hFamily = _GDIPlus_FontFamilyCreate("Arial")
  $hFont = _GDIPlus_FontCreate($hFamily, 8, 2)
  $tLayout = _GDIPlus_RectFCreate(200, 150, 100, 20)
  _GDIPlus_GraphicsDrawStringEx($hGraphic, 'O(0, 0)', $hFont, $tLayout, $hFormat, $hBrush)
  $tLayout = _GDIPlus_RectFCreate(20, 20, 200, 1000)
  _GDIPlus_GraphicsDrawStringEx($hGraphic, 'Inverse Hyperbolic Sine', $hFont, $tLayout, $hFormat, $hBrush)
  $hPen = _GDIPlus_PenCreate()
  _GDIPlus_GraphicsDrawLine($hGraphic, 0, 150, 400, 150, $hPen)
  _GDIPlus_GraphicsDrawLine($hGraphic, 200, 0, 200, 300, $hPen)

  $aPoint[0][0] = 801
  For $i = -4 To 4 Step 0.01
    $aPoint[$j][0] = $i * 50 + 200
    $aPoint[$j][1] = 150 - _ASinh($i) * 50
    $j += 1
  Next
  _GDIPlus_GraphicsDrawCurve($hGraphic, $aPoint)

  ; ѭ�����û��˳�
  Do
  Until GUIGetMsg() = $GUI_EVENT_CLOSE

  ; �����Դ
  _GDIPlus_PenDispose($hAsymPen)
  _GDIPlus_PenDispose($hPen)
  _GDIPlus_FontDispose($hFont)
  _GDIPlus_FontFamilyDispose($hFamily)
  _GDIPlus_StringFormatDispose($hFormat)
  _GDIPlus_BrushDispose($hBrush)
  _GDIPlus_GraphicsDispose($hGraphic)
  _GDIPlus_Shutdown()

EndFunc   ;==>_Main
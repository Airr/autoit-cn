#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hPen, $aPoints[11][2], $iI

	; 初始化GDI+
	_GDIPlus_Startup()

	$hGUI = GUICreate(" _GDIPlus_GraphicsDrawBeziers Example ", 400, 350)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; 使用反锯齿
	_GDIPlus_GraphicsSetSmoothingMode($hGraphics, $SmoothingModeAntiAlias)
	; 创建一些随机点
	$aPoints[0][0] = 10

	For $iI = 0 To 10
		$aPoints[$iI][0] = Random(0, 350, 1)
		$aPoints[$iI][1] = Random(0, 300, 1)
	Next

	; 创建画笔对象
	$hPen = _GDIPlus_PenCreate($GDIP_MAROON, 8)

	; 绘制贝塞尔曲线
	_GDIPlus_GraphicsDrawBeziers($hGraphics, $aPoints, $hPen)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; 清除
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_GraphicsDispose($hGraphics)

	; 关闭GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


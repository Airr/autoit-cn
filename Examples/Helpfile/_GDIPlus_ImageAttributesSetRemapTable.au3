#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>

Opt(" MustDeclareVars ", 1)

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hRedBrush, $hGreenBrush, $hBlueBrush, $hBitmap, $hBitmapContext, $hIA $iI, $iJ, $aRemapTable[4][2]

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	; ����GUI����, ��ESC�˳�
	$hGUI = GUICreate("", 420, 350)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; ����Bitmap���󲢻�ȡ��ͼ�γ���
	$hBitmap = _GDIPlus_BitmapCreateFromScan0(200, 200)
	$hBitmapContext = _GDIPlus_ImageGetGraphicsContext($hBitmap)

	; ����������������ɫ��������ˢ
	$hRedBrush = _GDIPlus_BrushCreateSolid(0xFFFF0000) ; ��ɫ
	$hGreenBrush = _GDIPlus_BrushCreateSolid(0xFF00FF00) ; ��ɫ
	$hBlueBrush = _GDIPlus_BrushCreateSolid(0xFF0000FF) ; ��ɫ

	For $iI = 0 To 9
		For $iJ = 0 To 9
			Switch Random(1, 3, 1)
				Case 1
					_GDIPlus_GraphicsFillRect($hBitmapContext, $iI * 20, $iJ * 20, 20, 20, $hRedBrush)
				Case 2
					_GDIPlus_GraphicsFillRect($hBitmapContext, $iI * 20, $iJ * 20, 20, 20, $hGreenBrush)
				Case Else
					_GDIPlus_GraphicsFillRect($hBitmapContext, $iI * 20, $iJ * 20, 20, 20, $hBlueBrush)
			EndSwitch
		Next
	Next

	; ���ı����ͼ��
	_GDIPlus_GraphicsDrawImage($hGraphics, $hBitmap, 0, 0)

	; �������ڵ���ͼ����ɫ��ImageAttributes����
	$hIA = _GDIPlus_ImageAttributesCreate()
	; �����滻ͼ����ɫ����ӳ���
	$aRemapTable[0][0] = 3 ; 3��ֵ

	; ����ɫ�滻��ɫ
	$aRemapTable[1][0] = 0xFFFF0000
	$aRemapTable[1][1] = 0xFF00FFFF
	; ����ɫ�滻��ɫ
	$aRemapTable[2][0] = 0xFF00FF00
	$aRemapTable[2][1] = 0xFF0000FF
	; �û�ɫ�滻��ɫ
	$aRemapTable[3][0] = 0xFF0000FF
	$aRemapTable[3][1] = 0xFFFFFF00

	_GDIPlus_ImageAttributesSetRemapTable($hIA, 1, True, $aRemapTable)

	; Ӧ��ImageAttributes��ɫ�����ǻ���ͼ��
	_GDIPlus_GraphicsDrawImageRectRectIA($hGraphics, $hBitmap, 0, 0, 200, 200, 220, 0, 200, 200, $hIA)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_ImageAttributesDispose($hIA)
	_GDIPlus_BrushDispose($hBlueBrush)
	_GDIPlus_BrushDispose($hGreenBrush)
	_GDIPlus_BrushDispose($hRedBrush)
	_GDIPlus_GraphicsDispose($hBitmapContext)
	_GDIPlus_BitmapDispose($hBitmap)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example


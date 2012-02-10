#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>
#Include <ScreenCapture.au3>

Opt(" MustDeclareVars ", 1)

Global Const $sFileName = @MyDocumentsDir & " \SampleMeta.emf "

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hMetafile, $tColorMatrix, $hIA, $pColorMatrix

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	; ����GUI����, ��ESC�˳�
	$hGUI = GUICreate(" _GDIPlus_ImageAttributesSetNoOp Example ", 600, 350)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)
	_CreateTestMetafile($hGraphics)

	; ��������ʾ��Ԫ�ļ���Metafile���󲢿�ʼ���ż�¼
	$hMetafile = _GDIPlus_MetafileCreateFromFile($sFileName)
	; �������ڵ���ͼ����ɫ��ImageAttributes����
	$hIA = _GDIPlus_ImageAttributesCreate()

	; ��������ɫתΪ��ɫ����ɫ����
	$tColorMatrix = _ColorMatrixCreateRedToGreen()
	$pColorMatrix = DllStructGetPtr($tColorMatrix)

	; ����ImageAttributes��ɫ���� , applies color adjustment to pens and brushes
	_GDIPlus_ImageAttributesSetColorMatrix($hIA, 2, True, $pColorMatrix)
	_GDIPlus_ImageAttributesSetColorMatrix($hIA, 3, True, $pColorMatrix)

	; ���öԻ��ʵ���ɫ��������ˢ����
	_GDIPlus_ImageAttributesSetNoOp($hIA, 2, False) ; ��
	_GDIPlus_ImageAttributesSetNoOp($hIA, 3, True) ; �ر�

	_GDIPlus_GraphicsDrawImageRectRectIA($hGraphics, $hMetafile, 0, 0, 200, 350, 0, 0, 200, 350, $hIA)

	; ���öԻ�ˢ����ɫ���������ʿ���
	_GDIPlus_ImageAttributesSetNoOp($hIA, 2, True) ; �ر�
	_GDIPlus_ImageAttributesSetNoOp($hIA, 3, False) ; ��
	_GDIPlus_GraphicsDrawImageRectRectIA($hGraphics, $hMetafile, 0, 0, 200, 350, 200, 0, 200, 350, $hIA)

	; ���û�ˢ����ɫ���������öԻ��ʵ���ɫ����
	_GDIPlus_ImageAttributesSetNoOp($hIA, 2, False) ; ��
	_GDIPlus_ImageAttributesSetNoOp($hIA, 3, True) ; �ر�

	_GDIPlus_GraphicsDrawImageRectRectIA($hGraphics, $hMetafile, 0, 0, 200, 350, 400, 0, 200, 350, $hIA)

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	_GDIPlus_ImageAttributesDispose($hIA)
	_GDIPlus_ImageDispose($hMetafile)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ͷ�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example

; �ú�������������ʾ��Ԫ�ļ�
Func _CreateTestMetafile($hGraphics)
	Local $hDC, $hMetafile, $hRedBrush, $hRedPen, $hImageContext

	; ��ȡ��������Ԫ�ļ���ͼ���豸����
	$hDC = _GDIPlus_GraphicsGetDC($hGraphics)

	; �������Լ�¼��Metafile����
	$hMetafile = _GDIPlus_MetafileRecordFileName($sFileName, $hDC)

	; ��ȡͼ��ͼ�γ�����ά��Ԫ�ļ��Ļ���
	$hImageContext = _GDIPlus_ImageGetGraphicsContext($hMetafile)

	; ��¼���ĺ�ɫ����
	$hRedBrush = _GDIPlus_BrushCreateSolid(0xFFFF0000) ; Red
	_GDIPlus_GraphicsFillRect($hImageContext, 0, 0, 200, 175, $hRedBrush)

	; ��¼ʹ�ú�ɫ�ʻ�����Բ����
	$hRedPen = _GDIPlus_PenCreate(0xFFFF0000, 5)
	_GDIPlus_GraphicsDrawEllipse($hImageContext, 0, 175, 200, 175, $hRedPen)

	; �ͷ��豸����
	_GDIPlus_GraphicsReleaseDC($hGraphics, $hDC)

	; ����Ԫ�ļ�
	_GDIPlus_GraphicsDispose($hImageContext) ; ����ͼ�񵫽�������

	; ���
	_GDIPlus_PenDispose($hRedPen)
	_GDIPlus_BrushDispose($hRedBrush)
	_GDIPlus_ImageDispose($hMetafile)
endfunc   ;==>_CreateTestMetafile

; �ú�����������ɫת��Ϊ��ɫ��ColorMatrix�ṹ
Func _ColorMatrixCreateRedToGreen()
	Local $tColorMatrix

	$tColorMatrix = _GDIPlus_ColorMatrixCreate()
	DllStructSetData($tColorMatrix, "m ", 0, 1) ; ��ɫ��ֵ���������Ϊ0(��)
	DllStructSetData($tColorMatrix, "m ", 1, 2) ; ��ɫͨ������ɫ��ֵ���������Ϊ1(��ɫ��Ϊ��ɫ)

	Return $tColorMatrix
endfunc   ;==>_ColorMatrixCreateRedToGreen


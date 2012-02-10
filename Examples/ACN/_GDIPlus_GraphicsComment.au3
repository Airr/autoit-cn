#Include <GDIPlusEx.au3>
#Include <GUIConstantsEx.au3>

Opt(" MustDeclareVars ", 1)

Global $sText

_Example()

Func _Example()
	Local $hGUI, $hGraphics, $hDC, $hBrush, $hImageGraphics, $hMetafile, $pData, $tData, $iData, $sFileName, $hCallback, $pCallback

	; ��ʼ��GDI+
	_GDIPlus_Startup()

	$sFileName = @MyDocumentsDir & " \SampleMeta.emf "

	$hGUI = GUICreate(" _GDIPlus_GraphicsBeginContainer Example ", 400, 350)
	GUISetState()

	$hGraphics = _GDIPlus_GraphicsCreateFromHWND($hGUI)

	; ��ȡ����������Ԫ�ļ���ͼ�λ���
	$hDC = _GDIPlus_GraphicsGetDC($hGraphics)

	; �������ڼ�¼��Ԫ�ļ�(Metafile)����
	$hMetafile = _GDIPlus_MetafileRecordFileName($sFileName, $hDC)

	; ��ȡͼ���ͼ�λ��������Ƶ�Ԫ�ļ���
	$hImageGraphics = _GDIPlus_ImageGetGraphicsContext($hMetafile)

	; ��¼��͸������ɫ����
	$hBrush = _GDIPlus_BrushCreateSolid(0x8000FF00) ; Semi-transparent green
	_GDIPlus_GraphicsFillRect($hImageGraphics, 0, 0, 200, 200, $hBrush)

	; ������ע����
	$tData = DllStructCreate("char[9]")
	$pData = DllStructGetPtr($tData)
	$iData = 9
	DllStructSetData($tData, 1, "AutoIt v3 ")

	; ��Ԫ�ļ������ע
	_GDIPlus_GraphicsComment($hImageGraphics, $pData, $iData)

	; ͨ�����һ����Բ����Ӷ�����ע��¼��һ����
	_GDIPlus_BrushSetFillColor($hBrush, 0x80FF00FF)
	_GDIPlus_GraphicsFillEllipse($hImageGraphics, 200, 0, 150, 200, $hBrush)
	; Change the comment
	DllStructSetData($tData, 1, "Commented ")
	_GDIPlus_GraphicsComment($hImageGraphics, $pData, $iData)

	; �ͷ��豸����
	_GDIPlus_GraphicsReleaseDC($hGraphics, $hDC)

	; ����Ԫ�ļ�
	_GDIPlus_GraphicsDispose($hImageGraphics) ; Image persisted and exclusive lock is unlocked
	_GDIPlus_ImageDispose($hMetafile)

	; ����ö�ٻص������Ե���Ԫ�ļ��е�ÿ����¼
	$hCallback = DllCallbackRegister(" _MetafileEnum ", "int ", "int;uint;uint;ptr;ptr ")
	$pCallback = DllCallbackGetPtr($hCallback)

	; ��ʾ��Ԫ�ļ�����Metafile���󲢿�ʼ��¼
	$hMetafile = _GDIPlus_MetafileCreateFromFile($sFileName)

	; ��ʼö��Ԫ�ļ���¼
	_GDIPlus_MetafileEnumerateDestPoint($hGraphics, $hMetafile, 0, 0, $pCallback, $hMetafile)

	; ������ע
	_GDIPlus_GraphicsDrawString($hGraphics, $sText, 20, 20)
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; ���
	DllCallbackFree($pCallback)
	_GDIPlus_ImageDispose($hMetafile)
	_GDIPlus_BrushDispose($hBrush)
	_GDIPlus_GraphicsDispose($hGraphics)

	; �ر�GDI+
	_GDIPlus_Shutdown()
endfunc   ;==>_Example

; $iRecordType - Ԥ����ļ�¼����(��Բ, ����, ��ע��..)
; $iFlags	  - ָ����¼���Եı�Ǽ�
; $iDataSize   - ��¼���ݵ��ֽ���
; $pRecordData - ������¼���ݵĻ�����
; $pUserData   - ��ǰ���ݸ�Դ�ļ�ö�ٺ������û����������

; ���ؼ�ʱ���˳�ö��, ��ʱִ��.
Func _MetafileEnum($iRecordType, $iFlags, $iDataSize, $pRecordData, $pUserData)
	Local $tText

	; ֻ������Բ
	Switch $iRecordType
		; ������Բ��ע��
		Case $GDIP_EMFPLUSRECORDTYPEFILLELLIPSE
			_GDIPlus_MetafilePlayRecord($pUserData, $iRecordType, $iFlags, $iDataSize, $pRecordData)

		Case $GDIP_EMFPLUSRECORDTYPECOMMENT
			$tText = DllStructCreate(" char[" & $iDataSize & " ] ", $pRecordData)
			$sText &= DllStructGetData($tText, 1) & @CRLF
	EndSwitch

	; ����ö��
	Return True
endfunc   ;==>_MetafileEnum


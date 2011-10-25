
#AutoIt3Wrapper_au3check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w
6
#include  <GuiEdit.au3>
#include  <GuiStatusBar.au3>
#include  <GuiConstantsEx.au3>
#include  <WindowsConstants.au3>

Opt('MustDeclareVars', 1)

$Debug_Ed = False ; ��鴫�ݸ�����������, ����Ϊ�沢ʹ����һ�ؼ��ľ���۲��乤��

_Main()

Func _Main()
	Local $StatusBar, $hEdit, $hGUI
	Local $sFile = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\AutoIt v3\AutoIt", "InstallDir") & "\include\changelog.txt"
	Local $aPartRightSide[3] = [190, 378, -1], $aSel

	; ����
	����
	$hGUI = GUICreate("Edit Get Sel", 400, 300)

	$hEdit = GUICtrlCreateEdit("", 2, 2, 394, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	$StatusBar = _GUICtrlStatusBar_Create($hGUI, $aPartRightSide)

	_GUICtrlStatusBar_SetIcon($StatusBar, 2, 97, "shell32.dll")
	GUISetState()

	;
	���ñ߾�
	_GUICtrlEdit_SetMargins($hEdit, BitOR($EC_LEFTMARGIN, $EC_RIGHTMARGIN), 10, 10)

	; �����ı�
	_GUICtrlEdit_SetText($hEdit, FileRead($sFile))


	; ����ѡ��
	_GUICtrlEdit_SetSel($hEdit, 15, 20)

	; ��ȡѡ��
	$aSel = _GUICtrlEdit_GetSel($hEdit)
	_GUICtrlStatusBar_SetText($StatusBar, "Start:" & $aSel[0])
	_GUICtrlStatusBar_SetText($StatusBar, "End:" & $aSel[1], 1)


	;
	ѭ�����û��˳�
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
endfunc   ;==>_Main


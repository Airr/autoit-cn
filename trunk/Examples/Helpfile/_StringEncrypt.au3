#include <GuiConstantsEx.au3>
#include <String.au3>

Opt(" MustDeclareVars ", 1)

_Main()

Func _Main()
	Local $WinMain, $EditText, $InputPass, $InputLevel, $UpDownLevel, $EncryptButton, $DecryptButton, $string
	; ������ַ���
	$WinMain = GUICreate('Encryption tool ', 400, 400)
	; ��������
	$EditText = GUICtrlCreateEdit('', 5, 5, 380, 350)
	; �������༭�ؼ�
	$InputPass = GUICtrlCreateInput('', 5, 360, 100, 20, 0x21)
	; ʹ��ģ��/���еı༭�򴴽�������
	$InputLevel = GUICtrlCreateInput(1, 110, 360, 50, 20, 0x2001)
	$UpDownLevel = GUICtrlSetLimit( GUICtrlCreateUpdown($InputLevel), 10, 1)
	; ������ͨ��ʹ������ȷ�����ܵȼ�
	$EncryptButton = GUICtrlCreateButton('Encrypt ', 170, 360, 105, 35)
	; ���ܰ�ť
	$DecryptButton = GUICtrlCreateButton('Decrypt ', 285, 360, 105, 35)
	; ���ܰ�ť
	GUICtrlCreateLabel('Password ', 5, 385)
	GUICtrlCreateLabel('Level ', 110, 385)
	; ���ı���ǩ�Ա���ȷ
	GUISetState()
	; ��ʾ����

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $EncryptButton
				GUISetState(@SW_DISABLE, $WinMain) ; ֹͣ���иı�
				$string = GUICtrlRead($EditText) ; �Ժ󱣴�༭��
				GUICtrlSetData($EditText, 'Please wait while the text is Encrypted/Decrypted.') ; �Ѻ���Ϣ
				GUICtrlSetData($EditText, _StringEncrypt(1, $string, GUICtrlRead($InputPass), GUICtrlRead($InputLevel)))
				; ���ü���. �Լ��ܵ��ַ������ñ༭�������
				; ������1/0��ʼ������֪����/����
				; ���Ժ󱣴��ڱ༭����ַ�������
				; Ȼ���ȡ�����͵ȼ���
				GUISetState(@SW_ENABLE, $WinMain) ; ʹ���巵��
			Case $DecryptButton
				GUISetState(@SW_DISABLE, $WinMain) ; ֹͣ���иı�
				$string = GUICtrlRead($EditText) ; �Ժ󱣴�༭��
				GUICtrlSetData($EditText, 'Please wait while the text is Encrypted/Decrypted.') ; �Ѻ���Ϣ
				GUICtrlSetData($EditText, _StringEncrypt(0, $string, GUICtrlRead($InputPass), GUICtrlRead($InputLevel)))
				; ���ü���. �Լ��ܵ��ַ������ñ༭�������
				; ������1/0��ʼ������֪����/����
				; ���Ժ󱣴��ڱ༭����ַ�������
				; Ȼ���ȡ�����͵ȼ���
				GUISetState(@SW_ENABLE, $WinMain) ; ʹ���巵��
		EndSwitch
	WEnd ; ����ѭ��ֱ�����ڹر�
	Exit
endfunc   ;==>_Main


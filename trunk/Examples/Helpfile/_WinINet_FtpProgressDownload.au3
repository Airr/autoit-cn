Func _UpdateProgress($Percentage)
	ProgressSet($percent, $percent & "%")
	If _IsPressed("77") Then Return 0 ; F8�˳�
	Return 1 ; ��1��ʼ
endfunc   ;==>_UpdateProgress

Func _UpdateProgress($Percentage)
	GUICtrlSetData($ProgressBarCtrl, $percent)
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			Return -1 ; _FTP_DownloadProgress��-1�˳�, �����Ժ���˳�Ӧ��
		Case $Btn_Cancel
			Return 0 ;��ȡ��, ��ָ������ֵ
	EndSwitch
	Return 1 ; �����������
endfunc   ;==>_UpdateProgress




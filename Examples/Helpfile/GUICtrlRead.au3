#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $menu1, $n1, $n2, $msg, $menustate, $menutext

	GUICreate("My GUICtrlRead") ; ����һ��������ʾ�� GUI ����

	$menu1 = GUICtrlCreateMenu("File")

	$n1 = GUICtrlCreateList("", 10, 10, -1, 100)
	GUICtrlSetData(-1, "item1|item2|item3", "item2")

	$n2 = GUICtrlCreateButton("��ȡ", 10, 110, 50)
	GUICtrlSetState(-1, $GUI_FOCUS) ; �����ť���ص�

	GUISetState() ; ��ʾһ���հ׵Ĵ���
	; ���н��棬ֱ�����ڱ��ر�
	Do
		$msg = GUIGetMsg()
		If $msg = $n2 Then
			MsgBox(0, "��ȡѡ�е���Ŀ", GUICtrlRead($n1)) ; ��ȡѡ�е���Ŀ
			$menustate = GUICtrlRead($menu1) ; ��ȡָ���ؼ���״̬���������.
			$menutext = GUICtrlRead($menu1, 1) ; ��ȡָ���ؼ�����չ��Ϣ.
			MsgBox(0, "��ȡ�˵���״̬���ı�", "״̬:" & $menustate & @LF & "�ı�:" & $menutext)
		EndIf
	Until $msg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
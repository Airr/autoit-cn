$hwnd=ControlGetHandle('Program Manager','','SysListView321')
ControlListView($hwnd, "", "SysListView321", "SelectAll")
ControlListView($hwnd, "", "SysListView321", "Deselect", 2, 5)
;�õ���һ����Ŀ���ı�
MsgBox(0, "", ControlListView($hwnd, "", "", "GetText", 0, 0))
;������ѶQQ
MsgBox(0, "", ControlListView($hwnd, "", "", "FindItem", "��ѶQQ", 1))
MsgBox(0, "", ControlListView($hwnd, "", "", "GetSelected", 1))

MsgBox(0,0,'��ע�⿴����ͼ��')
;�����б���Ŀ����
$GetItemCount=ControlListView('Program Manager','','SysListView321','GetItemCount')
MsgBox(0,'�����б�����Ŀ������',$GetItemCount)

;����ָ���ַ���
$FindItem=ControlListView('Program Manager','','SysListView321','FindItem','Internet Explorer')
MsgBox(0,'�����ַ���','Internet Explorer  λ��:'&$FindItem)


;�л���ǰ����ͼ
ControlListView('Program Manager','','SysListView321','ViewChange','details')
Sleep(1000)
ControlListView('Program Manager','','SysListView321','ViewChange','smallicons')
;ѡ�����м�����Ŀ
$Select=ControlListView('Program Manager','','SysListView321','Select',1,3)
WinActivate('Program Manager') ;�������Ԥ��Ч��
Sleep(1000)
;����ѡ����Ŀ��λ��
$GetSelected=ControlListView('Program Manager','','SysListView321','GetSelected',1)
If $GetSelected<>'' Then MsgBox(0,'��ǰѡ����Ŀ��λ��',$GetSelected)
;��������Ŀ������
$GetSubItemCount=ControlListView('Program Manager','','SysListView321','GetSubItemCount')
MsgBox(0,'��������Ŀ������',$GetSubItemCount)
;����ָ����Ŀ/����Ŀ���ı�
$GetText=ControlListView('Program Manager','','SysListView321','GetText',0)
MsgBox(0,'����ָ����Ŀ/����Ŀ���ı�',$GetText)

WinActivate('Program Manager') ;�������Ԥ��Ч��
ControlListView('Program Manager','','SysListView321','SelectAll')
Sleep(1000)
ControlListView('Program Manager','','SysListView321','DeSelect',1,3)
Sleep(1000)
ControlListView('Program Manager','','SysListView321','SelectInvert')
Sleep(1000)
ControlListView('Program Manager','','SysListView321','SelectClear')
Sleep(1000)
MsgBox(0,0,'û��!˯����!')
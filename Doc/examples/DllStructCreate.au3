;=========================================================
;   �������ݽṹ struct
;   struct {
;       ��             var1;
;       �޷����ַ�   var2;
;       �޷�����    var3;
;       �ַ�			var4[128];
;	}
;=========================================================
$str		= "int var1;ubyte var2;uint var3;char var4[128]"
$a			= DllStructCreate($str)
if @error Then
	MsgBox(0,"","д�� DllStructCreate ����" & @error);
	exit
endif

;=========================================================
;	�� struct ���趨����
;	struct.var1	= -1;
;	struct.var2	= 255;
;	struct.var3	= INT_MAX; -1 will be typecasted to (unsigned int)
;	strcpy(struct.var4,"Hello");
;	struct.var4[0]	= 'h';
;=========================================================
DllStructSetData($a,"var1",-1)
DllStructSetData($a,"var2",255)
DllStructSetData($a,"var3",-1)
DllStructSetData($a,"var4","Hello")
DllStructSetData($a,"var4",Asc("h"),1)

;=========================================================
;	��ʾд�� struct ����Ϣ
;=========================================================
MsgBox(0,"Dll���ݽṹ","���ݽṹ��С: " & DllStructGetSize($a) & @CRLF & _
		"���ݽṹָ��: " & DllStructGetPtr($a) & @CRLF & _
		"����:" & @CRLF & _
		DllStructGetData($a,1) & @CRLF & _
		DllStructGetData($a,2) & @CRLF & _
		DllStructGetData($a,3) & @CRLF & _
		DllStructGetData($a,4))

;=========================================================
;	�����Ҫ���ͷ�Ϊ struct ���ɵ��ڴ�
;=========================================================
$a=0

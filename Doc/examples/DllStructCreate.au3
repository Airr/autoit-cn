;=========================================================
;	�������ݽṹ
;	struct {
;		int				var1;
;		unsigned char	var2;
;		unsigned int	var3;
;		char			var4[128];
;	}
;=========================================================
$str		= "int var1;ubyte var2;uint var3;char var4[128]"
$a			= DllStructCreate($str)
if @error Then
	MsgBox(0,"","DllStructCreate ��������" & @error);
	exit
endif

;=========================================================
;	�������ݽṹ�е�����
;	struct.var1	= -1;
;	struct.var2	= 255;
;	struct.var3	= INT_MAX; -1 ���Զ�ȷ������(unsigned int)
;	strcpy(struct.var4,"Hello");
;	struct.var4[0]	= 'h';
;=========================================================
DllStructSetData($a,"var1",-1)
DllStructSetData($a,"var2",255)
DllStructSetData($a,"var3",-1)
DllStructSetData($a,"var4","Hello")
DllStructSetData($a,"var4",Asc("h"),1)

;=========================================================
;	��ʾ���ݽṹ����Ϣ
;=========================================================
MsgBox(0,"DllStruct","���ݽṹ��С: " & DllStructGetSize($a) & @CRLF & _
		"���ݽṹָ��: " & DllStructGetPtr($a) & @CRLF & _
		"Data:" & @CRLF & _
		DllStructGetData($a,1) & @CRLF & _
		DllStructGetData($a,2) & @CRLF & _
		DllStructGetData($a,3) & @CRLF & _
		DllStructGetData($a,4))

;=========================================================
;	�ͷ�Ϊ���ݽṹ������ڴ�
;=========================================================
$a=0

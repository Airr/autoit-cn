 
 ; *************************************************************** 
 ; ��1 - �򿪹�����������������ʶ��ʹ��ѭ��д�뵥Ԫ��. ����һ�к󱣴沢�ر��ļ�. 
 ; ***************************************************************** 
 #include  <Excel.au3> 
 
 Local  $oExcel  =  _ExcelBookNew ()  ;�½�������, ��ʹ֮�ɼ� 
 
 For  $i  =  1  To  5  ;ѭ�� 
     _ExcelWriteCell ( $oExcel ,  $i ,  $i ,  1 )  ;ʹ��ֵ1��5��ֱд�뵥Ԫ�� 
 Next 
 
 ToolTip ( "Inserting Column(s) Soon..." ) 
 Sleep ( 3500 )  ;��ͣ���û��۲���� 
 
 _ExcelColumnInsert ( $oExcel ,  1 ,  1 )  ;����1λ�ò���һ�� 
 
 MsgBox ( 0 ,  "Exiting" ,  "Press OK to Save File and Exit" ) 
 _ExcelBookSaveAs ( $oExcel ,  @TempDir  &  "\Temp.xls" ,  "xls" ,  0 ,  1 )  ; ���䱣�浽��ʱ�ļ���; ����б�Ҫ�����Ѵ����ļ� 
 _ExcelBookClose ( $oExcel )  ; �ر��˳� 
 
 ; *************************************************************** 
 ; ��2 - �򿪹�����������������ʶ��ʹ��ѭ��д�뵥Ԫ��. ���뼸�к󱣴沢�ر��ļ�. 
 ; ***************************************************************** 
 #include  <Excel.au3> 
 
 Local  $oExcel  =  _ExcelBookNew ()  ;�½�������, ��ʹ֮�ɼ� 
 
 ; ����ʹ��һ����ѭ�������������䵥Ԫ�� 
 For  $i  =  1  To  10 
     For  $j  =  1  To  10 
         _ExcelWriteCell ( $oExcel ,  Round ( Random ( 1 ,  100 ),  0 ),  $i ,  $j )  ;ѭ��д��һЩ������� 
     Next 
 Next 
 
 ToolTip ( "Inserting Column(s) Soon..." ) 
 Sleep ( 3500 )  ;��ͣ���û��۲���� 
 
 _ExcelColumnInsert ( $oExcel ,  2 ,  3 )  ;����2λ�ò������� 
 
 MsgBox ( 0 ,  "Exiting" ,  "Press OK to Save File and Exit" ) 
 _ExcelBookSaveAs ( $oExcel ,  @TempDir  &  "\Temp.xls" ,  "xls" ,  0 ,  1 )  ; ���䱣�浽��ʱ�ļ���; ����б�Ҫ�����Ѵ����ļ� 
 _ExcelBookClose ( $oExcel )  ; �ر��˳�  


 
 ; *************************************************************** 
 ; ��1 - �򿪹�����������������ʶ��ʹ��ѭ��д�뵥Ԫ��. ɾ��һ�к󱣴沢�ر��ļ�. 
 ; ***************************************************************** 
 #include  <Excel.au3> 
 
 Local  $oExcel  =  _ExcelBookNew ()  ;�½�������, ��ʹ֮�ɼ� 
 
 For  $i  =  1  To  5  ; ѭ�� 
     _ExcelWriteCell ( $oExcel ,  $i ,  $i ,  1 )  ;��1��5��ֱд�뵥Ԫ�� 
 Next 
 
 ToolTip ( "Deleting Rows Soon..." ) 
 Sleep ( 3500 ) 
 
 _ExcelRowDelete ( $oExcel ,  1 ,  1 )  ; ɾ���ҽ�ɾ����1 
 
 MsgBox ( 0 ,  "Exiting" ,  "Press OK to Save File and Exit" ) 
 _ExcelBookSaveAs ( $oExcel ,  @TempDir  &  "\Temp.xls" ,  "xls" ,  0 ,  1 )  ; ���䱣�浽��ʱ�ļ���; ����б�Ҫ�����Ѵ����ļ� 
 _ExcelBookClose ( $oExcel )  ; �ر��˳� 
 
 ; *************************************************************** 
 ; ��2 - �򿪹�����������������ʶ��ʹ��ѭ��д�뵥Ԫ��. ���뼸�к󱣴沢�ر��ļ�. 
 ; ***************************************************************** 
 
 #include  <Excel.au3> 
 
 Local  $oExcel  =  _ExcelBookNew ()  ; �½�������, ��ʹ֮�ɼ� 
 
 For  $i  =  1  To  5  ;ѭ�� 
     _ExcelWriteCell ( $oExcel ,  $i ,  $i ,  1 )  ;��1��5��ֱд�뵥Ԫ�� 
 Next 
 
 ToolTip ( "Deleting Rows Soon..." ) 
 Sleep ( 3500 ) 
 
 _ExcelRowDelete ( $oExcel ,  3 ,  2 )  ;����3��ʼɾ��2�� 
 
 MsgBox ( 0 ,  "Exiting" ,  "Press OK to Save File and Exit" ) 
 _ExcelBookSaveAs ( $oExcel ,  @TempDir  &  "\Temp.xls" ,  "xls" ,  0 ,  1 )  ; ���䱣�浽��ʱ�ļ���; ����б�Ҫ�����Ѵ����ļ� 
 _ExcelBookClose ( $oExcel )  ; �ر��˳�  


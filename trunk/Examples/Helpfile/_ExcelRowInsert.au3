 
 ; *************************************************************** 
 ; ʾ��1 - �򿪲����ع����������ʶ��ʹ��ѭ��д�뵥Ԫ��. ����1�к󱣴沢�ر��ļ�. 
 ; ***************************************************************** 
 #include  <Excel.au3> 
 
 Local  $oExcel  =  _ExcelBookNew ()  ;�½���������ʹ֮�ɼ� 
 
 For  $i  =  1  To  5  ;ѭ�� 
     _ExcelWriteCell ( $oExcel ,  $i ,  $i ,  1 )  ;��1��5��ֱд�뵥Ԫ�� 
 Next 
 
 ToolTip ( "Inserting Row(s) Soon..." ) 
 Sleep ( 3500 )  ;��ͣʹ�û��۲���� 
 
 _ExcelRowInsert ( $oExcel ,  1 ,  1 )  ;����1������1�� 
 
 MsgBox ( 0 ,  "Exiting" ,  "Press OK to Save File and Exit" ) 
 _ExcelBookSaveAs ( $oExcel ,  @TempDir  &  "\Temp.xls" ,  "xls" ,  0 ,  1 )  ; ���䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ� 
 _ExcelBookClose ( $oExcel )  ; �ر��˳� 
 
 ; *************************************************************** 
 ; ��2 - �򿪲����ع����������ʶ��ʹ��ѭ��д�뵥Ԫ��. ������к󱣴沢�ر��ļ�. 
 ; ***************************************************************** 
 #include  <Excel.au3> 
 
 Local  $oExcel  =  _ExcelBookNew ()  ;�½���������ʹ֮�ɼ� 
 
 For  $i  =  1  To  5  ;ѭ�� 
     _ExcelWriteCell ( $oExcel ,  $i ,  $i ,  1 )  ;��1��5��ֱд�뵥Ԫ�� 
 Next 
 
 ToolTip ( "Inserting Row(s) Soon..." ) 
 Sleep ( 3500 ) 
 
 _ExcelRowInsert ( $oExcel ,  2 ,  3 )  ;����2������3�� 
 
 MsgBox ( 0 ,  "Exiting" ,  "Press OK to Save File and Exit" ) 
 _ExcelBookSaveAs ( $oExcel ,  @TempDir  &  "\Temp.xls" ,  "xls" ,  0 ,  1 )  ; ���䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ� 
 _ExcelBookClose ( $oExcel )  ; �ر��˳�  


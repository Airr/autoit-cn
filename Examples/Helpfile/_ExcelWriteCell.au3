 
 ; *************************************************************** 
 ; ��1 - �򿪲����ع����������ʶ��д��һ����Ԫ��, ���沢�ر��ļ�. 
 ; ***************************************************************** 
 
 #include  <Excel.au3> 
 
 Local  $oExcel  =  _ExcelBookNew ()  ;�½�������, ��ʹ֮�ɼ� 
 
 _ExcelWriteCell ( $oExcel ,  "I Wrote to This Cell" ,  1 ,  1 )  ;д�뵥Ԫ�� 
 
 MsgBox ( 0 ,  "Exiting" ,  "Press OK to Save File and Exit" ) 
 _ExcelBookSaveAs ( $oExcel ,  @TempDir  &  "\Temp.xls" ,  "xls" ,  0 ,  1 )  ; ���䱣�浽��ʱ�ļ���; ����б�Ҫ�����Ѵ����ļ� 
 _ExcelBookClose ( $oExcel )  ; �ر��˳� 
 
 ; *************************************************************** 
 ; ��2 - �򿪲����ع����������ʶ��ʹ��ѭ��д��һ����Ԫ��, ���沢�ر��ļ�. 
 ; ***************************************************************** 
 
 #include  <Excel.au3> 
 
 Local  $oExcel  =  _ExcelBookNew ()  ;�½�������, ��ʹ֮�ɼ� 
 
 For  $i  =  1  To  20  ;ѭ�� 
     _ExcelWriteCell ( $oExcel ,  "I Wrote to This Cell" ,  $i ,  1 )  ;д�뵥Ԫ�� 
 Next 
 
 MsgBox ( 0 ,  "Exiting" ,  "Press OK to Save File and Exit" ) 
 _ExcelBookSaveAs ( $oExcel ,  @TempDir  &  "\Temp.xls" ,  "xls" ,  0 ,  1 )  ; ���䱣�浽��ʱ�ļ���; ����б�Ҫ�����Ѵ����ļ� 
 _ExcelBookClose ( $oExcel )  ; �ر��˳� 
 
 
 ; *************************************************************** 
 ; ��3 - �򿪲����ع����������ʶ��ʹ��ѭ��д��һ����Ԫ��, Ȼ��ʹ��_ExcelWriteCell���빫ʽ. 
 ; ***************************************************************** 
 
 #include  <Excel.au3> 
 
 Local  $oExcel  =  _ExcelBookNew ()  ;�½�������, ��ʹ֮�ɼ� 
 
 For  $i  =  1  To  20  ;ѭ�� 
     _ExcelWriteCell ( $oExcel ,  $i ,  $i ,  1 )  ;д�뵥Ԫ�� 
 Next 
 
 _ExcelWriteCell ( $oExcel ,  "=Average(A:A)" ,  1 ,  2 )  ;ʹ��A1��ʽ, ����R1C1 
 _ExcelWriteCell ( $oExcel ,  "=Average(A1:A20)" ,  1 ,  3 )  ;��һ��ʹ��A1��ʽ����R1C1��ʽд�빫ʽ�ķ��� 
 
 MsgBox ( 0 ,  "Exiting" ,  "Press OK to Save File and Exit" ) 
 _ExcelBookSaveAs ( $oExcel ,  @TempDir  &  "\Temp.xls" ,  "xls" ,  0 ,  1 )  ; ���䱣�浽��ʱ�ļ���; ����б�Ҫ�����Ѵ����ļ� 
 _ExcelBookClose ( $oExcel )  ; �ر��˳�  


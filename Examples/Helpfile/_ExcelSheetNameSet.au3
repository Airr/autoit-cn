 
 ; *********************************************************** 
 ; ��1 - �򿪹�����������������ʶ��, ���û������ 
 ; ***************************************************************** 
 #include  <Excel.au3> 
 
 Local  $oExcel  =  _ExcelBookNew ()  ;�½�������, ��ʹ֮�ɼ� 
 
 _ExcelSheetNameSet ( $oExcel ,  "ʾ��" )  ;��������� 
 
 MsgBox ( 0 ,  "Exiting" ,  "Press OK to Save File and Exit" ) 
 _ExcelBookSaveAs ( $oExcel ,  @TempDir  &  "\Temp.xls" ,  "xls" ,  0 ,  1 )  ; ���䱣�浽��ʱ�ļ���; ����б�Ҫ�����Ѵ����ļ� 
 _ExcelBookClose ( $oExcel )  ; �ر��˳� 
 
 ; *********************************************************************** 
 ; ��2 - �򿪹�����������������ʶ��, ��ʾ�������, ���Ĳ���ʾ������ 
 ; *********************************************************************** 
 #include  <Excel.au3> 
 
 Local  $oExcel  =  _ExcelBookNew ()  ;�½�������, ��ʹ֮�ɼ� 
 
 MsgBox ( 0 ,  "Sheet Name" ,  "The Current Active Sheet Name Is:"  &  @CRLF  &  _ExcelSheetNameGet ( $oExcel )) 
 
 _ExcelSheetNameSet ( $oExcel ,  "ʾ��" )  ;��������� 
 
 MsgBox ( 0 ,  "Sheet Name" ,  "Now The Current Active Sheet Name Is:"  &  @CRLF  &  _ExcelSheetNameGet ( $oExcel )) 
 
 MsgBox ( 0 ,  "Exiting" ,  "Press OK to Save File and Exit" ) 
 _ExcelBookSaveAs ( $oExcel ,  @TempDir  &  "\Temp.xls" ,  "xls" ,  0 ,  1 )  ; ���䱣�浽��ʱ�ļ���; ����б�Ҫ�����Ѵ����ļ� 
 _ExcelBookClose ( $oExcel )  ; �ر��˳�  


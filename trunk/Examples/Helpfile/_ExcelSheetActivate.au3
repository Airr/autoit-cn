 
 ; *************************************************************** 
 ; ��1 - �򿪲����ع����������ʶ��, ͨ���������ַ���ֵ����һ�ű� 
 ; ***************************************************************** 
 #include  <Excel.au3> 
 
 Local  $oExcel  =  _ExcelBookNew ()  ;�½���������ʹ֮�ɼ� 
 
 _ExcelSheetActivate ( $oExcel ,  "Sheet2" ) 
 
 MsgBox ( 0 ,  "Exiting" ,  "Notice How Sheet2 is Active and not Sheet1"  &  @CRLF  &  @CRLF  &  "Now Press OK to Save File and Exit" ) 
 _ExcelBookSaveAs ( $oExcel ,  @TempDir  &  "\Temp.xls" ,  "xls" ,  0 ,  1 )  ; ���䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ� 
 _ExcelBookClose ( $oExcel )  ; �ر��˳� 
 
 ; *************************************************************** 
 ; ��2 - �򿪲����ع����������ʶ��, ͨ��ʹ�ñ������ֵ����һ�ű� 
 ; ***************************************************************** 
 #include  <Excel.au3> 
 
 Local  $oExcel  =  _ExcelBookNew ()  ;�½���������ʹ֮�ɼ� 
 
 _ExcelSheetActivate ( $oExcel ,  2 ) 
 
 MsgBox ( 0 ,  "Exiting" ,  "Notice How Sheet2 is Active and not Sheet1"  &  @CRLF  &  @CRLF  &  "Now Press OK to Save File and Exit" ) 
 _ExcelBookSaveAs ( $oExcel ,  @TempDir  &  "\Temp.xls" ,  "xls" ,  0 ,  1 )  ; ���䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ� 
 _ExcelBookClose ( $oExcel )  ; �ر��˳� 
 
 ; *************************************************************** 
 ; ��3 - �򿪲����ع����������ʶ��, ͨ��ʹ�ñ������ֵ����һ�ű� 
 ; ***************************************************************** 
 #include  <Excel.au3> 
 
 Local  $oExcel  =  _ExcelBookNew ()  ;�½���������ʹ֮�ɼ� 
 
 $iNumberOfWorksheets  =  $oExcel . Worksheets . Count 
 
 MsgBox ( 0 ,  "" ,  $oExcel . Worksheets . Count ) 
 _ExcelSheetActivate ( $oExcel ,  2 ) 
 
 MsgBox ( 0 ,  "Exiting" ,  "Notice How Sheet2 is Active and not Sheet1"  &  @CRLF  &  @CRLF  &  "Now Press OK to Save File and Exit" ) 
 _ExcelBookSaveAs ( $oExcel ,  @TempDir  &  "\Temp.xls" ,  "xls" ,  0 ,  1 )  ; ���䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ� 
 _ExcelBookClose ( $oExcel )  ; �ر��˳�  


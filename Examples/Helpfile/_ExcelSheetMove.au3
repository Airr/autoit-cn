 
 ; ***************************************************************** 
 ; ��1 - �򿪲����ع����������ʶ��, ͨ����������ƶ��� 
 ; ***************************************************************** 
 #include  <Excel.au3> 
 
 Local  $oExcel  =  _ExcelBookNew ()  ;�½���������ʹ֮�ɼ� 
 _ExcelSheetMove ( $oExcel ,  2 )  ;�ƶ��ڶ��ű���һ��λ��(��������/����) 
 MsgBox ( 0 ,  "Exiting" ,  "Notice How Sheet2 is in the 1st Position"  &  @CRLF  &  @CRLF  &  "Now Press OK to Save File and Exit" ) 
 _ExcelBookSaveAs ( $oExcel ,  @TempDir  &  "\Temp.xls" ,  "xls" ,  0 ,  1 )  ; ���䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ� 
 _ExcelBookClose ( $oExcel )  ; �ر��˳� 
 
 ; ***************************************************************** 
 ; ��2 - �򿪲����ع����������ʶ��, ͨ������ַ��������ƶ��� 
 ; ***************************************************************** 
 #include  <Excel.au3> 
 
 Local  $oExcel  =  _ExcelBookNew ()  ;�½���������ʹ֮�ɼ� 
 _ExcelSheetMove ( $oExcel ,  "Sheet2" )  ;�ƶ��ڶ��ű���һ��λ��(�����ַ���/����) 
 MsgBox ( 0 ,  "Exiting" ,  "Notice How Sheet2 is in the 1st Position"  &  @CRLF  &  @CRLF  &  "Now Press OK to Save File and Exit" ) 
 _ExcelBookSaveAs ( $oExcel ,  @TempDir  &  "\Temp.xls" ,  "xls" ,  0 ,  1 )  ; ���䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ� 
 _ExcelBookClose ( $oExcel )  ; �ر��˳� 
 
 ; *************************************************************** 
 ; ��3 - �򿪲����ع����������ʶ��, ͨ���������ֵ�ƶ��� 
 ; ***************************************************************** 
 #include  <Excel.au3> 
 
 Local  $oExcel  =  _ExcelBookNew ()  ;�½���������ʹ֮�ɼ� 
 ;���һЩ��, ����һЩ���� 
 $sSheetName4  =  "Sheet4" 
 $sSheetName5  =  "Sheet5" 
 _ExcelSheetAddNew ( $oExcel ,  $sSheetName4 )  ;���һЩ�� 
 _ExcelSheetMove ( $oExcel ,  $sSheetName4 ,  4 ,  False )  ;�ƶ�$sSheetName4�����ĵ�λ��(���ʧ�ܽ����������ر��) 
 
 _ExcelSheetAddNew ( $oExcel ,  $sSheetName5 )  ;���һЩ�� 
 _ExcelSheetMove ( $oExcel ,  $sSheetName5 ,  5 ,  False )  ;�ƶ�$sSheetName4�������λ��(���ʧ�ܽ����������ر��) 
 
 MsgBox ( 0 ,  "Show" ,  "Take note of the order of the Worksheets"  &  @CRLF  &  @CRLF  &  "Press OK to Continue" ) 
 
 _ExcelSheetMove ( $oExcel ,  $sSheetName5 ,  "Sheet3" ,  True )  ;�ƶ������ű���ص�����Ϊ'Sheet3'��λ��ǰ 
 MsgBox ( 0 ,  "Exiting" ,  "'"  &  $sSheetName5  &  "'"  &  " when the $fBefore paramter is True (Relative to 'Sheet3')"  &  @CRLF  &  @CRLF  &  "Press OK to Continue" ) 
 _ExcelSheetMove ( $oExcel ,  $sSheetName5 ,  "Sheet3" ,  False )  ;�ƶ������ű���ص�����Ϊ'Sheet3'��λ��ǰ 
 MsgBox ( 0 ,  "Exiting" ,  "'"  &  $sSheetName5  &  "'"  &  " when the $fBefore paramter is False (Relative to 'Sheet3')"  &  @CRLF  &  @CRLF  &  "Now Press OK to Save File and Exit" ) 
 
 _ExcelBookSaveAs ( $oExcel ,  @TempDir  &  "\Temp.xls" ,  "xls" ,  0 ,  1 )  ; ���䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ� 
 _ExcelBookClose ( $oExcel )  ; �ر��˳�  


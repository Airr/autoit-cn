 
 ; ***************************************************************** 
 ; ʾ�� - �򿪲����ع����������ʶ��, ����һ����Χ�ڵ���������. 
 ; ***************************************************************** 
 
 #include  <Excel.au3> 
 
 Local  $oExcel  =  _ExcelBookNew ()  ;�½�������, ��ʹ֮�ɼ� 
 Local  $sRangeOrRowStart  =  1 ,  $iColStart  =  1 ,  $iRowEnd  =  10 ,  $iColEnd  =  10 
 Local  $fBold ,  $fItalic ,  $fUnderline ,  $i  =  1 
 
 ; ����ʹ�ü�ѭ�������������䵥Ԫ�� 
 For  $i  =  1  To  10 
     For  $j  =  1  To  10 
         _ExcelWriteCell ( $oExcel ,  Round ( Random ( 1 ,  100 ),  0 ),  $i ,  $j )  ;��������һЩ������ֵ��ļ� 
     Next 
 Next 
 
 MsgBox ( 0 ,  "_ExcelHorizontalAlignSet" ,  "Notice the Font Properties, This will go through all the Possible Combinations"  &  @CRLF  &  "Press OK to Continue" ) 
 
 $i  =  1 
 _ExcelFontSetProperties ( $oExcel ,  $sRangeOrRowStart ,  $iColStart ,  $iRowEnd ,  $iColEnd ,  False ,  False ,  True ) 
 ToolTip ( "New Font Setting: : "  &  $i ) 
 $i  +=  1 
 Sleep ( 2500 ) 
 
 _ExcelFontSetProperties ( $oExcel ,  $sRangeOrRowStart ,  $iColStart ,  $iRowEnd ,  $iColEnd ,  False ,  False ,  True ) 
 ToolTip ( "New Font Setting: "  &  $i ) 
 $i  +=  1 
 Sleep ( 2500 ) 
 
 _ExcelFontSetProperties ( $oExcel ,  $sRangeOrRowStart ,  $iColStart ,  $iRowEnd ,  $iColEnd ,  False ,  False ,  True ) 
 ToolTip ( "New Font Setting: "  &  $i ) 
 $i  +=  1 
 Sleep ( 2500 ) 
 
 _ExcelFontSetProperties ( $oExcel ,  $sRangeOrRowStart ,  $iColStart ,  $iRowEnd ,  $iColEnd ,  False ,  False ,  True ) 
 ToolTip ( "New Font Setting: "  &  $i ) 
 $i  +=  1 
 Sleep ( 2500 ) 
 
 _ExcelFontSetProperties ( $oExcel ,  $sRangeOrRowStart ,  $iColStart ,  $iRowEnd ,  $iColEnd ,  False ,  False ,  True ) 
 ToolTip ( "New Font Setting: "  &  $i ) 
 $i  +=  1 
 Sleep ( 2500 ) 
 
 _ExcelFontSetProperties ( $oExcel ,  $sRangeOrRowStart ,  $iColStart ,  $iRowEnd ,  $iColEnd ,  False ,  False ,  True ) 
 ToolTip ( "New Font Setting: "  &  $i ) 
 $i  +=  1 
 Sleep ( 2500 ) 
 
 _ExcelFontSetProperties ( $oExcel ,  $sRangeOrRowStart ,  $iColStart ,  $iRowEnd ,  $iColEnd ,  False ,  True ,  True ) 
 ToolTip ( "New Font Setting: "  &  $i ) 
 $i  +=  1 
 Sleep ( 2500 ) 
 
 _ExcelFontSetProperties ( $oExcel ,  $sRangeOrRowStart ,  $iColStart ,  $iRowEnd ,  $iColEnd ,  False ,  True ,  True ) 
 ToolTip ( "New Font Setting: "  &  $i ) 
 $i  +=  1 
 Sleep ( 2500 ) 
 
 _ExcelFontSetProperties ( $oExcel ,  $sRangeOrRowStart ,  $iColStart ,  $iRowEnd ,  $iColEnd ,  False ,  True ,  True ) 
 ToolTip ( "New Font Setting: "  &  $i ) 
 $i  +=  1 
 Sleep ( 2500 ) 
 
 _ExcelFontSetProperties ( $oExcel ,  $sRangeOrRowStart ,  $iColStart ,  $iRowEnd ,  $iColEnd ,  False ,  False ,  True ) 
 ToolTip ( "New Font Setting: "  &  $i ) 
 $i  +=  1 
 Sleep ( 2500 ) 
 
 _ExcelFontSetProperties ( $oExcel ,  $sRangeOrRowStart ,  $iColStart ,  $iRowEnd ,  $iColEnd ,  False ,  False ,  True ) 
 ToolTip ( "New Font Setting: "  &  $i ) 
 $i  +=  1 
 Sleep ( 2500 ) 
 
 _ExcelFontSetProperties ( $oExcel ,  $sRangeOrRowStart ,  $iColStart ,  $iRowEnd ,  $iColEnd ,  False ,  False ,  True ) 
 ToolTip ( "New Font Setting: "  &  $i ) 
 $i  +=  1 
 Sleep ( 2500 ) 
 
 _ExcelFontSetProperties ( $oExcel ,  $sRangeOrRowStart ,  $iColStart ,  $iRowEnd ,  $iColEnd ,  False ,  True ,  True ) 
 ToolTip ( "New Font Setting: "  &  $i ) 
 $i  +=  1 
 Sleep ( 2500 ) 
 
 _ExcelFontSetProperties ( $oExcel ,  $sRangeOrRowStart ,  $iColStart ,  $iRowEnd ,  $iColEnd ,  False ,  True ,  True ) 
 ToolTip ( "New Font Setting: "  &  $i ) 
 $i  +=  1 
 Sleep ( 2500 ) 
 
 _ExcelFontSetProperties ( $oExcel ,  $sRangeOrRowStart ,  $iColStart ,  $iRowEnd ,  $iColEnd ,  False ,  True ,  True ) 
 ToolTip ( "New Font Setting: "  &  $i ) 
 $i  +=  1 
 Sleep ( 2500 ) 
 
 _ExcelFontSetProperties ( $oExcel ,  $sRangeOrRowStart ,  $iColStart ,  $iRowEnd ,  $iColEnd ,  False ,  True ,  True ) 
 ToolTip ( "New Font Setting: "  &  $i ) 
 $i  +=  1 
 Sleep ( 2500 ) 
 
 _ExcelFontSetProperties ( $oExcel ,  $sRangeOrRowStart ,  $iColStart ,  $iRowEnd ,  $iColEnd ,  False ,  True ,  True ) 
 ToolTip ( "New Font Setting: "  &  $i ) 
 $i  +=  1 
 Sleep ( 2500 ) 
 
 _ExcelFontSetProperties ( $oExcel ,  $sRangeOrRowStart ,  $iColStart ,  $iRowEnd ,  $iColEnd ,  False ,  True ,  True ) 
 ToolTip ( "New Font Setting: "  &  $i ) 
 $i  +=  1 
 Sleep ( 2500 ) 
 
 _ExcelFontSetProperties ( $oExcel ,  $sRangeOrRowStart ,  $iColStart ,  $iRowEnd ,  $iColEnd ,  True ,  True ,  True ) 
 ToolTip ( "New Font Setting: "  &  $i ) 
 $i  +=  1 
 Sleep ( 2500 ) 
 
 _ExcelFontSetProperties ( $oExcel ,  $sRangeOrRowStart ,  $iColStart ,  $iRowEnd ,  $iColEnd ,  False ,  False ,  False ) 
 ToolTip ( "New Font Setting: "  &  $i ) 
 
 MsgBox ( 0 ,  "Exiting" ,  "Press OK to Save File and Exit" ) 
 _ExcelBookSaveAs ( $oExcel ,  @TempDir  &  "\Temp.xls" ,  "xls" ,  0 ,  1 )  ; ���ڽ��䱣������ʱĿ¼; ��Ҫʱ�����Ѵ��ڵ��ļ� 
 _ExcelBookClose ( $oExcel )  ; �ر��˳�  


; INI�ļ�д����ʾ,�ļ����������洴��.
Local $sIni = @DesktopDir & "\AutoIt-Test.ini"

; ������д�뵽��׼INI�ļ���һ���ֶ�.
Local $sData = "Key1=Value1" & @LF & "Key2=Value2" & @LF & "Key3=Value3"
IniWriteSection($sIni, "Section1", $sData)

;����һ���µ��ֶ�,������������д��.
Local $aData1 = IniReadSection($sIni, "Section1")	; ��ȡ�ո�д�������.
For $i = 1 To UBound($aData1) - 1
	$aData1[$i][1] &= "-" & $i	; ����ĳЩ����
Next

IniWriteSection($sIni, "Section2", $aData1)	; д���µ�����

; ����һ���Զ���Ķ�ά����,������������д��.
Local $aData2[3][2] = [["FirstKey", "FirstValue"],["SecondKey", "SecondValue"],["ThirdKey", "ThirdValue"]]
;��������Ԫ������,������0��ʼд��.
IniWriteSection($sIni, "Section3", $aData2, 0)

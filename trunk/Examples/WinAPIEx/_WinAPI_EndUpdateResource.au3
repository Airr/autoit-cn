#Include <APIConstants.au3>
#Include <WinAPIEx.au3>

Opt('MustDeclareVars', 1)

Global Const $sExe = @ScriptDir & '\MyProg.exe'

Global Const $tagICONRESDIR = 'byte Width;byte Height;byte ColorCount;byte Reserved;ushort Planes;ushort BitCount;dword BytesInRes;ushort IconId;'
Global Const $tagNEWHEADER = 'ushort Reserved;ushort ResType;ushort ResCount;' ; & $tagICONRESDIR[ResCount]

Global $hFile, $hUpdate, $tIcon, $pIcon, $sIcon, $tDir, $pDir, $tInfo, $tData, $iSize
Global $Count, $Bytes = 0, $ID = 400, $Error = 1

; 选择图标以更新资源
$sIcon = FileOpenDialog('Select File', @ScriptDir & '\Extras', 'Icon Files (*.ico)', 1 + 2, 'Script.ico')
If Not $sIcon Then
	Exit
EndIf

; 创建简单的可执行文件 (MyProg.exe), 将添加图标到其中
$hFile = FileOpen($sExe, 2 + 16)
FileWrite($hFile, _Executable_MyProg())
FileClose($hFile)

Do
	; 开始更新资源
	$hUpdate = _WinAPI_BeginUpdateResource($sExe)
	If @error Then
		ExitLoop
	EndIf
	; 把 .ico 文件作为原始二进制数据读取到结构中
	$tIcon = DllStructCreate('ushort Reserved;ushort Type;ushort Count;byte[' & (FileGetSize($sIcon) - 6) & ']')
	$pIcon = DllStructGetPtr($tIcon)
	$hFile = _WinAPI_CreateFile($sIcon, 2, 2)
	If Not $hFile Then
		ExitLoop
	EndIf
	_WinAPI_ReadFile($hFile, $pIcon, DllStructGetSize($tIcon), $Bytes)
	_WinAPI_CloseHandle($hFile)
	If Not $Bytes Then
		ExitLoop
	EndIf
	; 添加 .ico 文件中的所有图标到标识为 400, 401 等的 RT_ICON 资源, 并填充到组图标结构
	$Count = DllStructGetData($tIcon, 'Count')
	$tDir = DllStructCreate($tagNEWHEADER & 'byte[' & (14 * $Count) & ']')
	$pDir = DllStructGetPtr($tDir)
	DllStructSetData($tDir, 'Reserved', 0)
	DllStructSetData($tDir, 'ResType', 1)
	DllStructSetData($tDir, 'ResCount', $Count)
	For $i = 1 To $Count
		$tInfo = DllStructCreate('byte Width;byte Heigth;byte Colors;byte Reserved;ushort Planes;ushort BPP;dword Size;dword Offset', $pIcon + 6 + 16 * ($i - 1))
		$iSize = DllStructGetData($tInfo, 'Size')
		If Not _WinAPI_UpdateResource($hUpdate, $RT_ICON, $ID, 0, $pIcon + DllStructGetData($tInfo, 'Offset'), $iSize) Then
			ExitLoop 2
		EndIf
		$tData = DllStructCreate($tagICONRESDIR, $pDir + 6 + 14 * ($i - 1))
		DllStructSetData($tData, 'Width', DllStructGetData($tInfo, 'Width'))
		DllStructSetData($tData, 'Height', DllStructGetData($tInfo, 'Heigth'))
		DllStructSetData($tData, 'ColorCount', DllStructGetData($tInfo, 'Colors'))
		DllStructSetData($tData, 'Reserved', 0)
		DllStructSetData($tData, 'Planes', DllStructGetData($tInfo, 'Planes'))
		DllStructSetData($tData, 'BitCount', DllStructGetData($tInfo, 'BPP'))
		DllStructSetData($tData, 'BytesInRes', $iSize)
		DllStructSetData($tData, 'IconId', $ID)
		$ID += 1
	Next
	; 添加新的命名为 "MAINICON" 的 RT_GROUP_ICON 资源
	If Not _WinAPI_UpdateResource($hUpdate, $RT_GROUP_ICON, 'MAINICON', 0, $pDir, DllStructGetSize($tDir)) Then
		Exitloop
	EndIf
	$Error = 0
Until 1

; 保存或放弃可执行文件中资源的修改
If Not _WinAPI_EndUpdateResource($hUpdate, $Error) Then
	$Error = 1
EndIf

; 如果错误发生了则显示消息
If $Error Then
	MsgBox(16, 'Error', 'Unable to change resources.')
EndIf

Func _Executable_MyProg()

	Local $bExe = _
		 '0x4D5A000000000000000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000040000000' & _
		   '504500004C010200000000000000000000000000E00002010B01000000000000' & _
		   '0008000000000000001000000000000000000000000000010010000000020000' & _
		   '0000000000000000040000000000000000300000000200000000000002000000' & _
		   '0000000000000000000000000000000000000000100000000000000000000000' & _
		   '0011000014000000002000006C04000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '00000000000000000000000000000000000000000000000050454C4942000000' & _
		   '00100000001000000002000000020000000000000000000000000000600000C0' & _
		   '2E72737263000000001000000020000000060000000400000000000000000000' & _
		   '0000000040000040000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '6A00682210000168151000016A00FF1528110001C348656C6C6F20576F726C64' & _
		   '21004D7950726F67000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '2811000000000000000000003011000028110000000000000000000000000000' & _
		   '00000000000000003B110000000000005573657233322E646C6C0000004D6573' & _
		   '73616765426F7841000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '000000000000000000000000A8110000000000000200000002000000B2110000' & _
		   'BA110000C211000064756D6D792E657865000010000000100000C6110000D111' & _
		   '000000000000546573744578706F72740043616C6C506C7A0000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '000000003402944C426F6D650000020010000000200000801800000038000080' & _
		   '000000001506944C426F6D65000001000100000050000080000000003402944C' & _
		   '426F6D65000001000100000068000080000000001506944C426F6D6500000100' & _
		   '0904000080000000000000003402944C426F6D65000001000904000090000000' & _
		   'A0200000600100000000000000000000002200006C0200000000000000000000' & _
		   '600134000000560053005F00560045005200530049004F004E005F0049004E00' & _
		   '46004F0000000000BD04EFFE0000010000000100000000000000010000000000' & _
		   '00000000000000000400050001000000000000000000000000000000C0000000' & _
		   '000053007400720069006E006700460069006C00650049006E0066006F000000' & _
		   '9C00000000003000340030003900300034004200300000005200150001004600' & _
		   '69006C0065004400650073006300720069007000740069006F006E0000000000' & _
		   '530069006D0070006C0065002000610020006D00650073007300610067006500' & _
		   '200062006F00780000000000300008000100460069006C006500560065007200' & _
		   '730069006F006E000000000031002E0030002E0030002E003000000044000000' & _
		   '0000560061007200460069006C00650049006E0066006F000000000024000400' & _
		   '00005400720061006E0073006C006100740069006F006E00000000000904B004' & _
		   '3C617373656D626C7920786D6C6E733D2275726E3A736368656D61732D6D6963' & _
		   '726F736F66742D636F6D3A61736D2E763122206D616E69666573745665727369' & _
		   '6F6E3D22312E30223E0D0A20203C7472757374496E666F20786D6C6E733D2275' & _
		   '726E3A736368656D61732D6D6963726F736F66742D636F6D3A61736D2E763322' & _
		   '3E0D0A202020203C73656375726974793E0D0A2020202020203C726571756573' & _
		   '74656450726976696C656765733E0D0A20202020202020203C72657175657374' & _
		   '6564457865637574696F6E4C6576656C206C6576656C3D226173496E766F6B65' & _
		   '72222075694163636573733D2266616C7365223E3C2F72657175657374656445' & _
		   '7865637574696F6E4C6576656C3E0D0A2020202020203C2F7265717565737465' & _
		   '6450726976696C656765733E0D0A202020203C2F73656375726974793E0D0A20' & _
		   '203C2F7472757374496E666F3E0D0A20203C646570656E64656E63793E0D0A20' & _
		   '2020203C646570656E64656E74417373656D626C793E0D0A2020202020203C61' & _
		   '7373656D626C794964656E7469747920747970653D2277696E333222206E616D' & _
		   '653D224D6963726F736F66742E57696E646F77732E436F6D6D6F6E2D436F6E74' & _
		   '726F6C73222076657273696F6E3D22362E302E302E3022206C616E6775616765' & _
		   '3D222A222070726F636573736F724172636869746563747572653D222A222070' & _
		   '75626C69634B6579546F6B656E3D223635393562363431343463636631646622' & _
		   '3E3C2F617373656D626C794964656E746974793E0D0A202020203C2F64657065' & _
		   '6E64656E74417373656D626C793E0D0A20203C2F646570656E64656E63793E0D' & _
		   '0A3C2F617373656D626C793E0000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000' & _
		   '0000000000000000000000000000000000000000000000000000000000000000'

	Return Binary($bExe)
EndFunc   ;==>_Executable_MyProg

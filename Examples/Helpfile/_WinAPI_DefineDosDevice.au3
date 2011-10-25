#Include  <WinAPIEx.au3>

Opt('MustDeclareVars ', 1)

Global $sDevice = ' Z: '
Global $sPath = @ScriptDir

_WinAPI_DefineDosDevice($sDevice, $DDD_RAW_TARGET_PATH, '\DosDevices\' & $sPath)
msgbox(0, '', 'The drive ('& $sDevice & ' ) has been created. Press OK to release drive.')
_WinAPI_DefineDosDevice($sDevice, BitOR($DDD_EXACT_MATCH_ON_REMOVE, $DDD_RAW_TARGET_PATH, $DDD_REMOVE_DEFINITION), '\DosDevices\' & $sPath)


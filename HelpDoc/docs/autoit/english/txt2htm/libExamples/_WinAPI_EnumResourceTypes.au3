#include <Array.au3>
#include <WinAPIRes.au3>

Local $Data = _WinAPI_EnumResourceTypes(@SystemDir & '\shell32.dll')

_ArrayDisplay($Data, '_WinAPI_EnumResourceTypes')

#include <ComboConstants.au3>
#include <Crypt.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <StringConstants.au3>

Example()

Func Example()
	Local $bAlgorithm = $CALG_RC4

	Local $hGUI = GUICreate("File Encrypter", 425, 100)
	Local $iSourceInput = GUICtrlCreateInput("", 5, 5, 200, 20)
	Local $iSourceBrowse = GUICtrlCreateButton("...", 210, 5, 35, 20)

	Local $iDestinationInput = GUICtrlCreateInput("", 5, 30, 200, 20)
	Local $iDestinationBrowse = GUICtrlCreateButton("...", 210, 30, 35, 20)

	GUICtrlCreateLabel("Password:", 5, 60, 200, 20)
	Local $iPasswordInput = GUICtrlCreateInput("", 5, 75, 200, 20)

	Local $iCombo = GUICtrlCreateCombo("", 210, 75, 100, 20, $CBS_DROPDOWNLIST)
	GUICtrlSetData($iCombo, "3DES|AES (128bit)|AES (192bit)|AES (256bit)|DES|RC2|RC4", "RC4")
	Local $iEncrypt = GUICtrlCreateButton("Encrypt", 355, 70, 65, 25)
	GUISetState(@SW_SHOW, $hGUI)

	Local $sDestinationRead = "", $sFilePath = "", $sPasswordRead = "", $sSourceRead = ""
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop

			Case $iSourceBrowse
				$sFilePath = FileOpenDialog("Select a file to encrypt.", "", "All files (*.*)") ; Select a file to encrypt.
				If @error Then
					ContinueLoop
				EndIf
				GUICtrlSetData($iSourceInput, $sFilePath) ; Set the inputbox with the filepath.

			Case $iDestinationBrowse
				$sFilePath = FileSaveDialog("Save the file as ...", "", "All files (*.*)") ; Select a file to save the encrypted data to.
				If @error Then
					ContinueLoop
				EndIf
				GUICtrlSetData($iDestinationInput, $sFilePath) ; Set the inputbox with the filepath.

			Case $iCombo ; Check when the combobox is selected and retrieve the correct algorithm.
				Switch GUICtrlRead($iCombo) ; Read the combobox selection.
					Case "3DES"
						$bAlgorithm = $CALG_3DES

					Case "AES (128bit)"
						$bAlgorithm = $CALG_AES_128

					Case "AES (192bit)"
						$bAlgorithm = $CALG_AES_192

					Case "AES (256bit)"
						$bAlgorithm = $CALG_AES_256

					Case "DES"
						$bAlgorithm = $CALG_DES

					Case "RC2"
						$bAlgorithm = $CALG_RC2

					Case "RC4"
						$bAlgorithm = $CALG_RC4

				EndSwitch

			Case $iEncrypt
				$sSourceRead = GUICtrlRead($iSourceInput) ; Read the source filepath input.
				$sDestinationRead = GUICtrlRead($iDestinationInput) ; Read the destination filepath input.
				$sPasswordRead = GUICtrlRead($iPasswordInput) ; Read the password input.
				If StringStripWS($sSourceRead, $STR_STRIPALL) <> "" And StringStripWS($sDestinationRead, $STR_STRIPALL) <> "" And StringStripWS($sPasswordRead, $STR_STRIPALL) <> "" And FileExists($sSourceRead) Then ; Check there is a file available to encrypt and a password has been set.
					If _Crypt_EncryptFile($sSourceRead, $sDestinationRead, $sPasswordRead, $bAlgorithm) Then ; Encrypt the file.
						MsgBox($MB_SYSTEMMODAL, "Success", "Operation succeeded.")
					Else
						Switch @error
							Case 1
								MsgBox($MB_SYSTEMMODAL, "Error", "Failed to create the key.")
							Case 2
								MsgBox($MB_SYSTEMMODAL, "Error", "Couldn't open the source file.")
							Case 3
								MsgBox($MB_SYSTEMMODAL, "Error", "Couldn't open the destination file.")
							Case 4 Or 5
								MsgBox($MB_SYSTEMMODAL, "Error", "Encryption error.")
						EndSwitch
					EndIf
				Else
					MsgBox($MB_SYSTEMMODAL, "Error", "Please ensure the relevant information has been entered correctly.")
				EndIf
		EndSwitch
	WEnd

	GUIDelete($hGUI) ; Delete the previous GUI and all controls.
EndFunc   ;==>Example

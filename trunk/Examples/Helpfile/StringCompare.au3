Local $result = StringCompare("MEL�0�7N", "mel��n")
MsgBox(4096, "StringCompare Result (mode 0):", $result)

$result = StringCompare("MEL�0�7N", "mel��n", 1)
MsgBox(4096, "StringCompare Result (mode 1):", $result)

$result = StringCompare("MEL�0�7N", "mel��n", 2)
MsgBox(4096, "StringCompare Result (mode 2):", $result)

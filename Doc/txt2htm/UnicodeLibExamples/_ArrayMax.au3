﻿#include <Array.au3>

Local $avArray = StringSplit("4,2,06,8,12,5", ",")

MsgBox(4096,'最大字符串值', _ArrayMax($avArray, 0, 1))
MsgBox(4096,'最大数学值', _ArrayMax($avArray, 1, 1))

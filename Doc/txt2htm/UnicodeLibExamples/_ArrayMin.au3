﻿#include <Array.au3>

Local $avArray = StringSplit("4,2,06,8,12,5", ",")

MsgBox(4096,'最小字符串值', _ArrayMin($avArray, 0, 1))
MsgBox(4096,'最小数学值', _ArrayMin($avArray, 1, 0))

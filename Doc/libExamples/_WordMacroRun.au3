﻿; *******************************************************
; 示例 1 - 创建一个新的Microsoft Word文件并打开，带参数 "Test" 运行一个
;              名为 "My Macro" 的宏, 然后不保存退出.
; *******************************************************

#include <Word.au3>
$oWordApp = _WordCreate (@ScriptDir & "\Test.doc")
Sleep(2000)
_WordMacroRun ($oWordApp, "My Macro", "Test")
Sleep(2000)
_WordQuit ($oWordApp, 0)
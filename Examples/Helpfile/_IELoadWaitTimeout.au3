; *******************************************************
; 示例 1 - 获取当前超时值
; *******************************************************

#include <IE.au3>

Local $iCurrentTimeout = _IELoadWaitTimeout()

; *******************************************************
; 示例 2 - 设置超时为 1 分钟 (60000 毫秒)
; *******************************************************

#include <IE.au3>

_IELoadWaitTimeout(60000)

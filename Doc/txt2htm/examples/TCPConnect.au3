﻿;客户端
$g_IP = "127.0.0.1"

; 开始 TCP 服务
;==============================================
TCPStartUp()

; 创建一个套接字(socket)连接到已经存在的服务器
;==============================================
$socket = TCPConnect( $g_IP, 65432 )
If $socket = -1 Then Exit
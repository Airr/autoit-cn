
; ӳ�� X ���̵�  \\myserver\stuff using current user
DriveMapAdd("X:", "\\myserver\stuff")

; ӳ�� X ���̵� \\myserver2\stuff2 using the user "jon" from "domainx" with password "tickle"
DriveMapAdd("X:", "\\myserver2\stuff2", 0, "domainx\jon", "tickle")

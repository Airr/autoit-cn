
#include  <SQLite.au3>
#include  <SQLite.dll.au3>

_SQLite_Startup()
_SQLite_SafeMode(False)
_SQLite_Exec(-1, "CREATE tblTest (a,b,c);") ; û�д򿪵����ݿ�, ����SafeMode = false���±���
_SQLite_Shutdown()


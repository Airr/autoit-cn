#include <Access.au3>
$adSource = @ScriptDir & "\DB1.mdb"
MsgBox(4096, 'ͳ��', '�����ݿ�����<' & _accessTableCount($adSource) & '>����')
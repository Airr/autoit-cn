--   ���������� ����������� �������� ���������� $(��������_����������)
--   ��� ����������� �������� � ���� ���� .properties ��������� ������:
--   command.name.45.*.properties=������ �������� ����������
--   command.45.*.properties=dofile "$(SciteDefaultHome)\tools\value.lua"
--   command.mode.45.*.properties=subsystem:lua,savebefore:no
--   command.shortcut.45.*.properties=Alt+V
-----------------------------------------------
local value = props['CurrentSelection']
if (value == '') then
	value = props['CurrentWord']
end
print('\n'..value..' = '..props[value])

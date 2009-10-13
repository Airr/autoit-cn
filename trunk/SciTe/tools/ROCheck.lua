-- ������ ��� �������������� ��������� R/O ������ ��� ������
-- � �������-�� ����������� RHS
-- �����������:
--   �������� � SciTEStartup.lua ������
--     dofile (props["SciteDefaultHome"].."\\tools\\ROCheck.lua")
-- �����: Midas, vladvro
-----------------------------------------------
local function ROCheck()
	-- ������� ��������� �����
	local FileAttr = props['FileAttr']
-- ���� ����� ���������� ReadOnly/Hidden/System, � �� ���������� ����� R/O
	if string.find(FileAttr, "[RHS]") and not editor.ReadOnly then
	-- �� ��������� ����� R/O
		scite.MenuCommand(IDM_READONLY)
	end
end

-- ��������� ���� ���������� ������� OnOpen
local old_OnOpen = OnOpen
function OnOpen(file)
	local result
	if old_OnOpen then result = old_OnOpen(file) end
	if ROCheck() then return true end
	return result
end

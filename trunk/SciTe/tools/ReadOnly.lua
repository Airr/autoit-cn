--[[----------------------------------------------------------------------------
ReadOnly.lua
Author: VladVRO, mozers
version 1.3

��������� ���������/������ ������ "������ ��� ������"
��������� ������ ReadOnly � ������ ���������, ������ ����
� ���������� ����� � ����������� �������� �������

�����������:
� ���� SciTEStartup.lua �������� ������:
  dofile (props["SciteDefaultHome"].."\\tools\\ReadOnly.lua")
�������� scite.readonly � ��������� ������:
  statusbar.text.1=Line:$(LineNumber) Col:$(ColumnNumber) [$(scite.readonly)]
������� � ����� .properties ���� ���� ���� � ���������� ����� � ������ "������ ��� ������":
  style.back.readonly=#FFEEEE
--]]----------------------------------------------------------------------------

local function SetReadOnly(ro)
	if ro then
		if props["normal.style.saved"] == "" then
			props["normal.style.saved"] = "1"
			props["caret.period.normal"] = props["caret.period"]
			props["caret.width.normal"] = props["caret.width"]
			props["style.*.33.normal"] = props["style.*.33"]
		end

		props["caret.period"] = 0
		props["caret.width"] = 0
		if props["style.back.readonly"] ~= "" then
			props["style.*.33"] = props["style.*.33"]..",back:"..props["style.back.readonly"]
		end
		scite.Perform("reloadproperties:")

		props["scite.readonly"] = "VIEW"

	else
		if props["scite.readonly"] == "VIEW" then
			props["style.*.33"] = props["style.*.33.normal"]
			props["caret.period"] = props["caret.period.normal"]
			props["caret.width"] = props["caret.width.normal"]
			scite.Perform("reloadproperties:")
		end

		props["scite.readonly"] = "EDIT"
	end

	scite.UpdateStatusBar()
end

-- ��������� ���� ���������� ������� OnSwitchFile
local old_OnSwitchFile = OnSwitchFile
function OnSwitchFile(file)
	local result
	if old_OnSwitchFile then result = old_OnSwitchFile(file) end
	if SetReadOnly(editor.ReadOnly) then return true end
	return result
end

-- ��������� ���� ���������� ������� OnOpen
local old_OnOpen = OnOpen
function OnOpen(file)
	local result
	if old_OnOpen then result = old_OnOpen(file) end
	if SetReadOnly(editor.ReadOnly) then return true end
	return result
end

-- ��������� ���� ���������� �������, ������������ ��� ������ ������ ���� "Read-Only"
local old_OnSendEditor = OnSendEditor
function OnSendEditor(id_msg, wp, lp)
	local result
	if old_OnSendEditor then result = old_OnSendEditor(id_msg, wp, lp) end
	if id_msg == SCI_SETREADONLY then
		if SetReadOnly(wp~=0) then return true end
	end
	return result
end

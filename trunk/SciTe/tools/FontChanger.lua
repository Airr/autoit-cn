-- ����� ������� ��������� ������
-- C ������� �������� Ctrl+F11.
-- ��������� ������������ �� ��� ������� ������, ���������� ���������� �������� ������ �������
-- ����� ������ ����� ���������� ���������� �������
-- mozers, codewarlock1101

-- ��� ����������� �������� � ���� ���� .properties ������ ����������� ������� (font.0.*, font.1.*, font.2.*,...)
------------------------------------------------
local function FontChange()
	if props["font.set"]=="" then
		props["font.set"]="0"
	end
	local nxt_font=string.char(string.byte(props["font.set"])+1)
	if props["font."..nxt_font..".base"]=="" then
		nxt_font="0"
	end
	props["font.base"] = props["font."..nxt_font..".base"]
	props["font.small"] = props["font."..nxt_font..".small"]
	props["font.comment"] = props["font."..nxt_font..".comment"]
	props["font.set"]=nxt_font
end

-- ��������� ���� ���������� �������, ������������ ��� ������ ������ ���� "Use Monospaced Font"
local enable_idm=true
local old_OnMenuCommand = OnMenuCommand
function OnMenuCommand (msg, source)
	local result=false
	if old_OnMenuCommand then result = old_OnMenuCommand(msg, source) end
	if enable_idm==true and msg == IDM_MONOFONT then
		FontChange()
		enable_idm=false
		scite.MenuCommand(IDM_MONOFONT)
		enable_idm=true
	end
	return result
end
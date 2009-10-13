--[[--------------------------------------------------
lexer_name.lua
Authors: mozers�, VladVRO
version 1.1.1
------------------------------------------------------
����� ����� �������� ������� � ������ �������

�����������:
� ���� SciTEStartup.lua �������� ������:
  dofile (props["SciteDefaultHome"].."\\tools\\lexer_name.lua")
�������� scite.lexer.name � ��������� ������:
  statusbar.text.1=Line:$(LineNumber) Col:$(ColumnNumber) [$(scite.lexer.name)]
--]]--------------------------------------------------

local last_lexer
local function SetPropLexerName()
	local cur_lexer = editor.LexerLanguage
	if cur_lexer ~= last_lexer then
		if cur_lexer == "hypertext" then
			props["scite.lexer.name"] = "html"
		else
			props["scite.lexer.name"] = cur_lexer
		end
		last_lexer = cur_lexer
	end
end

-- ��������� ���� ���������� ������� OnUpdateUI
local old_OnUpdateUI = OnUpdateUI
function OnUpdateUI ()
	local result
	if old_OnUpdateUI then result = old_OnUpdateUI() end
	if props['FileName'] ~= '' then
		SetPropLexerName()
	end
	return result
end

-- ��������� ���� ���������� ������� OnSwitchFile
local old_OnSwitchFile = OnSwitchFile
function OnSwitchFile(file)
	local result
	if old_OnSwitchFile then result = old_OnSwitchFile(file) end
	SetPropLexerName()
	return result
end

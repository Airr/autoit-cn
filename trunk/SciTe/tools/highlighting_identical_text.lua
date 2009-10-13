--[[--------------------------------------------------
Highlighting Identical Text
Version: 1.3.1
Author: mozers�, TymurGubayev
------------------------------
���� ��������� ������, ������� ��������� � ������� ������ ��� ����������
� ����� �������� �������� ����� ���������
��������:
� ������� ������������ ������� �� COMMON.lua (EditorMarkText, EditorClearMarks, GetCurrentWord)
------------------------------
�����������:
�������� � SciTEStartup.lua ������:
	dofile (props["SciteDefaultHome"].."\\tools\\highlighting_identical_text.lua")

�������� � ���� �������� ��������:
	highlighting.identical.text=0
� ������������� � ���� Tools:
	command.checked.139.*=$(highlighting.identical.text)
	command.name.139.*=Highlighting Identical Text
	command.139.*=highlighting_identical_text_switch
	command.mode.139.*=subsystem:lua,savebefore:no

������ ����� ������������ ��������
(4 - ������� ����������� ������, 5 - ������� ������ ��� ���������� max ���-�� ���������):
	find.mark.4=#CC99FF,box
	find.mark.5=#FF0000,box

������������� ����� �������� �������� �� ��������� (50) �� max ���-�� ��������� (0 - ��� �����������).
	highlighting.identical.text.max=100
� ������ �������� ���������������� ���� ��� ����������� ������� (��� ��� ���� ��������� - *)
	highlighting.identical.text.reserved.words.lua=and,break,do,else,elseif,end,false,for,function,if,in,local,nil,not,or,repeat,return,then,true,until,while

============================================================================
���� �� ������� editor:findtext �� ������ �������� ��� ������ � UTF ��������,
�� ��� ����� ���� �� ����������� �������������� (��. ������ 1.0 ����� �������).
============================================================================
--]]----------------------------------------------------

local count_max = 50   -- max ���-�� ����������� ������ (�� ���������)
local store_pos        -- ���������� ��� �������� ����������� ������� �������
local store_text       -- ���������� ��� �������� ������������ ���������� ������
local mark_ident = 4   -- ����� ������� ��� ������� ����������� ������/�����
local mark_max = 5     -- ����� ������� ��� ������� ��� ���������� max ���-�� ���������
local chars_count      -- ���-�� �������� � ������� ���������
local all_text         -- ����� �������� ���������
local word_pattern     -- ������� ��� ������ ����
local reserved_words   -- ���������������� �����

local max = props['highlighting.identical.text.max']
if max ~= '' then count_max = tonumber(max) end

-- ������������� ��������� (���/����) ����������� �� ���� Tools
function highlighting_identical_text_switch()
	local prop_name = 'highlighting.identical.text'
	props[prop_name] = 1 - tonumber(props[prop_name])
	EditorClearMarks(mark_ident)
	store_pos, store_text = 0, ''
end

-- ��������, �������� �� ��������� ����� ������
local function isWord(all_text, text_start, text_end)
	if  ( (text_start==1)       or (all_text:sub(text_start-1, text_start-1):match(word_pattern)) ) and
		( (text_end==#all_text) or (all_text:sub(text_end+1, text_end+1):match(word_pattern)) )    then
			return true
	end
	return false
end

-- ��������, �������� �� ������� ����� �����������������
local function isReservedWord(cur_text)
	if reserved_words == '' then return false end
	for w in string.gmatch(reserved_words, "%w+") do
		if cur_text:lower() == w:lower() then return true end
	end
	return false
end

-- ����� ���������� ����/������
local function IdenticalTextFinder()
	local current_pos = editor.CurrentPos
	if current_pos == store_pos then return end
	store_pos = current_pos

	local wholeword = false
	local cur_text = editor:GetSelText()
	if cur_text:find('^%s+$') then return end
	if cur_text == '' then
		cur_text = GetCurrentWord()
		wholeword = true
		if isReservedWord(cur_text) then return end
	end
	if cur_text == store_text then return end
	store_text = cur_text

	EditorClearMarks(mark_ident)
	EditorClearMarks(mark_max)
	if wholeword then word_pattern = '[^' .. editor.WordChars .. ']' end
	----------------------------------------------------------
	local match_table = {}
	local find_start = 1
	repeat
		local ident_text_start, ident_text_end = all_text:find(cur_text, find_start, true)
		if ident_text_start == nil then break end
		if ident_text_end == 0 then break end
		if ( not wholeword ) or
			( isWord(all_text, ident_text_start, ident_text_end) ) then
				-- �������� ��� ���������� ������ � ������� match_table
				match_table[#match_table+1] = {ident_text_start-1, ident_text_end}
		end
		if count_max ~= 0 then
			if #match_table > count_max then -- ���� ����������� ������, ��� ��������� �����...
				local err_start, err_end
				if wholeword then
					-- �� ��������� ������ ������� �����
					err_start = editor:WordStartPosition(current_pos, true)
					err_end = editor:WordEndPosition(current_pos, true)
					EditorMarkText(err_start, err_end-err_start, mark_max)
					return
				else
					-- �� ��������� ������ ������� ���������
					err_start = editor.SelectionStart
					err_end = editor.SelectionEnd
					EditorMarkText(err_start, err_end-err_start, mark_max)
					return
				end
			end
		end
		find_start = ident_text_end + 1
	until false
	----------------------------------------------------------
	if #match_table > 1 then
		for i = 1, #match_table do
			-- �������� ��� �����, ���� ������ �� ������� match_table
			EditorMarkText(match_table[i][1], match_table[i][2]-match_table[i][1], mark_ident)
		end
	end

end

-- Add user event handler OnUpdateUI
local old_OnUpdateUI = OnUpdateUI
function OnUpdateUI ()
	local result
	if old_OnUpdateUI then result = old_OnUpdateUI() end
	if props['FileName'] ~= '' then
		if tonumber(props["highlighting.identical.text"]) == 1 then
			if editor.Length ~= chars_count then
				all_text = editor:GetText()
				chars_count = editor.Length
				reserved_words = props['highlighting.identical.text.reserved.words.' .. editor.LexerLanguage]
				if reserved_words == '' then reserved_words = props['highlighting.identical.text.reserved.words.*'] end
			end
			IdenticalTextFinder()
		end
	end
	return result
end

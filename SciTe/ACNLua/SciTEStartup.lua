--------------------------------------------------------------------------------
-- SciTE �����ű�.
--------------------------------------------------------------------------------

-- ������Ҫ������ļ����б�.
LoadLuaFileList = { }

--------------------------------------------------------------------------------
-- LoadLuaFile(�ļ�, Ŀ¼)
--
-- ��������,�����򵥵�����Lua�ļ�.
--
-- ����:
--	�ļ� - Ҫ�����Lua�ļ���.
--	Ŀ¼ - ���ָ��,����ָ����Ŀ¼�в����ļ�.Ĭ�������,
-- 		 ���Ŀ¼Ϊ $(SciTEDefaultHome)\ACNLua.
--------------------------------------------------------------------------------
function LoadLuaFile(file, directory)
	if directory == nil then
		directory = props["SciteDefaultHome"] .. "\\ACNLua\\"
	end
	table.insert(LoadLuaFileList, directory .. file)
	dofile(directory .. file)
end	-- LoadLuaFile()

-- �������� Lua �ļ�.
LoadLuaFile("Class.lua")				-- ������������.
LoadLuaFile("Common.lua")				-- ���Ǵ�Ҫ����.
LoadLuaFile("AutoItPixmap.lua")			-- AU3ͼ��ӳ���.���ڹ�����ʾ��ʾ��ͼ��.
LoadLuaFile("AutoHScroll.lua")			-- �Զ�����
LoadLuaFile("AutoItAutoComplete.lua")	-- AU3�Զ���ɵ���
LoadLuaFile("AutoItIndentFix.lua")		-- AU3��������
LoadLuaFile("SmartAutoCompleteHide.lua")-- ֻ���Զ��������
LoadLuaFile("Tools.lua")				-- һЩAU3ʹ�õĹ���
LoadLuaFile("AutoItTools.lua")			-- һЩAU3ʹ�õĹ���
LoadLuaFile("AutoItGotoDefinition.lua")	-- AU3��ת����

-- ��ʼ�¼�(����OnStartup()).
EventClass:BeginEvents()

--require "lfs"
require "json"
--require "lc"-------这个lc.dll有个bug,ansi转utf-8后 会多出ULL三个字符
-- print(lc.help())
--require "luacom"----这个luacom.dll有bug，程序运行结束会崩掉
require "md5"
 
--local utf8=require("utf8.utf8");
print_r=require "xlsxreader.print_r"
local loadCsvFile=require "Csv2Lua"
local Workbook = require "xlsxreader.workbook"
local curDir = g_curPath

local tMd5 = {}
local oldJson={}
local newJson={}


local writeClientStr = ""
local writeServerStr = ""

local toSkipFileName={};
local iconv = require("luaiconv")

local g_clientPath;
local g_serverPath;

function createIconv(to, from)  
    local cd = iconv.new(to, from)  
    return function(txt)  
        local _, err = cd:iconv(txt) 
          if err == iconv.ERROR_INCOMPLETE then
			    print("ERROR: Incomplete input.")
			  elseif err == iconv.ERROR_INVALID then
			    print("ERROR: Invalid input.")
			  elseif err == iconv.ERROR_NO_MEMORY then
			    print("ERROR: Failed to allocate memory.")
			  elseif err == iconv.ERROR_UNKNOWN then
			    print("ERROR: There was an unknown error.")
			  end
        return _; 
    end  
end  

L = createIconv("gbk", "utf-8")  

-- A2U = createIconv("ascii", "utf-8")
-- U2A = createIconv("utf-8", "ascii")

-- local function ASCII2UTF8(s) 
--  	local temp=A2U(s)
--  	return temp
-- end

-- local function UTF82ASCII(s) 
--  	local temp=U2A(s)
--  	return temp
-- end


local function toUTF8(s)
	return L(s);
end

local function ChangeSpStr(str)
	str=string.gsub(str, "\\\\", "\\");

	return str;
end

function erroCallBack(msg)
	msg = debug.traceback(msg, 2)
	return msg
end

local Excel = {}

local function writeFile(filename,str,relaPath)

	if relaPath then

		local nInitPos = 0

		local folder = g_curPath

		for i=1,1000 do
			local nBegin,nEnd = string.find(relaPath,"\\",nInitPos)

			if not nEnd then
				break
			end

			folder = folder..string.sub(relaPath,nInitPos,nEnd)
			--print("create folder"..folder)
			nInitPos = nEnd+1

			--folder = string.sub(folder,1,-2)

			--print("folder:",folder,"relaPath:",relaPath)

			--if not file_exists(folder) then
				--没有这个文件夹,则创建
				os.execute("mkdir "..folder)
			--end
		end
	end
	--print("write fileName:"..filename)
    local f = assert(io.open(filename, 'w'))
    f:write(str)
    f:close()
end

--- 打开Excel文件
-- @param filename excel文件名
function Excel.open(filename)
    local sheets=Workbook.load(filename);
    return sheets;
end
 

function getExtension(str)
    return str:match(".+%.(%w+)$")
end
 

 --=============================================================
function Excel.excel2Lua(excelName, tData) 

	local isWrite = true
   print("load excelName:"..excelName)
   -- toSkipFileName=toSkipFileName or {}
   if not toSkipFileName[excelName] then
   	local v = oldJson[excelName]
		if v  then
				local file = io.open(excelName, "rb")
	   		local fildata = file:read("*a")
				local md5Str = sumhexa(fildata)
				if md5Str==v then
					print("skip no md5 fileName:"..excelName);
					toSkipFileName[excelName]=true;
					isWrite = false
					newJson[excelName]=md5Str;
				else
					print("nnnnnnnnnnnnnnnnnnnn")
					newJson[excelName]=md5Str;
				end
		else
			local file = io.open(excelName, "rb")
   		local fildata = file:read("*a")
			local md5Str = sumhexa(fildata)
			newJson[excelName]=md5Str;
		end
	else
		print("skip has loaded fileName:"..excelName);
		isWrite = false
	end
	


	if isWrite then
		
		if getExtension(excelName)=="csv" then
			local exData=tData[1];
			Excel.csv2Lua(excelName,exData)
		else
			local nOsClock = os.clock()

			local sheets = Excel.open(excelName);--Excel.open("C:\\Users\\Vincent\\Desktop\\lua-5.3.0\\Json2Lua\\44.xlsx")
				for _,sheet in pairs(sheets) do
						for i,v in ipairs(tData) do
							Excel.excelSheet2Lua(excelName,sheet,sheet.name,v);
						end
						
				end
				
			--等那天慢，哥再来优化---------------
			print("========================Need Clock:", os.clock() - nOsClock, "========================")
		end
	end


	for i,v in ipairs(tData) do
			createRequireFile(v);
	end

end



function Excel.csv2Lua(excelName,exData)
	local sMakePath=exData[3];
	local outputPath="\\output"..exData[3];
	local sheetName=exData[2];
	local baseXslPath=exData[1]
	-- body
	local dataArr,rows,columns=loadCsvFile(excelName)
	local KEYNAME = 3;
	local KEYTYPE = 4;
	if  rows < KEYTYPE then
		return;-- sheet没有有效数据
	end
	local nowTime=os.clock()
	local lColums={};			--需要加载的列
	local keyNametb=dataArr[KEYNAME]
	local typetb=dataArr[KEYTYPE]
	local maxColumns=0
	for j = 1,columns do
		local keyName = keyNametb[j]
		local keyType = typetb[j]
		if keyName and keyType and keyName~="" and keyType~="" then

			lColums[j]=true
			maxColumns=j
		end
	end

	local keyNametb=dataArr[KEYNAME]
	local typetb=dataArr[KEYTYPE]

	local tableStr={}
	local extend=getExtension(outputPath)
	local strKeyStyle,numKeyStyle
	local isLua=false
	if extend=="lua" then
		table.insert(tableStr,"local a = {\n")
		isLua=true
	else
		table.insert(tableStr,"{\n")
	end
	for i = KEYTYPE+1,rows do      					-- 行数
		local rowData=dataArr[i]
		local mainKey=typetb[1]
		local curRows=rowData[1]			--第一个的数据
		if  curRows and string.sub(curRows,1,2)~="//" then	--注释或者跳过
			if mainKey == "str" then
				if isLua then 
					table.insert(tableStr,string.format("[%q]={\n",rowData[1]))
				else 
					table.insert(tableStr,string.format("%q:{\n",rowData[1]))
				end
			else
				if isLua then 
					table.insert(tableStr,string.format("[%s]={\n",rowData[1]))
				else
					table.insert(tableStr,string.format("%q:{\n",rowData[1]))
				end
				
			end
		    for j = 1,columns do
		    	if lColums[j] then   --有数据需要加载的，再执行逻辑
						local keyName = keyNametb[j];
					   local keyType = typetb[j];
						if  keyName and keyType then
							if keyType ~= "str" then
								local value = rowData[j] or 0;
								
								if value == "" then
									value = 0
								end

								if isLua then 
									table.insert(tableStr,string.format("	[%q]=%s, \n",keyName,value))
								else
									if maxColumns == j then
										table.insert(tableStr,string.format("	%q:%s \n",keyName,value))
									else
										table.insert(tableStr,string.format("	%q:%s, \n",keyName,value))
									end
								end
							else
								local value = rowData[j] or "";

								if isLua then 
									table.insert(tableStr,string.format("	[%q]=%q, \n",keyName,value))
								else
									if maxColumns == j then
										table.insert(tableStr,string.format("	%q:%q \n",keyName,value))
									else
										table.insert(tableStr,string.format("	%q:%q, \n",keyName,value))
									end
								end
								
							end
						end
				end
		    end
		    if i == rows then
		    	table.insert(tableStr,"}\n")
		    else
		    	 table.insert(tableStr,"},\n")
		    end 
		   
		else
			--local ErrStr = "遇到注释或空白行，该行跳过："..i

			--print(toUTF8(ErrStr))
		end
		
	end
	if extend=="lua" then
		table.insert(tableStr,"}\n return a;")
	else
		table.insert(tableStr,"}\n")
	end
	
	local temp = table.concat(tableStr)
	--temp = ASCII2UTF8(temp);---asic 转utf-8
	temp=ChangeSpStr(temp)
	--outputPath = "\\lua"..outputPath



	writeFile(curDir..outputPath, temp, outputPath)
	--print("costtime:",(os.clock()-nowTime),lc.u2a("完成转换："), outputPath)
end

function createRequireFile(exData)
	local sMakePath=exData[3];
	local sheetName=exData[2];
	local baseXslPath=exData[1]
	local extend=getExtension(sMakePath);
	if extend=="lua" then
			--生成require的文件
			sMakePath = string.gsub(sMakePath,"\\",".")

			sMakePath = string.sub( sMakePath, 1,-5 )

			--找出最后的文件名位置
			local nEndShow = 0 
			for k=1,100 do
				local _,nCurEnd = string.find( sMakePath, "%.",nEndShow )
				if not nCurEnd then
					break
				end
				nEndShow = nCurEnd+1
			end
			
			
			local filename = string.sub( sMakePath,nEndShow ) 

			local CurStr = "--"..baseXslPath.."   sheet:"..sheetName.."\n".."g_t"..filename.." = ".."require(".."\""..g_clientPath..sMakePath.."\""..")"

			writeClientStr = writeClientStr..CurStr.."\n"

			sMakePath = string.sub(sMakePath, 2)
			
			local CurServerStr = "--"..baseXslPath.."   sheet:"..sheetName.."\n".."g_t"..filename.." = ".."require(".."\""..g_serverPath..sMakePath.."\""..")"
			writeServerStr = writeServerStr..CurServerStr
	end
end
--{baseXslPath,sSheetName,sMakePath}
--=============================================================
function Excel.excelSheet2Lua(excelName,sheet, CurSheetName, exData) 
	local sMakePath=exData[3];
	local outputPath="\\output"..exData[3];
	local sheetName=exData[2];
	local baseXslPath=exData[1]
	CurSheetName = toUTF8(CurSheetName)


	if CurSheetName ~= sheetName then
		--print("CurSheetName:",CurSheetName, "sheetName",sheetName)
		return
	end
	print("load fileName:"..excelName.."for sheetName:"..sheetName);
	local nowTime=os.clock()
	-- print_r(sheet.sheetRaw)
	-- print_r(sheet.sheetSize)
	local sheetSize=sheet.sheetSize;

	local rows = sheetSize.rowCount; --表格的行数
	local columns = sheetSize.colCount; --表格的列数
	--print(string.format("loadData,row:%d,col:%d",rows,columns))
	local lColums={};			--需要加载的列
	local KEYNAME = 3;
	local KEYTYPE = 4;
	if not sheet or rows < KEYTYPE then
		return;-- sheet没有有效数据
	end

	local sheetData=sheet.sheetRaw;
	-- print_r(sheetData)
	local keyNametb=sheetData[KEYNAME];

	local typetb=sheetData[KEYTYPE];
	local maxColumns=0
	for j = 1,columns do
		local keyName = keyNametb[j]
		local keyType = typetb[j]
		if keyName and keyType and keyName~="" then
			lColums[j]=true
			maxColumns=j
		end
	end
	local str = {};
	local tableStr={}
	local extend=getExtension(outputPath)
	local isLua=false
	if extend=="lua" then
		table.insert(tableStr,"local a = {\n")
		isLua=true
	else
		table.insert(tableStr,"{\n")
	end


	for r=KEYTYPE+1 ,rows do
		local rowData=sheetData[r]

		if rowData~= nil then
					local mainKey=typetb[1]
					local curRows=rowData[1]			--第一个的数据
					if  curRows and string.sub(curRows,1,2)~="//" and curRows~="" then	--注释或者跳过
							if mainKey == "str" then
								if isLua then 
									table.insert(tableStr,string.format("[%q]={\n",rowData[1]))
								else 
									table.insert(tableStr,string.format("%q:{\n",rowData[1]))
								end
							else
								if isLua then 
									table.insert(tableStr,string.format("[%s]={\n",rowData[1]))
								else
									table.insert(tableStr,string.format("%q:{\n",rowData[1]))
								end
								
							end
					    for j = 1,columns do
					    	if lColums[j] then   --有数据需要加载的，再执行逻辑
									local keyName = keyNametb[j];
								   local keyType = typetb[j];
									if  keyName and keyType and keyName~="" then
										if keyType ~= "str" then
											local value = rowData[j] or 0;
											if value == "" then
												value = 0
											end
											if isLua then 
												table.insert(tableStr,string.format("	[%q]=%s, \n",keyName,value))
											else
												if maxColumns == j then
													table.insert(tableStr,string.format("	%q:%s \n",keyName,value))
												else
													table.insert(tableStr,string.format("	%q:%s, \n",keyName,value))
												end
												
											end
										else
											local value = rowData[j] or "";

											if isLua then 
												table.insert(tableStr,string.format("	[%q]=%q, \n",keyName,value))
											else
												if maxColumns == j then
													table.insert(tableStr,string.format("	%q:%q \n",keyName,value))
												else
													table.insert(tableStr,string.format("	%q:%q, \n",keyName,value))
												end
											end
											
										end
									end
							end
					    end
					    -- local strMaxCount=#tableStr;
					    -- local lastStr=tableStr[strMaxCount];
					    -- lastStr=string.sub(lastStr,1,string.len(lastStr)-2)
					    -- tableStr[strMaxCount]=lastStr;	
			 		    table.insert(tableStr,"},\n")

					else
						--local ErrStr = "遇到注释或空白行，该行跳过："..(r)
						-- ErrStr = lc.u2a(ErrStr)
						-- ErrStr = string.sub(ErrStr,1,string.len(ErrStr)-1)
						--print(toUTF8(ErrStr))
					end
		end
		
	end

	local temp 
	if extend=="lua" then
		table.insert(tableStr,"}\n return a;")
		temp= table.concat(tableStr)
	else
		temp= table.concat(tableStr)
		temp=string.sub(temp,1,string.len(temp)-2)		--最后的逗号去掉
		temp=temp.."\n}\n"
	end
	--temp = ASCII2UTF8(temp);---asic 转utf-8
	temp=ChangeSpStr(temp)
	-- outputPath = "\\lua"..outputPath

	writeFile(curDir..outputPath, temp, outputPath)

	
	
	
	print("costtime:",(os.clock()-nowTime),toUTF8("完成转换："), outputPath)
end

--遍历文件
function findindir (path, wefind, r_table, intofolder)
    for file in lfs.dir(path) do
        if file ~= "." and file ~= ".." then
            local f = path..'\\'..file
            if string.find(f, wefind) ~= nil then
                table.insert(r_table, f)
            end
            local attr = lfs.attributes (f)
            assert (type(attr) == "table")
            if attr.mode == "directory" and intofolder then
                findindir (f, wefind, r_table, intofolder)
            else

            end
        end
    end
end

--检测文件是否存在
function file_exists(path)
  local file = io.open(path, "rb")
  if file then file:close() end
  return file ~= nil
end


--根据路径创建require文件
local function makeRequireFileFormPath(sClientPath, sClientFileName, sServerPath, sServerFileName)
	g_clientPath=sClientPath
	g_serverPath=sServerPath
    -- 读取MD5文件 
    local md5File = io.open(g_Package.md5File, 'r')
    if md5File then
    	local md5Data = md5File:read("*all")
    	oldJson = json.decode(md5Data) or {};
    end


	--是否要生成头文件
	local ClientFlie 
	local ServerFile
	if g_Package.createHeader then
			sClientFileName = sClientFileName or "requireConfig.lua"

			local ClientPath = "./"..sClientFileName

			os.remove(ClientPath)

			ClientFlie = io.open(ClientPath, 'w')

			
			if sServerFileName then
				ServerFile = io.open("./"..sServerFileName, 'w')
			end

	end 


	toSkipFileName={};


	local xslxToData={}
	for i,v in ipairs(g_tMakeConfig) do
		local tV = {v[1], v[2], v[3]}
		
		tV[1] = string.gsub(tV[1],"/","\\")
		tV[3] = string.gsub(tV[3],"/","\\")
	
		-- tV[1] = lc.u2a(tV[1])
		-- tV[1] = string.sub(tV[1],1,string.len(tV[1])-1)
		
		--print("tV[1]:", tV[1])
		local baseXslPath=toUTF8(tV[1]);
		local sXlsPath = curDir..tV[1];
		local sSheetName = toUTF8(tV[2])
		local sMakePath = toUTF8(tV[3])		--output是导出目录
		
		sXlsPath=toUTF8(sXlsPath)
		if not xslxToData[sXlsPath] then
				xslxToData[sXlsPath]={}
		end
		local exData=xslxToData[sXlsPath];
		table.insert(exData,{baseXslPath,sSheetName,sMakePath});
	end

	for sXlsPath,exData in pairs(xslxToData) do
		Excel.excel2Lua(sXlsPath, exData); 
	end
		
	if g_Package.createHeader then
			ClientFlie:write(writeClientStr)
			ClientFlie:close()

			if ServerFile then
				ServerFile:write(writeServerStr)
				ServerFile:close()
			end
	end

	local jsonData = json.encode(newJson)
	writeFile(g_Package.md5File, jsonData, "")

		
end

makeRequireFileFormPath(g_Package.client, "requireConfig.lua", g_Package.server, "requireServerConfig.lua")


print(toUTF8("=============已经将所有配置表成功转换!!=================="))

function linesplit(str, delimiter)
    if str==nil or str=='' or delimiter==nil then
        return nil
    end
    
    local result = {}
    local tableCount=0
    for match in (str..delimiter):gmatch("(.-)"..delimiter) do

        table.insert(result, match)
        tableCount=tableCount+1
    end
    return result,tableCount;
end

local function rowSplit(str, reps)
    local resultStrsList = {};
    local tableCount=0
    string.gsub(str, '[^' .. reps ..']+', function(w) 
        table.insert(resultStrsList, w) 
        tableCount=tableCount+1
        end );
    return resultStrsList,tableCount;
end

local function loadFile(fileName)
    local f = assert(io.open(fileName, 'r'))
    local outData = f:read("*all")
    return outData
end


local function loadCsvFile(filePath) 
    local KEYNAME = 3;
    -- 读取文件
    local data = loadFile(filePath);
    local sourceData={}
    -- 按行划分
    local lineStr,maxRow = rowSplit(data, '\n\r');        --转化为数组
    local maxCol
    for  i = 1,maxRow do
         local line,columns=linesplit(lineStr[i],",") 
         if not maxCol then
            maxCol=columns
         end
         table.insert(sourceData,line)    
    end

    return sourceData,maxRow,maxCol
end


return loadCsvFile
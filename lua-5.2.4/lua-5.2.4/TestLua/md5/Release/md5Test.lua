local md5 = require "md5"
local str = md5.sum("HHHHHHHHHa")
local s =  string.gsub(str, ".", function (c)
           return string.format("%02x", string.byte(c))
         end)
print(s)

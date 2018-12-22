-- Copyright (c) 2018, xiedacon.

local cjson = require "cjson"

_G.Array = require "utility.array"
_G.Object = require "utility.object"
_G.String = require "utility.string"
_G.Function = require "utility.function"
_G.utility = require "utility"
_G.test = function(v1, v2, skip)
    if type(v1) == "table" then v1 = cjson.encode(v1) end
    if type(v2) == "table" then v2 = cjson.encode(v2) end
    
    local ok = skip or pcall(assert, tostring(v1) == tostring(v2))

    if not ok then
        print("Assert failed: \n"
            .. "  except: " .. tostring(v2) .. "\n"
            .. "  accept: " .. tostring(v1) .. "\n")
    end
end

local function popen(command, n)
    if not n then n = 3 end
    local result, err

    for i = 1, n do
        local file = io.popen(command)
        result, err = file:read("*a")
        file:close()

        if err and err == "Interrupted system call" then
        else
            break
        end
    end

    return result, err
end

local index = #popen([[pwd]], 100) + 6
local files = popen([[find $PWD/test | sort | grep \\.lua]], 100)

local current = 1
while(current <= #files) do
    local from, to = string.find(files, "\n", current, true)
    if to == nil then
        from = #files
        to = #files
    end

    local file = string.sub(files, current, from - 1)
    local name = string.sub(file, index, #file - 4)
    
    print("Test: " .. name)

    local ok, fn = pcall(loadfile, file)
    if ok then
        ok = pcall(fn)
        if not ok then
            print("Failed to execute " .. name)
        end
    else
        print("Failed to load " .. name)
    end

    current = to + 1
end

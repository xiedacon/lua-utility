-- Copyright (c) 2018, xiedacon.

local Array = require "utility.array"

local String = {}

function String.endsWith(s, subfix)
    return string.sub(s, #s - #subfix + 1, #s) == subfix
end

function String.replace(s, str1, str2)
    return table.concat(String.split(s, str1), str2)
end

function String.slice(s, from, to)
    local len = #s

    from = from or 1
    if from < 0 then from = len + from + 1 end
    if from < 0 then from = 1 end

    to = to or (len + 1)
    if to < 1 then 
        to = len + to
    elseif to > len + 1 then
        to = len
    else
        to = to - 1
    end

    return string.sub(s, from, to)
end

function String.split(s, delimiter)
    local arr = Array()

    if delimiter == "" then
        for i = 1, #s do
            arr:push(string.sub(s, i, i))
        end

        return arr
    end

    local i = 1
    local current = 1
    s = s .. delimiter
    while(current < #s) do
        local from, to = string.find(s, delimiter, current, true)
        
        arr:push(string.sub(s, current, from - 1))
        current = to + 1
        i = i + 1
    end

    return arr
end

function String.startsWith(s, prefix)
    return string.sub(s, 1, #prefix) == prefix
end

function String.trim(s)
    return s:gsub("^%s*(.-)%s*$", "%1")
end

function String.trimLeft(s)
    return s:gsub("^%s*(.-)$", "%1")
end

function String.trimRight(s)
    return s:gsub("^(.-)%s*$", "%1")
end

return String

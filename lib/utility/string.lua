-- Copyright (c) 2018, xiedacon.

local Array = require "utility.array"

local String = { __type = "utility.string" }

function String.endsWith(s, subfix)
    return string.sub(s, #s - #subfix + 1, #s) == subfix
end

function String.replace(s, str1, str2)
    s = table.concat(String.split(s, str1), str2)

    if str1 == "" then s = table.concat({ str2, s, str2 }, "") end

    return s
end

function String.slice(s, from, to)
    local len = #s

    from = from or 0
    if from < 0 then from = len + from end
    if from < 0 then from = 0 end

    to = to or len
    if to < 0 then
        to = len + to
    elseif to > len then
        to = len
    end

    return string.sub(s, from + 1, to)
end

function String.split(s, delimiter)
    local arr = Array()

    if delimiter == "" then
        for i = 1, #s do
            arr:push(string.sub(s, i, i))
        end

        return arr
    end

    local current = 1
    s = s .. delimiter
    while(current <= #s) do
        local from, to = string.find(s, delimiter, current, true)
        if to == nil then
            from = #s
            to = #s
        end
        
        arr:push(string.sub(s, current, from - 1))
        current = to + 1
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

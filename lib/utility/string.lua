-- Copyright (c) 2018, xiedacon.
-- Copyright (c) 2023, FreeHomless.

local Array = require "utility.array"

local String = { __type = "utility.string" }

--- Comprobes that string ends with specific subfix.
---
--- @param s string
--- @param subfix string
--- @return boolean
function String.endsWith(s, subfix)
    return string.sub(s, #s - #subfix + 1, #s) == subfix
end

--- Substitutes all concurrences of str1 in s by str2. Does the same
--- as substr but without regular expressions.
---
--- @param s string
--- @param str1 string Which string must be replaced.
--- @param str2 string By what substitute.
--- @return string
function String.replace(s, str1, str2)
    if type(str1) == "table" then
        local handler = type(str2) == "function" and str2 or function(k) return table.concat({ "$", k }, "") end
        for k, v in pairs(str1) do
            s = table.concat(String.split(s, handler(k)), v)
        end
    else
        s = table.concat(String.split(s, str1), str2)
        if str1 == "" then s = table.concat({ str2, s, str2 }, "") end
    end

    return s
end

--- Does the same as string.sub
---
--- @param s string 
--- @param from number Beginning of the slice.
--- @param to number End of the slice.
--- @return string
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

--- Cuts the string in portions keeping them into a Array to be finally returned.
---
--- @param s string String to split.
--- @param delimiter string
--- @return string
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

--- Check that is starting with specific prefix.
---
--- @param s string String to comprobe.
--- @param prefix string Expression to be searched for.
--- @return boolean
function String.startsWith(s, prefix)
    return string.sub(s, 1, #prefix) == prefix
end

--- Removes all blank characters from beginning or end of the string 
--- until non blank character.
---
--- @param s string
--- @return string
function String.trim(s)
    return s:gsub("^%s*(.-)%s*$", "%1")
end

--- Removes all blank characters at the left of the string.
---
--- @param s string
--- @return string
function String.trimLeft(s)
    return s:gsub("^%s*(.-)$", "%1")
end

--- Removes all blank characters at the right of the string.
---
--- @param s string
--- @return string
function String.trimRight(s)
    return s:gsub("^(.-)%s*$", "%1")
end

--- Evaluates string replacing all the content inside {} by 
--- the result of the evaluation of the expression inside.
---
--- @param s string String to format.
--- @return string Formatted result.
function String.f (s)
    local st, e = string.find(s,'{.+}')
    while (st) do
        local cap = string.sub(s, st + 1, e - 1)
        local callable = load(string.format('return (%s)', cap))
        local result = nil
        if callable then
            local ok; ok, result = pcall(callable)
            if not ok then
                warn(string.format('`%s` could not be executed', cap))
            end
        end
        s = string.sub(s, 1, st - 1) .. result .. string.sub(s,
            e + 1, #s)
        st, e = string.find(s, '{.+}')
    end
    return s
end

return String

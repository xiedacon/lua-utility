-- Copyright (c) 2018, xiedacon.

local String = require "utility.string"

local Object = {}

function Object.assign(...)
    local out = ({...})[1]
    local len = #({...})

    for i = 2, len do
        local obj = ({...})[i]

        if type(obj) == "table" then
            for k, v in pairs(obj) do
                out[k] = obj[k]
            end
        end
    end

    return out
end

function Object.pick(obj, keys)
    local out = {}
    local keyMap = {}

    for _, k in ipairs(keys) do
        keyMap[k] = true
    end

    for k, v in pairs(obj) do
        if keyMap[k] then
            out[k] = obj[k]
        end
    end

    return out
end

function Object.omit(obj, keys)
    local out = {}
    local keyMap = {}

    for _, k in ipairs(keys) do
        keyMap[k] = true
    end

    for k, v in pairs(obj) do
        if not keyMap[k] then
            out[k] = obj[k]
        end
    end

    return out
end

function Object.get(obj, path, def)
    if type(path) == "string" then path = String.split(path, ".") end
    if type(path) ~= "table" then return def end

    for i = 1, #path do
        obj = obj[path[i]]
        if not obj then break end
    end

    return obj or def
end

function Object.set(obj, path, value)
    if type(obj) ~= "table" then return obj end
    if type(path) == "string" then path = String.split(path, ".") end
    if type(path) ~= "table" then return obj end

    local o = obj
    for i = 1, #path - 1 do
        local k = path[i]
        if type(o[k]) ~= "table" then o[k] = {} end
        o = o[k]
    end

    o[path[#path]] = value

    return obj
end

function Object.keys(obj)
    local keys = {}

    for k, v in pairs(obj) do
        table.insert(keys, k)
    end

    return keys
end

function Object.values(obj)
    local values = {}

    for k, v in pairs(obj) do
        table.insert(values, v)
    end

    return values
end

return Object

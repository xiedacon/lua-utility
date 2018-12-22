-- Copyright (c) 2018, xiedacon.

local Array = require "utility.array"
local String = require "utility.string"

local ok, table_new = pcall(require, "table.new")
if not ok or type(table_new) ~= "function" then
    table_new = function() return {} end
end

local ok, table_clear = pcall(require, "table.clear")
if not ok or type(table_new) ~= "function" then
    table_clear = function(tab)
        for k, _ in pairs(tab) do
            tab[k] = nil
        end

        return tab
    end
end

local Object = { __type = "utility.object" }

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
    local out = table_new(0, #keys)
    local keyMap = table_new(0, #keys)

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
    local out = table_new(0, 10)
    local keyMap = table_new(0, #keys)

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
    local keys = Array()

    for k, v in pairs(obj) do
        keys[#keys + 1] = k
    end

    return keys
end

function Object.values(obj)
    local values = Array()

    for k, v in pairs(obj) do
        values[#values + 1] = v
    end

    return values
end

function Object.entries(obj)
    local entries = Array()

    for k, v in pairs(obj) do
        entries[#entries + 1] = Array({ k, v })
    end

    return entries
end

function Object.freeze(obj)
    if type(obj) ~= "table" then return obj end

    local meta = {
        __index = {},
        __newindex = function() end,
        __metatable = "table is frozen"
    }

    for k, v in pairs(obj) do
        meta.__index[k] = Object.freeze(v)
    end

    local old_meta = getmetatable(obj)
    if old_meta == "table is frozen" then return obj end

    if type(old_meta) == "table" then
        if type(old_meta.__index) == "table" then
            for k, v in pairs(old_meta.__index) do
                old_meta.__index[k] = Object.freeze(v)
            end
        end

        setmetatable(meta.__index, old_meta)
    end

    table_clear(obj)
    setmetatable(obj, meta)

    return obj
end

return Object

-- Copyright (c) 2018, xiedacon.

local Array = require "utility.array"
local Object = require "utility.object"

local ok, table_new = pcall(require, "table.new")
if not ok or type(table_new) ~= "function" then
    table_new = function() return {} end
end

local Function = { __type = "utility.function" }

setmetatable(Function, {
    __call = function(self, fn)
        if type(fn) ~= "function" then return nil, "fn should be a function" end
        if fn.__type == Function.__type then return fn end
        local func = {}

        setmetatable(func, {
            __call = function(self, ...)
                return Function.apply(fn, {...})
            end,
            __index = self
        })

        return func
    end
})

function Function:bind(...)
    local fn = self
    local args = Array({...})

    return Function(function(...)
        args = args:concat({...})

        return Function.apply(fn, args)
    end)
end

function Function:call(...)
    local fn = self
    local args = Array({...})

    return Function.apply(fn, args)
end

local function build_func_body(n)
    local args = table_new(n, 0)

    for i = 1, n do
        args[i] = "args[" .. i .. "]"
    end

    return "return fn(" .. table.concat(args, ", ") .. ")"
end

local pre_build = 20
local func_bodys = table_new(pre_build, 0)
for i = 1, pre_build do
    func_bodys[i] = build_func_body(i - 1)
end

function Function:apply(args)
    local fn = self
    local ok, anonymous = pcall(load, func_bodys[#args + 1] or build_func_body(#args), nil, nil, {
        fn = fn,
        args = args
    })

    if ok then
        return anonymous()
    else
        return nil, anonymous
    end
end

return Function

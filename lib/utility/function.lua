-- Copyright (c) 2018, xiedacon.

local Array = require "utility.array"
local Object = require "utility.object"

local Function = {}

setmetatable(Function, {
    __call = function(self, fn)
        if type(fn) ~= "function" then return nil, "fn should be a function" end
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

function Function:apply(args)
    local fn = self
    local args = Array(args)

    return load("return fn(" .. Object.keys(args):map(function(i) return "args[" .. i .. "]" end):join(", ") .. ")", nil, nil, {
        fn = fn,
        args = args
    })()
end

return Function

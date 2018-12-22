-- Copyright (c) 2018, xiedacon.

local utility = {
    _VERSION = "0.2",
    array = require("utility.array"),
    func = require("utility.function"),
    object = require("utility.object"),
    string = require("utility.string")
}

function utility.try(fns, catch)
    if not catch or type(catch) ~= "function" then
        catch = function(err) return nil, err end
    end

    local res
    local err

    for _, fn in ipairs(fns) do
        res, err = fn(res)

        if err then return catch(err) end
    end

    return res
end

function utility.noop() end

function utility.once(fn)
    local done = false

    return function(...)
        if done then
            return
        else
            done = true
            return utility.func.apply(fn, {...})
        end
    end
end

return utility

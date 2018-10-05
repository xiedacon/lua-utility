-- Copyright (c) 2018, xiedacon.

local utility = {
    array = require("utility.array"),
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
end

function utility.noop() end

return utility

-- Copyright (c) 2018, xiedacon.

local res = {}
Array.each({ "a", "b", "c" }, function(v, k, arr)
    table.insert(res, { v, k, arr })
end)
test(
    res,
    {
        { "a", 0, { "a", "b", "c" } },
        { "b", 1, { "a", "b", "c" } },
        { "c", 2, { "a", "b", "c" } }
    }
)

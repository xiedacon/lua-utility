-- Copyright (c) 2018, xiedacon.

local res = {}
test(Array.findIndex({ "a", "b", "c" }, function(v, k, arr)
    table.insert(res, { v, k, arr })
end), -1)
test(
    res,
    {
        { "a", 0, { "a", "b", "c" } },
        { "b", 1, { "a", "b", "c" } },
        { "c", 2, { "a", "b", "c" } }
    }
)

local res = {}
test(Array.findIndex({ "a", "b", "c" }, function(v, k, arr)
    table.insert(res, { v, k, arr })
    return k > 0
end), 1)
test(
    res,
    {
        { "a", 0, { "a", "b", "c" } },
        { "b", 1, { "a", "b", "c" } }
    }
)

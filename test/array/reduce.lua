-- Copyright (c) 2018, xiedacon.

local res = {}
test(Array.reduce({ "a", "b", "c" }, function(r, v, k, arr)
    table.insert(res, { r, v, k, arr })
    return r .. v
end, ""), "abc")
test(
    res,
    {
        { "", "a", 0, { "a", "b", "c" } },
        { "a", "b", 1, { "a", "b", "c" } },
        { "ab", "c", 2, { "a", "b", "c" } }
    }
)

local res = {}
test(Array.reduce({ "a", "b", "c" }, function(r, v, k, arr)
    table.insert(res, { r, v, k, arr })
    r[v] = k
    return r
end, {}), { a = 0, b = 1, c = 2 })
test(
    res,
    {
        { { a = 0, b = 1, c = 2 }, "a", 0, { "a", "b", "c" } },
        { { a = 0, b = 1, c = 2 }, "b", 1, { "a", "b", "c" } },
        { { a = 0, b = 1, c = 2 }, "c", 2, { "a", "b", "c" } }
    }
)

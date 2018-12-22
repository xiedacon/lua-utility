-- Copyright (c) 2018, xiedacon.

local res = {}
test(Array.map({ "a", "b", "c" }, function(v, k, arr)
    table.insert(res, { v, k, arr })
    return v .. "map"
end), { "amap", "bmap", "cmap" })
test(
    res,
    {
        { "a", 0, { "a", "b", "c" } },
        { "b", 1, { "a", "b", "c" } },
        { "c", 2, { "a", "b", "c" } }
    }
)

test(Array.map({ { a = "a" }, { a = "b" }, { a = "c" } }, "a"), { "a", "b", "c" })

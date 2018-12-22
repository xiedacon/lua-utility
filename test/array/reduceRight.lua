-- Copyright (c) 2018, xiedacon.

local res = {}
test(Array.reduceRight({ "a", "b", "c" }, function(r, v, k, arr)
    table.insert(res, { r, v, k, arr })
    return r .. v
end, ""), "cba")
test(
    res,
    {
        { "", "c", 2, { "a", "b", "c" } },
        { "c", "b", 1, { "a", "b", "c" } },
        { "cb", "a", 0, { "a", "b", "c" } }
    }
)

local res = {}
test(Array.reduceRight({ "a", "b", "c" }, function(r, v, k, arr)
    table.insert(res, { r, v, k, arr })
    r[v] = k
    return r
end, {}), { c = 2, b = 1, a = 0 })
test(
    res,
    {
        { { c = 2, b = 1, a = 0 }, "c", 2, { "a", "b", "c" } },
        { { c = 2, b = 1, a = 0 }, "b", 1, { "a", "b", "c" } },
        { { c = 2, b = 1, a = 0 }, "a", 0, { "a", "b", "c" } }
    }
)

-- Copyright (c) 2018, xiedacon.

test(
    Object.entries({ a = "aa", b = "bb", c = "cc" }),
    { { "a", "aa" }, { "b", "bb" }, { "c", "cc" } },
    true -- pairs() order by inner hash, it's hard to predict, so skip it
)

test(
    Object.entries({}),
    {}
)

-- Copyright (c) 2018, xiedacon.

test(
    Object.keys({ a = "aa", b = "bb", c = "cc" }),
    { "a", "b", "c" },
    true -- pairs() order by inner hash, it's hard to predict, so skip it
)

test(
    Object.keys({}),
    {}
)

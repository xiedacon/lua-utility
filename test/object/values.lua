-- Copyright (c) 2018, xiedacon.

test(
    Object.values({ a = "aa", b = "bb", c = "cc" }),
    { "aa", "bb", "cc" },
    true -- pairs() order by inner hash, it's hard to predict, so skip it
)

test(
    Object.values({}),
    {}
)

-- Copyright (c) 2018, xiedacon.

test(
    Object.values({ a = "aa", b = "bb", c = "cc" }),
    { "bb", "aa", "cc" }
)

test(
    Object.values({}),
    {}
)

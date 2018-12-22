-- Copyright (c) 2018, xiedacon.

test(
    Object.entries({ a = "aa", b = "bb", c = "cc" }),
    { { "b", "bb" }, { "a", "aa" }, { "c", "cc" } }
)

test(
    Object.entries({}),
    {}
)

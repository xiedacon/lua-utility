-- Copyright (c) 2018, xiedacon.

test(
    Object.keys({ a = "aa", b = "bb", c = "cc" }),
    { "b", "a", "c" },
    true
)

test(
    Object.keys({}),
    {}
)

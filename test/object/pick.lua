-- Copyright (c) 2018, xiedacon.

test(
    Object.pick({ a = "a", b = "b", c = "c" }, { "a", "b" }),
    { b = "b", a = "a" }
)

test(
    Object.pick({ a = "a", b = "b", c = "c" }, {}),
    {}
)

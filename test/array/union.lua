-- Copyright (c) 2018, xiedacon.

test(
    Array.union({ "a" }, { "b" }, { "c" }),
    { "a", "b", "c" }
)

test(
    Array.union({ "a", "b" }, { "b" }, { "c" }),
    { "a", "b", "c" }
)

test(
    Array.union({ "a" }, { "b", "b" }, { "c" }),
    { "a", "b", "c" }
)

test(
    Array.union({ "a" }, { "b" }, { "b", "c" }),
    { "a", "b", "c" }
)

test(
    Array.union({ "a", "b" }, { "b", "c" }, { "c", "a" }),
    { "a", "b", "c" }
)

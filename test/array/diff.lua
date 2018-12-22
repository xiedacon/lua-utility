-- Copyright (c) 2018, xiedacon.

local l, r = Array.diff({ "a", "b", "c" }, { "d", "e", "f" })
test(
    l,
    { "a", "b", "c" }
)
test(
    r,
    { "d", "e", "f" }
)

local l, r = Array.diff({ "a", "b", "c", "d" }, { "d", "e", "f" })
test(
    l,
    { "a", "b", "c" }
)
test(
    r,
    { "e", "f" }
)

local l, r = Array.diff({ "a", "b", "c", "e" }, { "d", "e", "f" })
test(
    l,
    { "a", "b", "c" }
)
test(
    r,
    { "d", "f" }
)

local l, r = Array.diff({ "a", "b", "c" }, { "a", "d", "e", "f" })
test(
    l,
    { "b", "c" }
)
test(
    r,
    { "d", "e", "f" }
)

local l, r = Array.diff({ "a", "b", "c" }, { "b", "d", "e", "f" })
test(
    l,
    { "a", "c" }
)
test(
    r,
    { "d", "e", "f" }
)

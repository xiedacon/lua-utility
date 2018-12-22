-- Copyright (c) 2018, xiedacon.

local arr = Array({ "a", "b", "c" })
test(arr:push("d"), 4)
test(
    arr,
    { "a", "b", "c", "d" }
)

local arr = Array({ "a", "b", "c" })
test(arr:push("d", "e", "f"), 6)
test(
    arr,
    { "a", "b", "c", "d", "e", "f" }
)

local arr = Array({ "a", "b", "c" })
test(arr:push(), 3)
test(
    arr,
    { "a", "b", "c" }
)

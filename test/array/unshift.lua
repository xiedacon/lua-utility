-- Copyright (c) 2018, xiedacon.

local arr = Array({ "a", "b", "c" })
test(arr:unshift("d"), 4)
test(
    arr,
    { "d", "a", "b", "c" }
)

local arr = Array({ "a", "b", "c" })
test(arr:unshift("d", "e", "f"), 6)
test(
    arr,
    { "d", "e", "f", "a", "b", "c" }
)

local arr = Array({ "a", "b", "c" })
test(arr:unshift(), 3)
test(
    arr,
    { "a", "b", "c" }
)

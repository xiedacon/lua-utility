-- Copyright (c) 2018, xiedacon.

local arr = Array({ "a", "b", "c" })
test(arr:pop(), "c")
test(
    arr,
    { "a", "b" }
)

local arr = Array()
test(arr:pop(), nil)
test(
    arr,
    {}
)

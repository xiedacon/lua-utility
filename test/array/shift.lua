-- Copyright (c) 2018, xiedacon.

local arr = Array({ "a", "b", "c" })
test(arr:shift(), "a")
test(
    arr,
    { "b", "c" }
)

local arr = Array()
test(arr:shift(), nil)
test(
    arr,
    {}
)

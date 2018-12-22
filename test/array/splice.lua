-- Copyright (c) 2018, xiedacon.

local arr = Array({ "a", "b", "c" })
test(arr:splice(), {})
test(arr, { "a", "b", "c" })

local arr = Array({ "a", "b", "c" })
test(arr:splice(0), { "a", "b", "c" })
test(arr, {})

local arr = Array({ "a", "b", "c" })
test(arr:splice(0, 1), { "a" })
test(arr, { "b", "c" })

local arr = Array({ "a", "b", "c" })
test(arr:splice(-1, 1), { "c" })
test(arr, { "a", "b" })

local arr = Array({ "a", "b", "c" })
test(arr:splice(-2, -1), { "b", "c" })
test(arr, { "a" })

local arr = Array({ "a", "b", "c" })
test(arr:splice(1, 1, "d"), { "b" })
test(arr, { "a", "d", "c" })

local arr = Array({ "a", "b", "c" })
test(arr:splice(1, 1, "d", "e"), { "b" })
test(arr, { "a", "d", "e", "c" })

local arr = Array({ "a", "b", "c", "d" })
test(arr:splice(1, 2, "d", "e"), { "b", "c" })
test(arr, { "a", "d", "e", "d" })

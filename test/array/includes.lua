-- Copyright (c) 2018, xiedacon.

test(Array.includes({ "a", "b", "c" }, "b"), true)
test(Array.includes({ "a", "b", "c" }, "d"), false)
test(Array.includes({ "a", "b", "c" }, "b", 1), true)
test(Array.includes({ "a", "b", "c" }, "b", 2), false)
test(Array.includes({ "a", "b", "c" }, "b", -1), false)
test(Array.includes({ "a", "b", "c" }, "b", -2), true)

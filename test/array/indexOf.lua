-- Copyright (c) 2018, xiedacon.

test(Array.indexOf({ "a", "b", "c" }, "a"), 0)
test(Array.indexOf({ "a", "b", "c" }, "b"), 1)
test(Array.indexOf({ "a", "b", "c" }, "c"), 2)
test(Array.indexOf({ "a", "b", "c" }, "b", 1), 1)
test(Array.indexOf({ "a", "b", "c" }, "b", 2), -1)
test(Array.indexOf({ "a", "b", "c" }, "b", -1), -1)
test(Array.indexOf({ "a", "b", "c" }, "b", -2), 1)

-- Copyright (c) 2018, xiedacon.

test(Array.lastIndexOf({ "a", "b", "c", "a" }, "a"), 3)
test(Array.lastIndexOf({ "a", "b", "c", "a" }, "b"), 1)
test(Array.lastIndexOf({ "a", "b", "c", "a" }, "c"), 2)
test(Array.lastIndexOf({ "a", "b", "c", "a" }, "a", 1), 0)
test(Array.lastIndexOf({ "a", "b", "c", "a" }, "a", 3), 0)
test(Array.lastIndexOf({ "a", "b", "c", "a" }, "a", -1), 0)

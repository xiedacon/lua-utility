-- Copyright (c) 2018, xiedacon.

test(Array.join({ "a", "b", "c" }), "a,b,c")
test(Array.join({ "a", "b", "c" }, ""), "abc")
test(Array.join({ "a", "b", "c" }, ", "), "a, b, c")
test(Array.join({}, ", "), "")

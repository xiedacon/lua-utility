-- Copyright (c) 2018, xiedacon.

test(Array.slice({ "a", "b", "c" }), { "a", "b", "c" })
test(Array.slice({ "a", "b", "c" }, 1), { "b", "c" })
test(Array.slice({ "a", "b", "c" }, 1, 0), {})
test(Array.slice({ "a", "b", "c" }, 1, -1), { "b" })
test(Array.slice({ "a", "b", "c" }, -2, -1), { "b" })
test(Array.slice({ "a", "b", "c" }, 0, -2), { "a" })

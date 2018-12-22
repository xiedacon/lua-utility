-- Copyright (c) 2018, xiedacon.

test(Array.fill({ "a", "b", "c" }, 1), { 1, 1, 1 })
test(Array.fill({ "a", "b", "c" }, 1, 0, 1), { 1, "b", "c" })
test(Array.fill({ "a", "b", "c" }, 1, -1), { "a", "b", 1 })
test(Array.fill({ "a", "b", "c" }, 1, -2, -1), { "a", 1, "c" })
test(Array.fill({ "a", "b", "c" }, 1, 0, -2), { 1, "b", "c" })

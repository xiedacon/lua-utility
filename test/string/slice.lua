-- Copyright (c) 2018, xiedacon.

test(String.slice("abc"), "abc")
test(String.slice("abc", 1), "bc")
test(String.slice("abc", 1, 0), "")
test(String.slice("abc", 1, -1), "b")
test(String.slice("abc", -2, -1), "b")
test(String.slice("abc", 0, -2), "a")

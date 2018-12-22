-- Copyright (c) 2018, xiedacon.

test(String.split("test", "e"), { "t", "st" })
test(String.split("test", "es"), { "t", "t" })
test(String.split("test", ""), { "t", "e", "s", "t" })
test(String.split("", "a"), { "" })

-- Copyright (c) 2018, xiedacon.

test(String.startsWith("test", "t"), true)
test(String.startsWith("test", "te"), true)
test(String.startsWith("test", "ts"), false)
test(String.startsWith("test", ""), true)
test(String.startsWith("", ""), true)

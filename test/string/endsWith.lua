-- Copyright (c) 2018, xiedacon.

test(String.endsWith("test", "t"), true)
test(String.endsWith("test", "st"), true)
test(String.endsWith("test", "et"), false)
test(String.endsWith("test", ""), true)
test(String.endsWith("", ""), true)

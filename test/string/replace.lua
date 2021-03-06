-- Copyright (c) 2018, xiedacon.

test(String.replace("test", "e", "s"), "tsst")
test(String.replace("test", "es", "s"), "tst")
test(String.replace("test", "es", "se"), "tset")
test(String.replace("test", "", "a"), "ataeasata")
test(String.replace("", "a", "b"), "")
test(String.replace("aaaa", "a", ""), "")
test(String.replace("aaaa", "", ""), "aaaa")

test(String.replace("$a$b", {
  a = "aaa",
  b = "bbb"
}), "aaabbb")
test(String.replace("${a}${b}", {
  a = "aaa",
  b = "bbb"
}, function(k)
  return "${" .. k .. "}"
end), "aaabbb")

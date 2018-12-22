-- Copyright (c) 2018, xiedacon.

test(
    Object.omit({ a = "a", b = "b", c = "c" }, { "a", "b" }),
    { c = "c" }
)

-- After cjson.encode the older of fields is changed, so skip it
test(
    Object.omit({ a = "a", b = "b", c = "c" }, {}),
    { a = "a", b = "b", c = "c" },
    true
)

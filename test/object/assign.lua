-- Copyright (c) 2018, xiedacon.

test(
    Object.assign({}, { a = "a" }, { b = "b" }),
    {
        a = "a",
        b = "b"
    }
)

test(
    Object.assign({}, { a = "a" }, { a = "b", b = "b" }),
    {
        a = "b",
        b = "b"
    }
)

test(
    Object.assign({}, { a = "a" }, { a = { a = "a" } }),
    {
        a = {
            a = "a"
        }
    }
)

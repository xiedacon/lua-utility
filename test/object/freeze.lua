-- Copyright (c) 2018, xiedacon.

local obj = { a = "a" }
Object.freeze(obj)

obj.a = "b"
test(obj.a, "a")

obj.b = "b"
test(obj.b, nil)

local obj = { a = { a = "a" } }
Object.freeze(obj)

obj.a.a = "b"
test(obj.a.a, "a")

obj.a.b = "b"
test(obj.a.b, nil)

local a = {}
setmetatable(a, { __index = { a = "a" } })
test(a.a, "a")

local obj = { a = a }
Object.freeze(obj)

obj.a.a = "b"
test(obj.a.a, "a")

obj.a.b = "b"
test(obj.a.b, nil)

test(getmetatable(obj), "table is frozen")
test(getmetatable(obj.a), "table is frozen")

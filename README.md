# lua-utility

[![MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/xiedacon/lua-utility/blob/master/LICENSE)

## Requirements

* cjson

## Usage

* [Base](#Base)
    * try
    * noop
    * once
* [Array](#Array)
    * concat
    * diff
    * each
    * every
    * fill
    * filter
    * find
    * findIndex
    * from
    * includes
    * indexOf
    * join
    * lastIndexOf
    * map
    * pop
    * push
    * reduce
    * reduceRight
    * reverse
    * shift
    * slice
    * some
    * sort
    * splice
    * toString
    * union
    * unshift
* [Function](#Function)
    * apply
    * bind
    * call
* [Object](#Object)
    * assign
    * entries
    * freeze
    * get
    * keys
    * omit
    * pick
    * set
    * values
* [String](#String)
    * endsWith
    * replace
    * slice
    * split
    * startsWith
    * trim
    * trimLeft
    * trimRight

#### Base

```lua
local resty_redis = require "resty.redis"
local utility = require "utility"

function get_redis()
    local redis, err = resty_redis:new()
    if not redis then return nil, err end

    local ok, err = redis:connect("127.0.0.1", 6379)

    if ok then
        return redis 
    else
        return nil, err
    end
end

function close_redis(res)
    local redis = res[0]
    local data = res[1]

    redis:close()

    return data
end

local res, err = utility.try({
    get_redis
    function(red)
        local data, err = redis:get("something")

        return { redis, data }, err
    end,
    close_redis
}, function(err)
    return nil, "some error happened"
end)

utility.noop() -- nothing happend
utility.once(function()
    -- only call once
end)
```

#### Array

This api is similar to [js Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)

```lua
local Array = require "utility.array"

local arr = Array({}) -- {}
local arr1 = Array({ 1, 2, 3 }) -- { 1, 2, 3 }
local arr2 = Array.from({ 1, 2, 3 }) -- { 1, 2, 3 }

arr:concat(arr1)
arr:each(function(value, index, arr) end)
arr:every(function(value, index, arr) end)
arr:fill(1)
arr:filter(function(value, index, arr) end)
arr:find(function(value, index, arr) end)
arr:findIndex(function(value, index, arr) end)
arr:forEach(function(value, index, arr) end)
arr:includes(1)
arr:indexOf(1)
arr:join('-')
arr:lastIndexOf(1)
arr:map(function(value, index, arr) end)
arr:pop()
arr:push(1)
arr:reduce(function(result, value, index, arr) end, 0)
arr:reduceRight(function(result, value, index, arr) end, 0)
arr:reverse()
arr:shift()
arr:slice(0, 1)
arr:some(function(value, index, arr) end)
arr:sort(function(value1, value2) end)
arr:splice(0, 1)
arr:toString()
arr:unshift(1)
arr:diff(arr1) -- arr_only, arr1_only
arr:union(arr1, arr2) -- arr U arr1 U arr2
```

#### Function

```lua
local Function require "utility.function"

local func = Function(function(arg1, arg2, arg3)
    print(arg1 .. " " .. arg2 .. " " .. arg3)
end)

-- 1 2 3
func(1, 2, 3)
-- 1 2 3
func:apply({ 1, 2, 3 })
-- 1 2 4
func:bind(1, 2)(2, 3, 4)
-- 1 2 2 3 4
func:call(1, 2, 3)
```

#### Object

```lua
local Object = require "utility.array"

-- { a = 2, b = 3, c = 2, d = 3 }
Object.assign({
    a = 1,
    b = 1
}, {
    a = 2,
    c = 2
}, {
    b = 3,
    d = 3
})

-- { a = 1, b = 1 }
Object.pick({
    a = 1,
    b = 1,
    c = 1
}, { "a", "b" })

-- { c = 1 }
Object.omit({
    a = 1,
    b = 1,
    c = 1
}, { "a", "b" })

-- 1
Object.get({
    a = {
        a = 1
    },
    b = 1,
    c = 1
}, "a.a") -- or { "a", "a" }

-- 0
Object.get({
    a = 1,
    b = 1,
    c = 1
}, "a.a", 0)

-- { a = { a = 1 } }
Object.set({}, "a.a", 1)

-- { a = { a = 1 } }
Object.set({}, { "a", "a" }, 1)

-- { "a", "b", "c" }
Object.keys({
    a = 1,
    b = 2,
    c = 3
})

-- { 1, 2, 3 }
Object.values({
    a = 1,
    b = 2,
    c = 3
})

-- { { "a", 1 }, { "b", 2 }, { "c", 3 } }
Object.entries({
    a = 1,
    b = 2,
    c = 3
})

local obj = { a = "a" }
Object.freeze(obj) -- after this, obj is not editable

obj.a = "b" -- { a = "a" }
obj.b = "b" -- { a = "a" }
```

#### String

```lua
local String = require "utility.string"

String.endsWith("test.lua", ".lua") -- true
String.endsWith("test.lua", ".lu") -- false
String.replace("test.lua", ".", "-") -- "test-lua"
String.slice("test.lua", 1, 5) -- test
String.split("test.lua", ".") -- { "test", "lua" }
String.startsWith("test.lua", "test") -- true
String.startsWith("test.lua", "est") -- false
String.trim("  test.lua  ") -- "test.lua"
String.trimLeft("  test.lua  ") -- "test.lua  "
String.trimRight("  test.lua  ") -- "  test.lua"
```

## Tests

```shell
export LUA_PATH="/path/to/lua-utility/lib/?.lua;;"
export LUA_CPATH="/path/to/lua-cjson/?.so;;"

lua test.lua
```

## License

[MIT License](https://github.com/xiedacon/lua-utility/blob/master/LICENSE)

Copyright (c) 2018 xiedacon

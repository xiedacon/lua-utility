-- Copyright (c) 2018, xiedacon.

local cjson = require "cjson.safe"

local ok, table_new = pcall(require, "table.new")
if not ok or type(table_new) ~= "function" then
    table_new = function() return {} end
end

local Array = {
    __type = "utility.array",
    default_size = 10
}

local proto = {
    __index = Array,
    __tostring = function(self)
        return self:toString()
    end
}

setmetatable(Array, {
    __call = function(self, arr)
        if type(arr) == "nil" or type(arr) == "number" then arr = table_new(arr or Array.default_size, 0) end
        if type(arr) ~= "table" then return nil, "arr should be table" end
        if arr.__type == Array.__type then return arr end
        
        setmetatable(arr, proto)

        return arr
    end
})

function parse_from_to(from, to, len)
    from = from or 0
    if from < 0 then from = len + from end
    if from < 0 then from = 0 end

    to = to or len
    if to < 0 then 
        to = len + to
    elseif to > len then
        to = len
    end
    
    return from + 1, to
end

function Array.from(arr)
    if type(arr) ~= "table" then
        return nil, "arr should be table"
    else
        return Array(arr)
    end
end

function Array.concat(...)
    local out = Array(#{...} * Array.default_size)

    local i = 1
    for _, arr in ipairs({...}) do
        for _, v in ipairs(arr) do
            out[i] = v
            i = i + 1
        end
    end

    return out
end

function Array:each(fn)
    for i, v in ipairs(self) do
        fn(v, i - 1, self)
    end
end

function Array:every(fn)
    local out = true
    local i = 1
    local len = #self

    while(out and i <= len) do
        out = fn(self[i], i - 1, self)
        i = i + 1
    end

    return out
end

function Array:fill(v, from, to)
    from, to = parse_from_to(from, to, #self)
    if from > to then return self end

    for i = from, to do
        self[i] = v
    end

    return self
end

function Array:filter(fn)
    local out = Array(#self)

    local i = 1
    for j, v in ipairs(self) do
        if fn(v, j - 1, self) then
            out[i] = v
            i = i + 1
        end
    end

    return out
end

function Array:find(fn)
    return self[Array.findIndex(self, fn) + 1]
end

function Array:findIndex(fn)
    for i, v in ipairs(self) do 
        if fn(v, i - 1, self) then
            return i - 1
        end
    end

    return -1
end

Array.forEach = Array.each

function Array.includes(self, v, from)
    return Array.indexOf(self, v, from) >= 0
end

function Array:indexOf(v, from)
    from, to = parse_from_to(from, #self, #self)

    for i = from, to do 
        if v == self[i] then
            return i - 1
        end
    end

    return -1
end

function Array:join(delimiter)
    return table.concat(self, delimiter or ",")
end

function Array:lastIndexOf(v, to)
    local from, to = parse_from_to(0, to, #self)

    while(to >= from) do
        if v == self[to] then
            return to - 1
        end

        to = to - 1
    end

    return -1
end

function Array:map(fn)
    if type(fn) == "string" then 
        local path = fn
        fn = function (v, i, arr) 
            return v[path]
        end
    end

    local out = Array(#self)
    for i, v in ipairs(self) do
        out[i] = fn(v, i - 1, self)
    end

    return out
end

function Array:pop()
    return table.remove(self)
end

function Array:push(...)
    local i = #self + 1
    for _, v in ipairs({...}) do
        self[i] = v
        i = i + 1
    end

    return #self
end

function Array:reduce(fn, default)
    local out = default
    for i, v in ipairs(self) do
        out = fn(out, v, i - 1, self)
    end

    return out
end

function Array:reduceRight(fn, default)
    local out = default
    local i = #self

    while(i > 0) do
        out = fn(out, self[i], i - 1, self)
        i = i - 1
    end

    return out
end

function Array:reverse()
    local i = #self

    if i % 2 == 1 then
        i = (i - 1) / 2
    else
        i = i / 2
    end

    while(i > 0) do
        local t = self[i]
        self[i] = self[#self - i + 1]
        self[#self - i + 1] = t

        i = i - 1
    end

    return self
end

function Array:shift()
    return table.remove(self, 1)
end

function Array:slice(from, to)
    from, to = parse_from_to(from, to, #self)
    if from > to then return Array() end
    
    local total = to - from + 1
    local out = Array(total)
    for i = 1, total do
        out[i] = self[i + from - 1]
    end

    return out
end

function Array:some(fn)
    for i, v in ipairs(self) do
        if fn(v, i - 1, self) then
            return true
        end
    end

    return false
end

function Array:sort(fn)
    table.sort(self, fn)
    return self
end

function Array:splice(from, count, ...)
    if from == nil then return Array() end

    from, to = parse_from_to(from, #self, #self)
    if type(count) == "number" and count >= 0 then
        to = from + count - 1
        if to > #self then to = #self end
    end
    
    local size = #self
    local total = to - from + 1
    local out = Array(total)
    for i = 1, total do
        out[i] = self[i + from - 1]
        self[i + from - 1] = nil
    end

    local x = #({...}) - total
    if x > 0 then
        local step
        for i = to + 1, size do
            step = size + 1 - i + to
            self[step + x] = self[step]
            self[step] = nil
        end
    elseif x < 0 then
        local step
        for i = to + 1, size do
            step = i
            self[step + x] = self[step]
            self[step] = nil
        end
    end

    if type(count) ~= "number" and count ~= nil then
        self[from] = count
        from = from + 1
    end

    for i = from + 1, from + #({...}) do
        self[i - 1] = ({...})[i - from]
    end

    return out
end

function Array:toString()
    return cjson.encode(self)
end

function Array:unshift(...)
    local i = #({...})
    while(i > 0) do
        table.insert(self, 1, ({...})[i])
        i = i - 1
    end

    return #self
end

function Array.diff(self, arr)
    local place_holder = "__array_diff_place_holder__"
    local l = Array.slice(self)
    local r = Array(#arr)

    local map = table_new(0, 10)
    for i, v in ipairs(l) do
        if map[v] then
            map[v][#map[v] + 1] = i
        else
            map[v] = { i }
        end
    end

    for _, v in ipairs(arr) do
        if map[v] then
            for _, i in ipairs(map[v]) do
                l[i] = place_holder
            end
        else
            r[#r + 1] = v
        end
    end

    return l:filter(function(i) return i ~= place_holder end), r
end

function Array.union(...)
    local out = Array()

    local map = table_new(0, 10)
    for _, arr in ipairs({...}) do
        for _, v in ipairs(arr) do
            if not map[v] then
                map[v] = true
                out[#out + 1] = v
            end
        end
    end

    return out
end

return Array

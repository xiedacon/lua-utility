-- Copyright (c) 2018, xiedacon.

local fn = utility.once(function()
  return "only once"
end)

test(fn(), "only once")
test(fn(), nil)
test(fn(), nil)
test(fn(), nil )

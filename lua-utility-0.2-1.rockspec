package = "lua-utility"
version = "0.2-1"
source = {
   url = "git+https://github.com/xiedacon/lua-utility.git",
   tag = "v0.2"
}
description = {
   summary = "A collection of useful utilities while writing Lua.",
   detailed = [[
      A collection of useful utilities while writing Lua.
   ]],
   homepage = "https://github.com/xiedacon/lua-utility",
   license = "MIT"
}
dependencies = {
   "lua >= 5.1",
   "lua-cjson"
}
build = {
   type = "builtin",
   modules = {
      ["utility"] = "lib/utility.lua",
      ["utility.array"] = "lib/utility/array.lua",
      ["utility.function"] = "lib/utility/function.lua",
      ["utility.object"] = "lib/utility/object.lua",
      ["utility.string"] = "lib/utility/string.lua"
   }
}

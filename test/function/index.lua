-- Copyright (c) 2018, xiedacon.

test(Function(function(...)
    test({...}, { 1, 2, 3 })

    return "call function"
end)(1, 2, 3), "call function")

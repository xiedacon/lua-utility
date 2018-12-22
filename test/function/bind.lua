-- Copyright (c) 2018, xiedacon.

test(Function.bind(function(...)
    test({...}, { 1, 2, 3, 4, 5, 6 })

    return "call function"
end, 1, 2, 3)(4, 5, 6), "call function")

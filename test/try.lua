-- Copyright (c) 2018, xiedacon.

test(utility.try({
    function()
        return "a"
    end,
    function(res)
        test(res, "a")
        return "b"
    end,
    function(res)
        test(res, "b")
        return "c"
    end
}, function(err)
    print("This should never execute")
end), "c")

test(utility.try({
    function()
        return "a"
    end,
    function(res)
        test(res, "a")
        return nil, "error"
    end,
    function(res)
        print("This should never execute")
    end
}, function(err)
    test(err, "error")
    return "error catched"
end), "error catched")

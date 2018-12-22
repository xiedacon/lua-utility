-- Copyright (c) 2018, xiedacon.

test(
    Object.set({}, { "a", "a", "a", "a" }, "a"),
    {
        a = {
            a = {
                a = {
                    a = "a"
                }
            }
        }
    }
)

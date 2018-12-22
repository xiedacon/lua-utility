-- Copyright (c) 2018, xiedacon.

test(
    Object.get({
        a = {
            a = {
                a = {
                    a = "a"
                }
            }
        }
    }, { "a", "a", "a", "a" }),
    "a"
)

test(
    Object.get({
        a = {
            a = {
                a = {
                    a = "a"
                }
            }
        }
    }, "a.a.a.a"),
    "a"
)

test(
    Object.get({
        a = {
            a = {
                a = {
                    a = "a"
                }
            }
        }
    }, "a.a.a.a.a", "aaaa"),
    "aaaa"
)

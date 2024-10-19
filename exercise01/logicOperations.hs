and:: (Bool, Bool) -> Bool
and (a, b) = (a && b)

or:: (Bool, Bool) -> Bool
or (a, b) = (a || b)

xor:: (Bool, Bool) -> Bool
xor (a, b) = not (a == b)

neg:: Bool -> Bool
neg a = not a

first:: (Bool, Bool) -> Bool
first (a, b) = a

second:: (Bool, Bool) -> Bool
second (a, b) = b

halfAdder:: (Bool, Bool) -> (Bool, Bool)
halfAdder(v1, v2) = (xor(v1, v2), Main.and(v1, v2))

fullAdder:: (Bool, Bool, Bool) -> (Bool, Bool)
fullAdder(v1, v2, carry) = (first (halfAdder(v1, first (halfAdder(v2, carry)))), Main.or (second (halfAdder(v1, first (halfAdder(v2, carry)))), second (halfAdder(v2, carry))))



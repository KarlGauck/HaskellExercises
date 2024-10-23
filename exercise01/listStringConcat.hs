listStringConcat:: [String] -> String
listStringConcat = foldr (++) ""
data BTree a = Node (BTree a) a (BTree a) | Empty

mapTree :: (a -> b) -> BTree a -> BTree b
mapTree f (Node left value right)  = Node (mapTree f left) (f value) (mapTree f right)
mapTree f Empty = Empty

toString :: BTree Int -> String
toString (Node left val right) = "(" ++ toString left ++ " <- " ++ show val ++ " -> " ++ toString right ++ ")"
toString Empty = "_"

display :: BTree Int -> IO ()
display (Node left val right) = print (toString (Node left val right))

main = display (mapTree (\x -> x + 1) (Node (Node Empty 3 Empty) 5 (Node Empty 8 Empty)))
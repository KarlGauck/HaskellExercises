data Term = Int |
            Monom Int Int |
            Add Term Term |
            Mul Term Term |
            Div Term Term

diff :: Term -> Term
diff (Monom x y) = Mul (Monom y 1) (Monom x (y-1))
diff (Mul x y) = Add (Mul (diff x) y) (Mul x (diff y))
diff (Add x y) = Add (diff x) (diff y)
diff (Div u v) = Div (Add (Mul (diff u) v) (Mul (Monom (-1) 1) (Mul u (diff v)))) (Mul v v)


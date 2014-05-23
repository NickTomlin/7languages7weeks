# run with swipl
likes(wallace, cheese).
likes(grommit, cheese).
likes(wendelone, sheep).

friend(X, Y) :- \+(X = Y), likes(X, Z), likes(Y, Z).

% --- My brain sometimes find recursion to be strange.
% The most practical advice on imperative recursion i've received is: "start with the end"
% the examples here are similar in that they establish a base rule that provides a way for the recursion to eventually unify
% thinking about it that way somehow makes it better. Such is life.
count(0, []).
count(Count, [_|Tail]) :- count(TailCount, Tail), Count is TailCount + 1.

sum(0, []).
sum(Total, [Head|Tail]) :- sum(Sum,Tail), Total is Head + Sum, print(Total).

% awesome
average(Average, List) :- sum(Sum, List), count(Count, List), Average is Sum/Count.

add(X) :- X is X + 1.
foo(NUM) :- add(NUM), print(NUM).

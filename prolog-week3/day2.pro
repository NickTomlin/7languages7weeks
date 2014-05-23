/*
=== Find

% - Some implementations of a Fibonacci series and factorials. How do they work?
  % 1. http://www.cs.utexas.edu/~cannata/cs345/Class%20Notes/Prolog%20examples.pdf
% - A real-world community using Prolog. What problems are they solving with it today?
  % prolog seems to be well suited to model environments
    % - http://www.drdobbs.com/parallel/the-practical-application-of-prolog/184405220
  % Here is an example of a web stack:
    % http://hcs.science.uva.nl/projects/SWI-Prolog/articles/mn9c.pdf

/*
=== Do
*/

% == Reverse the elements of a list.
% using SWIPL built-in ^^:
% Reverse([1,2,3,4], Reversed)
% Reversed = [4,3,2,1]

% our base case
rev([], X, X).
% this seems overly verbose YOLO
rev([HeadA|TailA], [HeadB|TailB],  X) :- rev(TailA, [HeadA|[HeadB|TailB]], X).
rev([Head|Tail], X) :- rev(Tail, [Head], X).

/* A more optimized version from SO:
reverse(Xs, Ys):- reverse(Xs, [], Ys).

reverse([], Ys, Ys).
reverse([X|Xs], Acc, Ys):- reverse(Xs, [X|Acc], Ys).
*/

% == find the smallest element of a list
% I cheated on this one :|
min([X], X).
min([Current,Next|Rest], Min) :-  Current > Next, min([Next|Rest], Min).
min([Current,Next|Rest], Min) :- Current =< Next, min([Current|Rest], Min).

% == Sort the elements of a list.
% didn't cheat on this one. Prolog master.
sort_list([], Sorted, Sorted).
sort_list([Head,Next|Tail], [], Sorted) :- Next > Head, sort_list([Head|Tail], [Next], Sorted).
sort_list([Head,Next|Tail], [], Sorted) :- Head =< Next, sort_list([Next|Tail], [Head], Sorted).
sort_list([Head|Tail], Sorted) :- sort_list([Head|Tail], [], Sorted).

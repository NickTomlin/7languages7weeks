lesser(A,B) :- A > B.
greatest([Head|Tail], X) :- lesser(Tail, X).

member(Element, [Element|List]).
member(Element, [AnElement|RestList]):- member(Element, RestList).


on(Item,[Item|Rest]).

on(Item,[DisregardHead|Tail]):-
  on(Item,Tail).

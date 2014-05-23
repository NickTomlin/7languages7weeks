/*
=== Find

- A prolog tutorial
  - http://www.doc.gold.ac.uk/~mas02gw/prolog_tutorial/prologpages/vars.html
  - https://bernardopires.com/2013/10/try-logic-programming-a-gentle-introduction-to-prolog/
- An online users group
  - https://groups.google.com/forum/#!forum/comp.lang.prolog
- A reference for the version of prolog you are using:
  - http://www.swi-prolog.org/pldoc/doc_for?object=manual
  - http://www.cse.unsw.edu.au/~billw/prologdict.html

*** helpful stuff ***
to see what a prolog rule is doing, one can use the listing rule:

```
?- listing(reverse).

reverse(A, B) :-
reverse(A, [], B, B).

lists:reverse(A, B) :-
reverse(A, [], B, B).

lists:reverse([], A, A, []).
lists:reverse([B|A], C, D, [_|E]) :-
reverse(A, [B|C], D, E).

reverse(A, B) :-
reverse(A, [], B, B).

reverse(A, B) :-
reverse(A, [], B, B).

reverse(A, B) :-
reverse(A, [], B, B).

reverse(A, B) :-
reverse(A, [], B, B).

```
*/

/*
=== Do
*/
% ==  Make a simple knowledge base. Represent some of your favorite books and authors.
wrote(hemmingway, the_sun_also_rises).
wrote(hemmingway, farewell_to_arms).
wrote(camus, the_plague).
wrote(atwood, oryx_and_crake).
wrote(atwood, the_blind_assassin).

% == Find all books in your knowledge base written by one author.
% ?- wrote(hemmingway, Books).

% == Make a knowledge base representing musicians and instruments. Also represent musicians and their genre of music.

musician(jimi_hendrix, rock, guitar).
musician(beck, alternative, guitar).
musician(ben_folds, pop, piano).
musician(bach, classical, piano).

% == Find all musicians who play the guitar.
plays(Instrument) :-
  musician(Name, _, Instrument),
  print(Name).
% ?- plays(guitar)

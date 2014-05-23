%% ---
%%  Excerpted from "Seven Languages in Seven Weeks",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material,
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose.
%%  Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
%%---
foo(red, green). foo(red, blue).
foo(green, red). foo(green, blue).
foo(blue, red). foo(blue, green).

coloring(Alabama, Mississippi, Georgia, Tennessee, Florida) :-
  foo(Mississippi, Tennessee),
  foo(Mississippi, Alabama),
  foo(Alabama, Tennessee),
  foo(Alabama, Mississippi),
  foo(Alabama, Georgia),
  foo(Alabama, Florida),
  foo(Georgia, Florida),
  foo(Georgia, Tennessee).


-module(day1).
-export([words/1]).
-export([count/0]).
-export([msg/1]).

% Write a function that uses recursion to return the number of words in a string.
% is this cheating? probably (case statments are part of chapter 2)
% it's also fragile, "foo bar baz " = 4 words (since space is seen as a delim)
words([], Sum) -> Sum;
words([Head|Tail], Sum) ->
  case Head of
    32 -> words(Tail, Sum + 1);
    _ ->  words(Tail, Sum)
 end.
words("") -> 0;
words(" ") -> 0;
words(String) -> words(String, 1).

% Write a function that uses recursion to count to ten.
count(11) -> null;
count(N) -> io:format("Number: ~p~n", [N]), count(N + 1).
count() -> count(0).

% Write a function that uses matching to selectively print “success” or “error: message” given input of the form {error, Message} or suc- cess.
msg(success) -> io:format("success");
msg({error, Message}) -> io:format("error: ~s~n", [Message]).

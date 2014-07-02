-module(day2).
-export([pick/2]).
-export([items_with_price/1]).

% Consider a list of keyword-value tuples, such as [{erlang, "a func- tional language"}, {ruby, "an OO language"}]. Write a function that ac- cepts the list and a keyword and returns the associated value for the keyword.
pick(List, Keyword) -> [Description || {K, Description} <- List, K == Keyword].

%  Consider a shopping list that looks like [{item quantity price}, ...]. Write a list comprehension that builds a list of items of the form [{item total_price}, ...], where total_price is quantity times price.
items_with_price(List) -> [{Item, Price * Quantity} || {Item, Quantity, Price } <- List].

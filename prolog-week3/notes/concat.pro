/*

concatenate([1,2], [3], What)
Calls:
0 1 | [2], [3], [1, Tail2A] % we dont' know what tail2A is so we dig
1 2 | [], [3], [2, Tail2B] % we don't know what tail2B is so we dig
2 [], [3], [Tail2C]  % we unify tail2C as 3 with concatenate([], List, List)
1 2 | [], [3], [2, 3] % Tail2b is 3
0 1 | [2], [3], [1, 2, 3] % Tail2a is [2,3]
% what = [1,2,3]

*/
concatenate([], List, List).
concatenate([Head|Tail1], List, [Head|Tail2]) :- concatenate(Tail1, List, Tail2).

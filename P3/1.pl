% 1. Write a predicate to generate the list of all subsets with all elements of a given list.
% Eg: [2, 3, 4] N=2 => [[2,3],[2,4],[3,4]]

%Mathematical model
% combinari(l1...ln, k) =
% 	[], k = 0
% 	l1 + combinari(l2...ln, k - 1), k > 0
% 	combinari(l2...ln, k), k > 0

% combinari(L:list, K:number, R:list)
% combinari(i, o)

combinari(_, 0, []).
combinari([H|T], K, [H|R]) :-
    K > 0,
    NK is K - 1,
    combinari(T, NK, R).
combinari([_|T], K, R) :-
    K > 0,
    combinari(T, K, R).

% allsolutions(L:list, N:number, R:list)
% allsolutions(i, i, o)

allsolutions(L, N, R) :-
    findall(RPartial, combinari(L, N, RPartial), R).
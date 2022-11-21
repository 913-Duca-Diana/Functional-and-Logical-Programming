/*6.a. Write a predicate to test ifa list is a set.
  b. Write a predicate to remove the first three occurrencesof an element in a list.
  If the element occurs less than three times, all occurrenceswill be removed.
 */
%a)
/*Mathematical model
 * numberOcc(l1..ln,e)={0, n=0
 * 						1+numberOcc(l2...ln,e), if l1=e
 * 						numberOcc(l2...ln), otherwise
 */
%flowmodel(i,i,o)
%numberOcc(L-list, E-number, R-number)

numberOcc([],_,0).
numberOcc([H|T],E,R1):-
    H=:=E,
    numberOcc(T,E,R),
    R1 is R+1.
numberOcc([H|T],E,R):-
    H=\=E,
    numberOcc(T,E,R).
/*Mathematical model
 * isSet(l1..ln)= False, numberOcc(l1..ln,l1)>1
 * 				  True, n=0
 * 				  numberOcc(l2...ln), otherwise
 */
%flowmodel(i,o)
%isSet(L-list,R-boolean)

isSet([]).
isSet([H|T]):-
    numberOcc([H|T],H,R1),
    R1=:=1,
    isSet(T),!.
%b)
/*Mathematical model
 * removekOcc(l1...ln,e,k)=[], n=0
 * 			  l1...ln, k=0
 * 			  removekOcc(l2...ln,k-1), l1=e	
 * 			  l1+removekOcc(l2...ln,k), otherwise
 */
%removekOcc(L-list,E-number,K-number,R-list)
rmvkOcc([], _, _, []) :- !.
rmvkOcc( L, _, 0, L):-!.
rmvkOcc([H|T], E, K, R):-
    H=:=E,
    K1 is K-1,
    rmvkOcc(T,E,K1,R).
rmvkOcc([H|T],E,K,[H|R]):-
    H=\=E,
    rmvkOcc(T,E,K,R).
%flowmodel(i,i,o)
%remove3occ(L-list,E-number,R-list)
remove3occ(L,E,R):-
    numberOcc(L,E,R1),
    R1<3,
    N is numberOcc(L,E,R1),
    rmvkOcc(L,E,N,R).
remove3occ(L,E,R):-
    numberOcc(L,E,R1),
    R1>=3,
    rmvkOcc(L,E,3,R).










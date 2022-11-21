/*
  5.a. Write a predicate to compute the union of two sets.
  b. Write a predicate to determine the set of all the pairs of elements in a list. 
  Eg.: L = [a b c d] =>[[a b] [a c] [a d] [b c] [b d] [c d]].
*/
/* Mathematical model
 * remove_occurance(l1...ln,e){
 * 								[], n=0
 * 								remove_occurance(l2...ln,e), e=l1
 * 								l1+remove_occurance(l2...ln,e), otherwise
 */
%remove_occ(L-List, E-number, R-List)
%flowmodel(i,i,o)

remove_occ([],_,[]).
remove_occ([H|T],E,R):-
    H=:=E,
    remove_occ(T,E,R).

remove_occ([H|T],E,[H|R]):-
    H=\=E,
    remove_occ(T,E,R).

/* Mathematical model
 * union(a1...an,b1...bm)=[], n=0 and m=0
 * 							a1+union(remove_occ(a1...an,a1), remove_occ(b1...bn, a1), n>0
 * 							union(b1...bm,[]), n=0
 */
%flowmodel(i,i,o)
%union(A-list,B-list,R-list)
union([],[],[]).
union([H|T],B,[H|R]):-
    remove_occ([H|T],H,R1),
    remove_occ(B,H,R2),
    union(R1,R2,R).

union([],B,R):-
    union([],B,R).

%b)
    
    
